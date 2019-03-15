with Ada.Text_IO;

procedure Ejercicio1 is


    str : String    := "ABCDEFG";
    i   : Integer   := 0;
    c   : Character;

begin
    -- Bucle para extraer la informaci�n de la cadena anterior car�cter a car�cter
    --    e imprimir por pantalla en funci�n del car�cter le�do
    for i in 1..str'Length loop
	c:=str(I);

	case c is
	    when 'A' | 'B' => Ada.Text_IO.Put_Line( "Opcion 1" );
	    when 'C' | 'D' | 'E' => Ada.Text_IO.Put_Line( "Opcion 2" );
	    when 'F' => Ada.Text_IO.Put_Line( "Opcion 3" );
	    when others => Ada.Text_IO.Put_Line( "Otra opcion" );
	end case ;
    end loop ;

end Ejercicio1;
