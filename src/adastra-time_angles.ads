with Adastra.Types; use Adastra.Types;

package Adastra.Time_Angles is

    ----------------------------
    -- Time types and methods
    ----------------------------
    type Time_Year    is new Positive range 1977 .. 2050;
    type Time_Month   is new Positive range 1 .. 12;
    type Time_Day     is new Positive range 1 .. 31;
    type Time_Hour    is new Natural range 0 .. 23;
    type Time_Minutes is new Natural range 0 .. 59;
    type Time_Seconds is new Natural range 0 .. 59;

    type Time_Zone is new Integer range -12 .. 12;

    type Time_Fractional_Day is new Precision_Float;
    type Time_Julian_Day     is new Precision_Float;

    type Time_UT is tagged private;

    function Make_Time_UT
      (Year    : Time_Year;
       Month   : Time_Month;
       Day     : Time_Day;
       Hour    : Time_Hour    := 0;
       Minutes : Time_Minutes := 0;
       Seconds : Time_Seconds := 0) return Time_UT'Class;

    function Year    (Self : Time_UT) return Time_Year;
    function Month   (Self : Time_UT) return Time_Month;
    function Day     (Self : Time_UT) return Time_Day;
    function Hour    (Self : Time_UT) return Time_Hour;
    function Minutes (Self : Time_UT) return Time_Minutes;
    function Seconds (Self : Time_UT) return Time_Seconds;

    function Fractional_Day (Self : Time_UT) return Time_Fractional_Day;
    function Julian_Day     (Self : Time_UT) return Time_Julian_Day;

    type Time_LCT is new Time_UT with private;

    function Make_Time_LCT
      (Year    : Time_Year;
       Month   : Time_Month;
       Day     : Time_Day;
       Hour    : Time_Hour    := 0;
       Minutes : Time_Minutes := 0;
       Seconds : Time_Seconds := 0;
       Zone    : Time_Zone    := 0) return Time_UT'Class;

    function Zone (Self : Time_LCT) return Time_Zone;

    overriding
    function Fractional_Day (Self : Time_LCT) return Time_Fractional_Day;

    ----------------------------
    -- Angles types and methods
    ----------------------------
    type Angle_Rad is new Precision_Float range 0.0 .. (2.0 * Pi);
    type Angle_Deg is new Precision_Float range 0.0 .. 360.0;

    type Angle is tagged private;

    function Make_Angle (Deg : Angle_Deg) return Angle;
    function Degrees (Self : Angle) return Angle_Deg;
    function Radians (Self : Angle) return Angle_Rad;

private

    type Time_UT is tagged record
        Year    : Time_Year;
        Month   : Time_Month;
        Day     : Time_Day;
        Hour    : Time_Hour;
        Minutes : Time_Minutes;
        Seconds : Time_Seconds;
    end record;

    type Time_LCT is new Time_UT with record
        Zone : Time_Zone := 0;
    end record;

    type Angle is tagged record
        Value   : Angle_Deg;
    end record;

end Adastra.Time_Angles;