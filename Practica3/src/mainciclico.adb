with modulos;
with Ada.Real_Time;
use Ada.Real_Time;

procedure mainCiclico is
    
    reps : integer := 10; -- Número de iteraciones en la ejecucion del ejercicio
    
    type Ciclo is mod 4;
    Turno : Ciclo := 0;
    
    i : integer := 0;     -- Variable auxiliar para el bucle del Campo Solar

    Tiempo : Time;
    
begin

    for i in 1 .. reps loop
	
	Tiempo:=Tiempo + Milliseconds(50);
	
	delay until (Tiempo);

	case Turno is
	when 0 => Modulos.SistemaDeSeguridad; Modulos.CampoSolar; Modulos.ModuloDestilacion;
	when 1 => Modulos.SistemaDeSeguridad;
	when 2 => Modulos.SistemaDeSeguridad; Modulos.CampoSolar;
	when 3 => Modulos.SistemaDeSeguridad;  
	
	end case;

	Turno := Turno + 1;
	
    end loop;
   
end mainCiclico;
