with Ada.Text_IO;
use Ada.Text_IO;

procedure ejercicio3 is

    type comaFija is delta 0.001 range -10.000 .. 150.000;
    
    type comaFlotante is digits 4 range -100.0 .. 150.0;

    varA : comaFija:=23.0;
    varB : comaFlotante := 23.0;
    
    output : float;
    
begin
    
    output:= float(varA) + float(varB);
   
    Put_Line (float'Image(output));
    
end ejercicio3;
