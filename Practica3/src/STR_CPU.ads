pragma Task_Dispatching_Policy (FIFO_Within_Priorities);
pragma Queuing_Policy (Priority_Queuing);
pragma Locking_Policy (Ceiling_Locking);

with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;

package STR_CPU is
   sampling_time : Float := 0.1;
   task CPU is
      pragma Priority(10);
      entry run;
   end CPU;
private
   quantum : constant Float := 0.001;
end STR_CPU;
