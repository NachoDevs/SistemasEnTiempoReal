pragma Task_Dispatching_Policy (FIFO_Within_Priorities);
pragma Queuing_Policy (Priority_Queuing);
pragma Locking_Policy (Ceiling_Locking);

with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;

package STR_Chrono is
   procedure Count(id : Integer);
   procedure PaintSimple;
   procedure Paint;
private
   N : constant Integer := 3;
   M : constant Integer := 50;

   data : array(1..N,1..M) of Boolean := (others => (others => False));

   procedure Shift;
end STR_Chrono;
