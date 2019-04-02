with semaforos,
     Putter;
use semaforos;

procedure apartado2 is

    Mutex : Semaphore;
    
    task TA; 
    task body TA is
    begin
	for i in 1 .. 3 loop
	    Wait (Mutex);
	    Putter.Put_Line ("Tarea A: " & i'image);
	    Signal (Mutex);
	end loop;
    end TA;

    task TB; 
    task body TB is
    begin
	for i in 1 .. 3 loop
	    Wait (Mutex);
	    Putter.Put_Line ("Tarea B: " & i'image);
	    Signal (Mutex);
	end loop;
    end TB;

    task TC; 
    task body TC is
    begin
	for i in 1 .. 3 loop
	    Wait (Mutex);
	    Putter.Put_Line ("Tarea C: " & i'image);
	    Signal (Mutex);
	end loop;
    end TC;

    
begin

    null;
end apartado2;
