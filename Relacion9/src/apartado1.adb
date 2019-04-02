with Putter;

procedure apartado1 is

    i :integer := 0;

begin

    for i in 1..3 loop
	    Putter.Put_Line ("Tarea A: " & i'image);
	end loop;

    i := 0;

        for i in 1..3 loop
	    Putter.Put_Line ("Tarea B: " & i'image);
	end loop;

    i := 0;


        for i in 1..3 loop
	    Putter.Put_Line ("Tarea C: " & i'image);
	end loop;

    i := 0;

end apartado1;
