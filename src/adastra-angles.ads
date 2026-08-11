with Adastra.Types; use Adastra.Types;

package Adastra.Angles is
    type Angle_Radians is new Precision_Float range 0.0 .. (2.0 * Pi);
    type Angle_Decimals is new Precision_Float range 0.0 .. 360.0;

    type Angle_DMS is record
        Degrees : Natural range 0 .. 360;
        Minutes : Natural range 0 .. 59;
        Seconds : Natural range 0 .. 59;
    end record;

    function Angle_Decimals_To_Radians (Deg: Angle_Decimals) return Angle_Radians;
    function Angle_Radians_To_Decimals (Rad: Angle_Radians) return Angle_Decimals;
    function Angle_DMS_To_Decimals (Sex: Angle_DMS) return Angle_Decimals;
end Adastra.Angles;