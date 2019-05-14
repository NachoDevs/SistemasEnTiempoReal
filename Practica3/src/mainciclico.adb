with modulos;
with Ada.Real_Time;
use Ada.Real_Time;

procedure mainCiclico is
    
    reps : integer := 10; -- Número de iteraciones en la ejecucion del ejercicio
    
    i : integer := 0;     -- Variable auxiliar para el bucle del Campo Solar
    j : integer := 0;     -- Variable auxiliar para el bucle del Modulo de Destilacion
    k : integer := 0;     -- Variable auxiliar para el bucle del Sistema de Seguridad

    Tiempo1, Tiempo2, Tiempo3 : Time;            -- Variable para controlar el tiempo de cada modulo
    Limite1, Limite2, Limite3 : Time;            -- Variable para almacenar el limite temporal de cada modulo
    C1      : Time_Span := Milliseconds (10);    -- Variable para almacenar el tiempo de computo de un modulo
    C2      : Time_Span := Milliseconds (10);    -- Variable para almacenar el tiempo de computo de un modulo
    T1      : Time_Span := Milliseconds (100);   -- Variable para almacenar el de periodo de un modulo
    T2      : Time_Span := Milliseconds (200);   -- Variable para almacenar el de periodo de un modulo   
    T3      : Time_Span := Milliseconds (50);    -- Variable para almacenar el de periodo de un modulo   
        
begin

    for i in 1 .. reps loop
	Tiempo3 := clock;
	delay until (Tiempo3);
	limite3 := Tiempo3;
	Modulos.SistemaDeSeguridad;
	-- Añadimos el periodo
	Tiempo3 := Tiempo3 + T3;
	
	Tiempo1 := clock;
	delay until (Tiempo1);
	-- Añadimos el timepo de computo
	limite1 := Tiempo1 + C1;
	-- Ejecutamos los pasos que sigue el campo solar
	Modulos.CampoSolar;
	-- Añadimos el periodo
	Tiempo1 := Tiempo1 + T1;

	Tiempo2 := clock;
	delay until (Tiempo2);
	-- Añadimos el timepo de computo
	limite2 := Tiempo2 + C2;
	-- Ejecutamos los pasos que sigue el modulo de destilacion
	Modulos.ModuloDestilacion;
	-- Añadimos el periodo
	Tiempo2 := Tiempo2 + T2;
    end loop;
   
end mainCiclico;
