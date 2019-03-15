with Ada.Text_IO;

procedure ejercicio1_opcional is

    str : String (1..1_000); -- Aqui almacenamos la entrada por consola
    i   : Integer   := 0;
    c   : Character;
    last: Natural; -- Esta variable nos permite saber la ultima posicion de la entrada de consola

begin
    -- Nos permite pedir un input al usuario por consola
    Ada.Text_IO.Get_Line (str, last);
    
    -- Bucle para extraer la informaci�n de la cadena anterior car�cter a car�cter
    --    e imprimir por pantalla en funci�n del car�cter le�do
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
