package body Adastra.Time is

    function UT_Fractional_Day (Date: Time_UT) return Time_Fractional_Day is
        begin
             return Time_Fractional_Day (Date.Day) +
                Time_Fractional_Day (Date.Hour) / 24.0 +
                Time_Fractional_Day (Date.Minutes) / 60.0 +
                Time_Fractional_Day (Date.Seconds) / 3600.0;
        end UT_Fractional_Day;

    function UT_Julian_Day (Date: Time_UT) return Time_Julian_Day is
            Y,M,D,A,B : Precision_Float;
        begin
            if Date.Month > 2 then
                Y := Precision_Float (Date.Year);
                M := Precision_Float (Date.Month);
            else
                Y := Precision_Float (Date.Year - 1);
                M := Precision_Float (Date.Month + 12);
            end if;

            D := Precision_Float (Date.Day);
            A := Precision_Float'Floor(Y / 100.0);
            B := 2.0 - A + Precision_Float'Floor(A / 4.0);

            return Time_Julian_Day (B + 365.25 * Y + 30.6001 * (M + 1.0) + D + 1_720_994.5);
        end UT_Julian_Day;

end Adastra.Time;