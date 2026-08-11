package body Adastra.Angles is

    function Angle_Deg_To_Rad (Deg: Angle_Deg) return Angle_Rad is
        -- Convert decimal degrees to radians
    begin
        return Angle_Rad (Pi / 180.0 * Deg);
    end

    function Angle_Rad_To_Deg (Rad: Angle_Rad) return Angle_Deg is
        -- Convert radians to decimal degrees
    begin
        return Angle_Deg (180.0 / Pi * Rad);
    end

    function Angle_Dms_To_Deg (Dms: Angle_Dms) return Angle_Deg is
        -- Convert sexagesimal degrees to decimal degrees
    begin
        return Angle_Deg (Dms.Degrees) + Angle_Deg (Dms.Minutes) / 60.0 +
                Angle_Deg (Dms.Seconds) / 3600.0;
    end

end Adastra.Angles;