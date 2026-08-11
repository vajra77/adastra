with Adastra.Types; use Adastra.Types;

package Adastra.Angles is
    type Angle_Rad is new Precision_Float range 0.0 .. (2.0 * Pi);
    type Angle_Deg is new Precision_Float range 0.0 .. 360.0;

    type Angle is tagged private;

    function Make_Angle (Deg : Angle_Deg) return Angle;
    function Degrees (Self : Angle) return Angle_Deg;
    function Radians (Self : Angle) return Angle_Rad;

private

    type Angle is tagged record
        Value   : Angle_Deg;
    end record;

end Adastra.Angles;