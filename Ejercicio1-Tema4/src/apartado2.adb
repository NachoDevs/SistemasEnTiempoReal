with Ada.Text_IO;

procedure apartado2 is

    i : integer := 0;

    task TA;
    task TB;
    task TC;
    
    task body TA is 
    begin
	i := 0;
	
	for i in 1 .. 3 loop
	    Ada.Text_IO.Put_Line ("Tarea A:" & i'image);
	end loop;
    end TA;

    task body TB is 
    begin
	i := 0;

	for i in 1 .. 3 loop
	    Ada.Text_IO.Put_Line ("Tarea B:" & i'image);
	end loop;
    end TB;
    
    task body TC is 
    begin
	i := 0;

	for i in 1 .. 3 loop
	    Ada.Text_IO.Put_Line ("Tarea C:" & i'image);
	end loop;
    end TC;
    
begin
    
    Ada.Text_IO.Put("");
    
end apartado2;
