package body Adastra.Time is

    ---------------------------------------------------------------------------
    -- Costruttori e Getter per Time_UT
    ---------------------------------------------------------------------------

    function Make_Time_UT
      (Year    : Time_Year;
       Month   : Time_Month;
       Day     : Time_Day;
       Hour    : Time_Hour    := 0;
       Minutes : Time_Minutes := 0;
       Seconds : Time_Seconds := 0) return Time_UT'Class is
    begin
        return Time_UT'(Year    => Year,
                Month   => Month,
                Day     => Day,
                Hour    => Hour,
                Minutes => Minutes,
                Seconds => Seconds);
    end Make_Time_UT;

    function Year    (Self : Time_UT) return Time_Year    is (Self.Year);
    function Month   (Self : Time_UT) return Time_Month   is (Self.Month);
    function Day     (Self : Time_UT) return Time_Day     is (Self.Day);
    function Hour    (Self : Time_UT) return Time_Hour    is (Self.Hour);
    function Minutes (Self : Time_UT) return Time_Minutes is (Self.Minutes);
    function Seconds (Self : Time_UT) return Time_Seconds is (Self.Seconds);

    ---------------------------------------------------------------------------
    -- Metodi di calcolo per Time_UT
    ---------------------------------------------------------------------------

    function Fractional_Day (Self : Time_UT) return Time_Fractional_Day is
    begin
        return Time_Fractional_Day (Self.Day) +
               Time_Fractional_Day (Self.Hour) / 24.0 +
               Time_Fractional_Day (Self.Minutes) / 1440.0 +
               Time_Fractional_Day (Self.Seconds) / 86400.0;
    end Fractional_Day;

    function Julian_Day (Self : Time_UT) return Time_Julian_Day is
        Y, M, D, A, B : Precision_Float;
    begin
        if Self.Month > 2 then
            Y := Precision_Float (Self.Year);
            M := Precision_Float (Self.Month);
        else
            Y := Precision_Float (Self.Year - 1);
            M := Precision_Float (Self.Month + 12);
        end if;

        D := Precision_Float (Self.Fractional_Day);
        A := Precision_Float'Floor (Y / 100.0);
        B := 2.0 - A + Precision_Float'Floor (A / 4.0);

        return Time_Julian_Day (B + Precision_Float'Floor (365.25 * Y) +
               Precision_Float'Floor (30.6001 * (M + 1.0)) + D + 1_720_994.5);
    end Julian_Day;

    ---------------------------------------------------------------------------
    -- Costruttori, Getter e Metodi per Time_LCT
    ---------------------------------------------------------------------------

    function Make_Time_LCT
      (Year    : Time_Year;
       Month   : Time_Month;
       Day     : Time_Day;
       Hour    : Time_Hour    := 0;
       Minutes : Time_Minutes := 0;
       Seconds : Time_Seconds := 0;
       Zone    : Time_Zone    := 0) return Time_UT'Class is
    begin
        return Time_LCT'(Year    => Year,
                Month   => Month,
                Day     => Day,
                Hour    => Hour,
                Minutes => Minutes,
                Seconds => Seconds,
                Zone    => Zone);
    end Make_Time_LCT;

    function Zone (Self : Time_LCT) return Time_Zone is (Self.Zone);

    overriding
    function Fractional_Day (Self : Time_LCT) return Time_Fractional_Day is
        Hours_In_UT : Standard.Float := Standard.Float (Self.Hour) - Standard.Float (Self.Zone);
    begin
        return Time_Fractional_Day (Self.Day) +
               Time_Fractional_Day (Hours_In_UT) / 24.0 +
               Time_Fractional_Day (Self.Minutes) / 1440.0 +
               Time_Fractional_Day (Self.Seconds) / 86400.0;
    end Fractional_Day;

end Adastra.Time;