with Ada.Text_IO;
use Ada.Text_IO;

procedure Ejercicio1 is

   type a is new Integer range -55..60;
   type b is new Integer range 10..25;
   type c is new Integer range 0..255;
   
   varA:a:=20;
   varB:b:=10;
   varC:c:=1;
   
   outA:Integer:=Integer(Integer(varA)+Integer(varB));
   outB:Integer:=Integer(Integer(varA)+Integer(varC));
   outC:Integer:=Integer(Integer(varB)+Integer(varC));

begin
   
   Put_Line(outA'Img);
   Put_Line(outB'Img);
   Put_Line(outC'Img);
   
end Ejercicio1;
