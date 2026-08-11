with Adastra.Types; use Adastra.Types;

package body Adastra.Zodiac is

    function Ecliptic_To_Zodiac (Ecliptic_Deg: Angle_Deg) return Zodiac_Position is
        Total_Val  : constant Precision_Float := Precision_Float (Ecliptic_Deg);
        Sign_Index : constant Natural := Natural (Precision_Float'Floor (Total_Val / 30.0));
        Rem_Deg    : constant Precision_Float := Total_Val - (Precision_Float (Sign_Index) * 30.0);
        Deg_Int    : constant Natural := Natural (Precision_Float'Floor (Rem_Deg));
        Rem_Min    : constant Precision_Float := (Rem_Deg - Precision_Float (Deg_Int)) * 60.0;
        Min_Int    : constant Natural := Natural (Precision_Float'Floor (Rem_Min));
        Sec_Int    : constant Natural := Natural (Precision_Float'Floor ((Rem_Min - Precision_Float (Min_Int)) * 60.0));
    begin
        return (Sign    => Zodiac_Sign'Val (Sign_Index mod 12),
            Degrees => Deg_Int,
            Minutes => Min_Int,
            Seconds => Sec_Int);
    end Ecliptic_To_Zodiac;

end Adastra.Zodiac;