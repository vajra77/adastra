package body Adastra.Angles is

    function Angle_Degrees_To_Radians (Deg: Angle_Degrees) return Angle_Radians is
        -- Convert decimal degrees to radians
    begin
        return Angle_Radians (Pi / 180.0 * Deg);
    end

    function Angle_Radians_To_Degrees (Rad: Angle_Radians) return Angle_Degrees is
        -- Convert radians to decimal degrees
    begin
        return Angle_Degrees (180.0 / Pi * Rad);
    end

    function Angle_Sex_To_Degrees (Sex: Angle_Sex) return Angle_Degrees is
        -- Convert sexagesimal degrees to decimal degrees
    begin
        return Angle_Degrees (Sex.Degrees) + Angle_Degrees (Sex.Minutes) / 60.0 +
                Angle_Degrees (Sex.Seconds) / 3600.0;
    end

end Adastra.Angles;