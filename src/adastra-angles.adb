package body Adastra.Angles is

    function Angle_Decimals_To_Radians (Deg: Angle_Decimals) return Angle_Radians is
        -- Convert decimal degrees to radians
    begin
        return Angle_Radians (Pi / 180.0 * Deg);
    end

    function Angle_Radians_To_Decimals (Rad: Angle_Radians) return Angle_Decimals is
        -- Convert radians to decimal degrees
    begin
        return Angle_Decimals (180.0 / Pi * Rad);
    end

    function Angle_DMS_To_Decimals (Sex: Angle_DMS) return Angle_Decimals is
        -- Convert sexagesimal degrees to decimal degrees
    begin
        return Angle_Decimals (Sex.Decimals) + Angle_Decimals (Sex.Minutes) / 60.0 +
                Angle_Decimals (Sex.Seconds) / 3600.0;
    end

end Adastra.Angles;