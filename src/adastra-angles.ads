with Adastra.Types; use Adastra.Types;

package Adastra.Angles is
    type Angle_Rad is new Precision_Float range 0.0 .. (2.0 * Pi);
    type Angle_Deg is new Precision_Float range 0.0 .. 360.0;

    type Angle_Dms is record
        Degrees : Natural range 0 .. 360;
        Minutes : Natural range 0 .. 59;
        Seconds : Natural range 0 .. 59;
    end record;

    function Angle_Deg_To_Rad (Deg: Angle_Deg) return Angle_Rad;
    function Angle_Rad_To_Deg (Rad: Angle_Rad) return Angle_Deg;
    function Angle_Dms_To_Deg (Dms: Angle_Dms) return Angle_Deg;
end Adastra.Angles;