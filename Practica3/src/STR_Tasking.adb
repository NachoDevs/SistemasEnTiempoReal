pragma Task_Dispatching_Policy (FIFO_Within_Priorities);
pragma Queuing_Policy (Priority_Queuing);
pragma Locking_Policy (Ceiling_Locking);

with Ada.Real_Time; use Ada.Real_Time;
with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;
with Ada.Text_IO; use Ada.Text_IO;

with STR_CPU; use STR_CPU;
with STR_Chrono;

package body STR_Tasking is
   procedure Tiempo_Computo(tmin, tmax, id : Integer) is
      waiting_time : Float;
      ttotal : Float := 0.0;
      counter : Integer := 0;
   begin
      Reset(G);

      waiting_time := Float(tmin) + Float(tmax-tmin)*Random(G);

      loop
         exit when ttotal > waiting_time/1000.0;

         ttotal := ttotal+sampling_time;

         counter := counter + 1;

         if counter >= Integer(1.0/sampling_time) then
            --Put_Line("Executing => Id:" & id'Img & ". Cycle execution time:" & Integer(ttotal)'Img);
            STR_Chrono.Count(id);
            STR_Chrono.Paint;
            counter := 0;
         end if;

         CPU.run;
      end loop;
   end Tiempo_Computo;
end STR_Tasking;
