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

   data(1)  :=(600); data(2) :=21.0; data(3) :=20.0;
   data(4)  :=(604); data(5) :=21.0; data(6) :=19.6;
   data(7)  :=(610); data(8) :=21.1; data(9) :=19.8;
   data(10) :=(620); data(11):=21.0; data(12):=20.0;
   data(13) :=(580); data(14):=21.0; data(15):=20.0;
   data(16) :=(530); data(17):=21.0; data(18):=20.5;
   data(19) :=(450); data(20):=21.0; data(21):=20.0;
   data(22) :=(420); data(23):=21.2; data(24):=20.0;
   data(25) :=(460); data(26):=21.0; data(27):=21.0;
   data(28) :=(400); data(29):=21.0; data(30):=20.0;
   data(31) :=(450); data(32):=21.0; data(33):=19.5;
   data(34) :=(480); data(35):=21.3; data(36):=19.0;
   data(37) :=(400); data(38):=21.0; data(39):=19.5;
   data(40) :=(400); data(41):=21.0; data(42):=20.0;
   data(43) :=(350); data(44):=21.0; data(45):=21.0;

begin

   For_Loop:
      for k in Integer range 0..14 loop

        Put_Line(k'Img);

      end loop For_Loop;

end Main;
