--
--   Example for Ada Study Group 2022 - Session 3
--   Units of Measure
--

--
--  GNAT Meters Kilometers Seconds package
--
with System.Dim.Mks;
with Ada.Numerics.Generic_Elementary_Functions;
with Ada.Text_IO;

package body Example3 is

   package Units renames System.Dim.Mks;

   package Elementary_Functions is new
     Ada.Numerics.Generic_Elementary_Functions (Units.Mks_Type);

   --
   --  Accleration is not defined by default, however we can derive it from
   --  the Mks_type and specify the dimension aspect
   --
   subtype Acceleration is Units.Mks_Type with
     Dimension => (Symbol => "m/s^2",
                   Meter  =>  1,
                   Second => -2,
                   others =>  0);

   --  If Michael Jordan has a vertical leap of 1.29 m, then what is his
   --  takeoff speed and his hang time (total time to move upwards to the peak
   --  and then return to the ground)?
   procedure Run_Example_3 is

      use Units;
      use Elementary_Functions;

      Gravity     : constant Acceleration := -9.8 * m / s;
      MJ_Vertical : constant Length       := 1.29 * m;

      Takeoff_Speed : Speed;
      Hang_Time     : Speed;

   begin

      Ada.Text_IO.New_Line;
      Ada.Text_IO.Put_Line ("*********** Example 3 ****************");
      Ada.Text_IO.New_Line;

      --
      --  Velocity_Final**2 = Velocity_Initial**2 + 2*a*d
      --
      Takeoff_Speed := Sqrt (-2.0 * Gravity * MJ_Vertical);

      Ada.Text_IO.Put_Line
        ("Michael Jordan's takeoff speed was " & Takeoff_Speed'Img &
           " meters per second.");

      --
      --  To find hang time, find time to peak, then double it
      --  Velocity_Final = Velocity_Initial + a * t
      --
      Hang_Time := -Takeoff_Speed / Gravity * 2.0;

      Ada.Text_IO.Put_Line
        ("Michael Jordan's hang time was " & Hang_Time'Img & " seconds.");

   end Run_Example_3;

end Example3;
