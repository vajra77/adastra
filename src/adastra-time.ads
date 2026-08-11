with Adastra.Types; use Adastra.Types;

package Adastra.Time is

    type Time_Year    is new Positive range 1977 .. 2050;
    type Time_Month   is new Positive range 1 .. 12;
    type Time_Day     is new Positive range 1 .. 31;
    type Time_Hour    is new Natural range 0 .. 23;
    type Time_Minutes is new Natural range 0 .. 59;
    type Time_Seconds is new Natural range 0 .. 59;

    type Time_Zone is new Integer range -12 .. 12;

    type Time_Fractional_Day is new Precision_Float;
    type Time_Julian_Day     is new Precision_Float;

    ---------------------------------------------------------------------------
    -- Classe Base Privata: Time_UT
    ---------------------------------------------------------------------------
    type Time_UT is tagged private;

    -- Costruttore per Time_UT
    function Make_Time_UT
      (Year    : Time_Year;
       Month   : Time_Month;
       Day     : Time_Day;
       Hour    : Time_Hour    := 0;
       Minutes : Time_Minutes := 0;
       Seconds : Time_Seconds := 0) return Time_UT'Class;

    -- Getter (interfaccia pubblica)
    function Year    (Self : Time_UT) return Time_Year;
    function Month   (Self : Time_UT) return Time_Month;
    function Day     (Self : Time_UT) return Time_Day;
    function Hour    (Self : Time_UT) return Time_Hour;
    function Minutes (Self : Time_UT) return Time_Minutes;
    function Seconds (Self : Time_UT) return Time_Seconds;

    -- Metodi principali
    function Fractional_Day (Self : Time_UT) return Time_Fractional_Day;
    function Julian_Day     (Self : Time_UT) return Time_Julian_Day;

    ---------------------------------------------------------------------------
    -- Classe Derivata Privata: Time_LCT
    ---------------------------------------------------------------------------
    type Time_LCT is new Time_UT with private;

    -- Costruttore per Time_LCT
    function Make_Time_LCT
      (Year    : Time_Year;
       Month   : Time_Month;
       Day     : Time_Day;
       Hour    : Time_Hour    := 0;
       Minutes : Time_Minutes := 0;
       Seconds : Time_Seconds := 0;
       Zone    : Time_Zone    := 0) return Time_UT'Class;

    -- Getter aggiuntivo per LCT
    function Zone (Self : Time_LCT) return Time_Zone;

    -- Override del metodo Fractional_Day
    overriding
    function Fractional_Day (Self : Time_LCT) return Time_Fractional_Day;

private

    -- Definizione reale della struttura di Time_UT
    type Time_UT is tagged record
        Year    : Time_Year;
        Month   : Time_Month;
        Day     : Time_Day;
        Hour    : Time_Hour;
        Minutes : Time_Minutes;
        Seconds : Time_Seconds;
    end record;

    -- Definizione reale della struttura di Time_LCT
    type Time_LCT is new Time_UT with record
        Zone : Time_Zone := 0;
    end record;

end Adastra.Time;