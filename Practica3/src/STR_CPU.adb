pragma Task_Dispatching_Policy (FIFO_Within_Priorities);
pragma Queuing_Policy (Priority_Queuing);
pragma Locking_Policy (Ceiling_Locking);

with Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;

package body STR_CPU is
   task body CPU is
      blocked : Boolean := False;
      i : Integer := 0;
   begin
      loop
         select
            when blocked = False =>
               accept run do
                  blocked := True;
                  i := i + 1;
                  delay Duration(sampling_time-quantum/2.0);
                  blocked := False;
               end run;
         or
            terminate;
         end select;
         delay Duration(quantum);
      end loop;
   end CPU;
end STR_CPU;
