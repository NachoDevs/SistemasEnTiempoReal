with Ada.Text_IO;

procedure ejercicio1_opcional is

    str : String (1..1_000); -- Aqui almacenamos la entrada por consola
    i   : Integer   := 0;
    c   : Character;
    last: Natural; -- Esta variable nos permite saber la ultima posicion de la entrada de consola

begin
    -- Nos permite pedir un input al usuario por consola
    Ada.Text_IO.Get_Line (str, last);
    
    -- Bucle para extraer la información de la cadena anterior carácter a carácter
    --    e imprimir por pantalla en función del carácter leído
    for i in 1..last loop
	c:=str(I);

	case c is
	    when 'A' | 'B' => Ada.Text_IO.Put_Line( "Opcion 1" );
	    when 'C' | 'D' | 'E' => Ada.Text_IO.Put_Line( "Opcion 2" );
	    when 'F' => Ada.Text_IO.Put_Line( "Opcion 3" );
	    when others => Ada.Text_IO.Put_Line( "Otra opcion" );
	end case ;
    end loop ;

end ejercicio1_opcional;
