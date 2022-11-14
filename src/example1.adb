--
--   Example for Ada Study Group 2022 - Session 3
--   Units of Measure
--

--
--  GNAT Meters Kilometers Seconds package
--
with Ada.Text_IO;
with System.Dim.Float_Mks;

package body Example1 is

   package Units renames System.Dim.Float_Mks;

   --
   --  Accleration is not defined by default, however we can derive it from
   --  the Mks_type and specify the dimension aspect
   --
   subtype Acceleration is Units.Mks_Type with
     Dimension => (Symbol => "m/s^2",
                   Meter  =>  1,
                   Second => -2,
                   others =>  0);

   --
   --  An airplane accelerates down a runway at 3.20 m/s2 for 32.8 s until is
   --  finally lifts off the ground. Determine the distance traveled before
   --  takeoff
   --
   procedure Run_Example_1 is
      use Units;

      Plane_Acceleration : constant Acceleration := 3.2 * m / (s**2);
      Elapsed_Time       : constant Time := 32.8;

      Takeoff_Distance : Length;

   begin

      Ada.Text_IO.New_Line;
      Ada.Text_IO.Put_Line ("*********** Example 1 ****************");
      Ada.Text_IO.New_Line;

      --
      --  d = v(i)*t + 0.5*a*(t**2)
      --
      Takeoff_Distance := 0.5 * Plane_Acceleration * Elapsed_Time ** 2;
      Ada.Text_IO.Put_Line
        ("The plane took " & Takeoff_Distance'Img & " meters to takeoff.");

   end Run_Example_1;

end Example1;
