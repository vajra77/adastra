package Adastra.Angles is
    Pi : constant := 3.14159_26535_89793_23846;
    type Angle_Radians is delta 0.001 range 0.0 .. (2.0 * Pi);
    type Angle_Degrees is delta 0.01 range 0.0 .. 360.0;

    type Angle_Sex is record
        Degrees : Natural range 0 .. 360;
        Minutes : Natural range 0 .. 59;
        Seconds : Natural range 0 .. 59;
    end record;

    function Angle_Degrees_To_Radians (Deg: Angle_Degrees) return Angle_Radians
    function Angle_Radians_To_Degrees (Rad: Angle_Radians) return Angle_Degrees
    function Angle_Sex_To_Degrees (Sex: Angle_Sex) return Angle_Degrees
end Adastra.Angles;