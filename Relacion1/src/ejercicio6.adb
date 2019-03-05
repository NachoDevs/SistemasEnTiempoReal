with Ada.Text_IO;
with Ada.Strings.Unbounded;

use Ada.Text_IO;
use Ada.Strings.Unbounded;

procedure ejercicio6 is
        
    type Registro is
       record
	   hora : Unbounded_String := To_Unbounded_String("00:00 am");
	   valor : integer := 1;
	   unidad: Unbounded_String := To_Unbounded_String("");
       end record;  
    
    R : Registro := (To_Unbounded_String("13:00 pm"), 25, To_Unbounded_String("Grados centigrados"));
   
begin

    Put_Line(To_String(r.hora));
    Put_Line(Integer'image(r.valor));
    Put_Line(To_String(r.unidad));
   
end ejercicio6;
