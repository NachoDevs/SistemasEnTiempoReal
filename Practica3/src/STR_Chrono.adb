pragma Task_Dispatching_Policy (FIFO_Within_Priorities);
pragma Queuing_Policy (Priority_Queuing);
pragma Locking_Policy (Ceiling_Locking);

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;

package body STR_Chrono is
   procedure Count(id : Integer) is
   begin
      Shift;
      for i in 1..N loop
         if i = id then
            data(i,M) := True;
         else
            data(i,M) := False;
         end if;
      end loop;
   end Count;

   procedure PaintSimple is
   begin
      Ada.Text_IO.Put(ASCII.ESC & "[2J");
      for i in 1..N loop
         New_Line(3);
         Put(i'Img & ": ");
         for j in 1..M loop
            if data(i,j) = True then
               Put("-");
            else
               Put("_");
            end if;
         end loop;
      end loop;
      New_Line(1);
   end PaintSimple;

   procedure Paint is
   begin
      Ada.Text_IO.Put(ASCII.ESC & "[2J");
      New_Line(3);

      for i in 1..N loop
         for k in 1..3 loop
            if k = 2 then
               Put(i'Img & ": ");
            else
               Put("    ");
            end if;
            for j in 1..M loop
               if k = 1 then
                  if data(i,j) = True then
                     if j > 1 then
                        if data(i,j) = data(i,j-1) then
                           Put("-");
                        else
                           Put(" ");
                        end if;
                     else
                        Put(" ");
                     end if;
                  else
                     Put(" ");
                  end if;
               elsif k = 3 then
                  if data(i,j) = False then
                     if j > 1 then
                        if data(i,j) = data(i,j-1) then
                           Put("-");
                        else
                           Put(" ");
                        end if;
                     else
                        Put(" ");
                     end if;
                  else
                     Put(" ");
                  end if;
               elsif k = 2 then
                  if j > 1 then
                     if data(i,j) /= data(i,j-1) then
                        Put("|");
                     else
                        Put(" ");
                     end if;
                  else
                     Put(" ");
                  end if;
               end if;
            end loop;
            New_Line(1);
         end loop;
         New_Line(1);
      end loop;
      New_Line(1);
   end Paint;

   procedure Shift is
   begin
      for i in 1..N loop
         for j in 1..M-1 loop
            data(i,j) := data(i,j+1);
         end loop;
      end loop;
   end Shift;
end STR_Chrono;
