with Ada.Text_IO;
use Ada.Text_IO;

procedure ejercicio5 is

    type cadena is array (Positive range <>) of character;

    cad:constant cadena:="TIEMPO REAL";
    
begin
    
    
    For_Loop1:
    for x in Integer range 1..11 loop
	Put (character'Image (cad(x)));
    end loop For_Loop1;
    
end ejercicio5;
