with modulos;

with Ada.Text_IO;
use Ada.Text_IO;

procedure mainSecuencial is

    reps : integer := 10; -- Variable que indica el numero de repeticiones del bucle 

    i    : integer :=  0; -- Variable auxiliar para el bucle del numero de repeticiones
    
begin
   
    for i in 1 .. reps loop
    
	modulos.CampoSolar;        -- 10 ms
	modulos.ModuloDestilacion; -- 10 ms
	
	-- Como suponemos que cada iteracion del bucle son 10ms, y sabemos que 
	-- el sistema de seguridad se ejecuta cada 50ms, lo llamamos cada 5 iteraciones
	if (i mod 5 = 0) then
	    modulos.SistemaDeSeguridad; -- 50 ms
	end if;
	    
    end loop;
    
end mainSecuencial;
