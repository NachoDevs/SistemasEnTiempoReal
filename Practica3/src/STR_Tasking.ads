pragma Task_Dispatching_Policy (FIFO_Within_Priorities);
pragma Queuing_Policy (Priority_Queuing);
pragma Locking_Policy (Ceiling_Locking);

with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;

package STR_Tasking is
   procedure Tiempo_Computo(tmin, tmax, id : Integer);
private
   G : Generator;
end STR_Tasking;
