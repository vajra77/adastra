with Adastra.Angles; use Adastra.Angles;

package Adastra.Zodiac is

    type Zodiac_Sign is
        (Aries, Taurus, Gemini, Cancer,
            Leo, Virgo, Libra, Scorpio,
            Sagittarius, Capricorn, Aquarius, Pisces);

    type Zodiac_Position is record
          Sign    : Zodiac_Sign;
          Degrees : Natural range 0 .. 29;
          Minutes : Natural range 0 .. 59;
          Seconds : Natural range 0 .. 59;
    end record;

    function Ecliptic_To_Zodiac (Ecliptic_Deg: Angle_Deg) return Zodiac_Position;
end Adastra.Zodiac;