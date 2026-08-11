package body Adastra.Time is

   function Make_Julian_Day
     (Year    : Integer;
      Month   : Positive;
      Day     : Positive;
      Hour    : Natural := 0;
      Minute  : Natural := 0;
      Second  : Natural := 0;
      TZ_Offset_Hours : Precision_Float := 0.0) return Julian_Day
   is
      Y : Precision_Float;
      M : Precision_Float;
      A, B : Precision_Float;

      Day_Fraction : Precision_Float;
      UTC_Hour     : Precision_Float;
   begin
      -- Convertiamo l'ora locale in UTC sottraendo il fuso orario
      UTC_Hour := Precision_Float (Hour) + (Precision_Float (Minute) / 60.0) +
                  (Precision_Float (Second) / 3600.0) - TZ_Offset_Hours;

      Day_Fraction := Precision_Float (Day) + (UTC_Hour / 24.0);

      if Month <= 2 then
         Y := Precision_Float (Year - 1);
         M := Precision_Float (Month + 12);
      else
         Y := Precision_Float (Year);
         M := Precision_Float (Month);
      end if;

      -- Correzione del Calendario Gregoriano (dal 15 ottobre 1582)
      A := Precision_Float'Floor (Y / 100.0);
      B := 2.0 - A + Precision_Float'Floor (A / 4.0);

      return Julian_Day (Precision_Float'Floor (365.25 * (Y + 4716.0)) +
                        Precision_Float'Floor (30.6001 * (M + 1.0)) +
                        Day_Fraction + B - 1524.5);
   end Make_Julian_Day;

   function Date_To_Julian_Day
     (Date : Ada.Calendar.Time; TZ_Offset_Hours : Precision_Float := 0.0) return Julian_Day
   is
      Y  : Ada.Calendar.Year_Number;
      M  : Ada.Calendar.Month_Number;
      D  : Ada.Calendar.Day_Number;
      Sec : Ada.Calendar.Day_Duration;

      H, Min, S : Natural;
      Remaining : Precision_Float;
   begin
      Ada.Calendar.Split (Date, Y, M, D, Sec);

      Remaining := Precision_Float (Sec);
      H   := Natural (Precision_Float'Floor (Remaining / 3600.0));
      Remaining := Remaining - Precision_Float (H * 3600);
      Min := Natural (Precision_Float'Floor (Remaining / 60.0));
      S   := Natural (Remaining - Precision_Float (Min * 60));

      return Make_Julian_Day (Y, M, D, H, Min, S, TZ_Offset_Hours);
   end Date_To_Julian_Day;

   function Julian_Day_To_Centuries (JD : Julian_Day) return Julian_Centuries is
   begin
      -- J2000.0 corrisponde al Julian Day 2451545.0
      return Julian_Centuries ((Precision_Float (JD) - 2451545.0) / 36525.0);
   end Julian_Day_To_Centuries;

   function Calculate_GST (JD : Julian_Day) return Angle_Degrees is
      T  : constant Julian_Centuries := Julian_Day_To_Centuries (JD);
      T_Val : constant Precision_Float := Precision_Float (T);

      -- Formula IAU per Greenwich Mean Sidereal Time (GMST) in gradi
      GMST : Precision_Float;
   begin
      GMST := 280.46061837 +
              (36000.770053608 * T_Val) +
              (0.000387933 * (T_Val ** 2)) -
              ((T_Val ** 3) / 38710000.0);

      return Normalize_360 (GMST);
   end Calculate_GST;

   function Calculate_LST
     (JD : Julian_Day; Longitude : Longitude_Type) return Angle_Degrees
   is
      GST : constant Angle_Degrees := Calculate_GST (JD);
      LST : constant Precision_Float := Precision_Float (GST) + Precision_Float (Longitude);
   begin
      return Normalize_360 (LST);
   end Calculate_LST;

end Adastra.Time;