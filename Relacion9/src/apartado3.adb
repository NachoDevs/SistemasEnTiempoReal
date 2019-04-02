with semaforos,
     Putter;
use semaforos;

procedure apartado3 is

    MutexA : Semaphore;
    MutexB : Semaphore(0);
    MutexC : Semaphore(0);    
    
    task TA; 
    task body TA is
    begin
	for i in 1 .. 3 loop
	    Wait (MutexB);
	    Putter.Put_Line ("Tarea A: " & i'image);
	    Signal (MutexA);
	end loop;
    end TA;

    task TB; 
    task body TB is
    begin
	for i in 1 .. 3 loop
	    Wait (MutexC);
	    Putter.Put_Line ("Tarea B: " & i'image);
	    Signal (MutexB);
	end loop;
    end TB;

    task TC; 
    task body TC is
    begin
	for i in 1 .. 3 loop
	    Wait (MutexA);
	    Putter.Put_Line ("Tarea C: " & i'image);
	    Signal (MutexC);
	end loop;
    end TC;

    
begin

    null;
end apartado3;
