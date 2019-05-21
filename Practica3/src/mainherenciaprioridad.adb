with modulos, Ada.Real_Time, System;
use Ada.Real_Time;


procedure mainHerenciaPrioridad is

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

    P_CS : System.Priority := 2;
    P_MD : System.Priority := 1;
    P_SS : System.Priority := 3;
    
    task type CS is
	pragma Priority (P_CS);
    end CS;

    type REF_CS is access CS;

    -- Tarea del campo solar
    task body CS is
    begin
	Tiempo1 := clock;
	for i in 1 .. reps loop
	    -- Añadimos el timepo de computo
	    limite1 := Tiempo1 + C1;
	    -- Ejecutamos los pasos que sigue el campo solar
	    Modulos.CampoSolar;
	    -- Añadimos el periodo
	    Tiempo1 := Tiempo1 + T1;
	end loop;
    end;

    task type MD is
	pragma Priority (P_MD);
    end MD;
    type REF_MD is access MD;
    
    task body MD is
    begin
	Tiempo2 := clock;
	for i in 1 .. reps loop
	    -- Añadimos el timepo de computo
	    limite2 := Tiempo2 + C2;
	    -- Ejecutamos los pasos que sigue el modulo de destilacion
	    Modulos.ModuloDestilacion;
	    -- Añadimos el periodo
	    Tiempo2 := Tiempo2 + T2;
	end loop;
    end;

    task type SS is
	pragma Priority (P_SS);
    end SS;
    type REF_SS is access SS;

    task body SS is
    begin
	Tiempo3 := clock;
	for i in 1 .. reps loop
	    limite3 := Tiempo3;
	    -- Ejecutamos los pasos que sigue el sistema de seguridad
	    Modulos.SistemaDeSeguridad;
	    -- Añadimos el periodo
	    Tiempo3 := Tiempo3 + T3;
	end loop;
    end;


begin

    declare
	m_cs : REF_CS := new CS;
	m_md : REF_MD := new MD;
	m_ss : REF_SS := new SS;
    begin
	null;
    end;

end mainHerenciaPrioridad;
