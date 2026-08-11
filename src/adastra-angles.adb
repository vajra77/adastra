package body Adastra.Angles is

    function Make_Angle (Deg : Angle_Deg) return Angle is
    begin
        return Angle'(Value => Deg)
    end

    function Degrees (Self : Angle) return Angle_Deg is
    begin
        return Self.Value
    end

    function Radians (Self : Angle) return Angle_Rad is
    begin
        return Angle_Rad(Pi / 180.0 * Self.Value)
    end

end Adastra.Angles;