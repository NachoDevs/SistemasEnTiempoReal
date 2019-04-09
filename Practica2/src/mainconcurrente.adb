with modulos;

with Ada.Real_Time;
use Ada.Real_Time;

procedure mainConcurrente is
    
    reps : integer := 10; -- Número de iteraciones en la ejecucion del ejercicio
    
    i : integer := 0;     -- Variable auxiliar para el bucle del Campo Solar
    j : integer := 0;     -- Variable auxiliar para el bucle del Modulo de Destilacion
    k : integer := 0;     -- Variable auxiliar para el bucle del Sistema de Seguridad

    Tiempo1, Tiempo2, Tiempo3 : Time;
    Limite1, Limite2, Limite3 : Time;
    C1      : Time_Span := Milliseconds (10);
    C2      : Time_Span := Milliseconds (10);
    T1      : Time_Span := Milliseconds (100);
    T2      : Time_Span := Milliseconds (200);   
    T3      : Time_Span := Milliseconds (50);   
    
    task type CS;
    type REF_CS is access CS;
    
    task body CS is
    begin
	Tiempo1 := clock;
	for i in 1 .. reps loop
	    delay until (Tiempo1);
	    limite1 := Tiempo1 + C1;
	    select
		delay until (limite1);
	    then abort
		Modulos.CampoSolar;
	    end select;
	    Tiempo1 := Tiempo1 + T1;
	end loop;
    end;

    task type MD;
    type REF_MD is access MD;
    
    task body MD is
    begin
	Tiempo2 := clock;
	for i in 1 .. reps loop
	    delay until (Tiempo2);
	    limite2 := Tiempo2 + C2;
	    select
		delay until (limite2);
	    then abort
		Modulos.CampoSolar;
	    end select;
	    Tiempo2 := Tiempo2 + T2;
	end loop;
    end;

    task type SS;
    type REF_SS is access SS;
    
    task body SS is
    begin
	Tiempo3 := clock;
	for i in 1 .. reps loop
	    delay until (Tiempo3);
	    limite3 := Tiempo3;
	    select
		delay until (limite3);
	    then abort
		Modulos.CampoSolar;
	    end select;
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
   
end mainConcurrente;
