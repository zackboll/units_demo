--
--   Example for Ada Study Group 2022 - Session 3
--   Units of Measure
--

with Ada.Text_IO;
--
--  GNAT Meters Kilometers Seconds package
--
with System.Dim.Long_Mks;

package body Example2 is

   package Units renames System.Dim.Long_Mks;

   --
   --  Define prefixes for Inductance and Magnetic_Flux.  Package
   --  System.Dim.Generic_Mks.Generic_Other_Prefixes defines many,
   --  not all
   --
   --  Turn off warnings for this section of code, these prefixes would
   --  normally be defined in a library section
   --
   pragma Warnings (Off);

   --  SI prefixes for Henry

   uH  : constant Units.Inductance := 1.0E-06;  -- micro (u)
   mH  : constant Units.Inductance := 1.0E-03;  -- milli
   cH  : constant Units.Inductance := 1.0E-02;  -- centi
   dH  : constant Units.Inductance := 1.0E-01;  -- deci
   daH : constant Units.Inductance := 1.0E+01;  -- deka
   hH  : constant Units.Inductance := 1.0E+02;  -- hecto
   kH  : constant Units.Inductance := 1.0E+03;  -- kilo
   MeH : constant Units.Inductance := 1.0E+06;  -- mega

   --  SI prefixes for Magnetic Flux

   uWb  : constant Units.Magnetic_Flux := 1.0E-06;  -- micro (u)
   mWb  : constant Units.Magnetic_Flux := 1.0E-03;  -- milli
   cWb  : constant Units.Magnetic_Flux := 1.0E-02;  -- centi
   dWb  : constant Units.Magnetic_Flux := 1.0E-01;  -- deci
   daWb : constant Units.Magnetic_Flux := 1.0E+01;  -- deka
   hWb  : constant Units.Magnetic_Flux := 1.0E+02;  -- hecto
   kWb  : constant Units.Magnetic_Flux := 1.0E+03;  -- kilo
   MeWb : constant Units.Magnetic_Flux := 1.0E+06;  -- mega

   pragma Warnings (On);

   --
   --  A hollow air cored inductor coil consists of 500 turns of copper wire
   --  which produces a magnetic flux of 10mWb when passing a DC current of
   --  10 amps. Calculate the self-inductance of the coil in milliHenries.
   --
   procedure Run_Example_2 is

      use Units;

      Number_Of_Turns      : constant Time := 500.0 * s;
      Coil_Magnetic_Flux   : constant Magnetic_Flux := 10.0 * mWb;
      Coil_DC_Current      : constant Electric_Current := 10.0 * A;

      Coil_Self_Inductance : Inductance;

   begin

      Ada.Text_IO.New_Line;
      Ada.Text_IO.Put_Line ("*********** Example 2 ****************");
      Ada.Text_IO.New_Line;

      Coil_Self_Inductance :=
        Number_Of_Turns * Coil_Magnetic_Flux / Coil_DC_Current;

      Ada.Text_IO.Put_Line
        ("The inductance of the coil is " &
           Inductance'Image (Coil_Self_Inductance / mH) & " milli-Henries.");

   end Run_Example_2;

end Example2;
