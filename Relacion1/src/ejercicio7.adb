with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Ada.Unchecked_Deallocation;

use Ada.Text_IO;
use Ada.Strings.Unbounded;

procedure ejercicio7 is

    type Registro is
       record
	   hora : Unbounded_String := To_Unbounded_String("00:00 am");
	   valor : integer := 1;
	   unidad: Unbounded_String := To_Unbounded_String("");
       end record;
    
    type Nodo;
    type Enlace is access Nodo;
    type Nodo is 
       record
	   Valor : registro;
	   Siguiente : Enlace;
       end record;
    
    e : Enlace;
    r : registro := (To_Unbounded_String("13:00 pm"), 25, To_Unbounded_String("Grados centigrados"));

begin
    
    e := new Nodo;
    e.Valor:= r;

    Put_Line(To_String(r.hora));
    Put_Line(Integer'image(r.valor));
    Put_Line(To_String (r.unidad));
    
end ejercicio7;
