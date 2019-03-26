with Ada.Text_IO;

procedure apartado3 is
    i : integer := 0;

    task type TA;
    type REF_TA is access TA;
    
    task body TA is
    begin
	i := 0;
	
	for i in 1 .. 3 loop
	    Ada.Text_IO.Put_Line ("Tarea A:" & i'image);
	end loop;
    end;

    task type TB;
    type REF_TB is access TB;
    
    task body TB is
    begin
	i := 0;
	
	for i in 1 .. 3 loop
	    Ada.Text_IO.Put_Line ("Tarea B:" & i'image);
	end loop;
    end;

    task type TC;
    type REF_TC is access TC;
    
    task body TC is
    begin
	i := 0;
	
	for i in 1 .. 3 loop
	    Ada.Text_IO.Put_Line ("Tarea C:" & i'image);
	end loop;
    end;

    
begin

    declare
	m_ta : REF_TA := new TA;
	m_tb : REF_TB := new TB;
	m_tc : REF_TC := new TC;
    begin
	Ada.Text_IO.Put ("");
    end;
	
end apartado3;
