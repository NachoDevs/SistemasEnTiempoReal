with modulos;

procedure mainConcurrente is
    
    reps : integer := 10;
    
    i : integer := 0;
    j : integer := 0;
    k : integer := 0;

    task type CS;
    type REF_CS is access CS;
    
    task body CS is
    begin
	for i in 1 .. reps loop
	    delay 0.1;
	    Modulos.CampoSolar;
	    delay 0.01;
	end loop;
    end;

    task type MD;
    type REF_MD is access MD;
    
    task body MD is
    begin
	for j in 1 .. reps loop
	    delay 0.2;
	    Modulos.ModuloDestilacion;
	    delay 0.01;
	end loop;
    end;

    task type SS;
    type REF_SS is access SS;
    
    task body SS is
    begin
	for i in 1 .. reps loop
	    delay 0.05;
	    Modulos.SistemaDeSeguridad;
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
