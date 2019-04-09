with modulos;

with Ada.Text_IO;
use Ada.Text_IO;

procedure mainSecuencial is

    i :integer := 0;
    
begin
   
    for i in 1 .. 10 loop
    
	modulos.CampoSolar;        -- 10 ms
	modulos.ModuloDestilacion; -- 10 ms
	
	if (i mod 5 = 0) then
	    modulos.SistemaDeSeguridad; -- 50 ms
	end if;
	    
    end loop;
    
end mainSecuencial;
