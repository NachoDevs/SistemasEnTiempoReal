with Ada.Text_IO;
use Ada.Text_IO;

procedure Main is

   beta:float:=0.13;
   Leq: float:=15;
   h:   float:=4;
   c:   float:=1080000;
   Cp:  flaot:=4190;
   rho: float:=975;    --p

   maxRow:integer:=15;
   maCol:integer:=3;

   type data is array(1..maxRow, 1..maxCol) of float;

   data(1) :=(600); data(2); data(3):=20.0;
   data(1) :=(604, 21.0, 19.6);
   data(2) :=(610, 21.1, 19.8);
   data(3) :=(620, 21.0, 20.0);
   data(4) :=(580, 21.0, 20.0);
   data(5) :=(530, 21.0, 20.5);
   data(6) :=(450, 21.0, 20.0);
   data(7) :=(420, 21.2, 20.0);
   data(8) :=(460, 21.0, 21.0);
   data(9) :=(400, 21.0, 20.0);
   data(10):=(450, 21.0, 19.5);
   data(11):=(480, 21.3, 19.0);
   data(12):=(400, 21.0, 19.5);
   data(13):=(400, 21.0, 20.0);
   data(14):=(350, 21.0, 21.0);

begin

   For_Loop:
      for k in Integer range 0..14 loop

        Put_Line(k'Img);

      end loop For_Loop;

end Main;
