with Ada.Calendar;
with Adastra.Types; use Adastra.Types;

package Adastra.Time is

    type Months is (Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec);
    type Time_Year is new Positive range 1977 .. 2050;
    type Time_Month is new Positive range 1 .. 12;
    type Time_Day is new Positive range 1 .. 31;
    type Time_Hour is new Natural range 0 .. 23;
    type Time_Minutes is new Natural range 0 .. 59;
    type Time_Seconds is new Natural range 0 .. 59;

    type Time_Zone is new Integer range -12 .. 12;

    type Time_Fractional_Day is new Precision_Float;
    type Time_Julian_Day is new Precision_Float;

    type Time_UT is record
        Year : Time_Year;
        Month : Time_Month;
        Day :  Time_Day;
        Hour : Time_Hour;
        Minutes : Time_Minutes;
        Seconds : Time_Minutes;
    end record;

    type Time_LCT is record
        Zone : Time_Zone;
        Year : Time_Year;
        Month : Time_Month;
        Day :  Time_Day;
        Hour : Time_Hour;
        Minutes : Time_Minutes;
        Seconds : Time_Seconds;
    end record;

    function UT_Fractional_Day (Date: Time_UT) return Time_Fractional_Day;
    function UT_Julian_Day (Date: Time_UT) return Time_Julian_Day;
end Adastra.Time;