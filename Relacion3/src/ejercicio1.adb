with Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure Ejercicio1 is

    inputFile : Ada.Text_IO.File_Type ; -- Variable donde almacenamos el archivo donde leeremos
    outputFile: Ada.Text_IO.File_Type ; -- Variable donde almacenamos el archivo donde escribiremos

    type matrix is array ( 1..10 , 1..5 ) of Integer ; -- Matriz de entrada
    M :matrix;

    -- Variables auxiliares
    i,j : Integer := 1 ;


begin
   -- Abrimos el archivo
    Ada.Text_IO.Open(inputFile, Ada.Text_IO.In_File, "input.txt" );


    -- Calcular la matriz transpuesta de la matriz de enteros obtenida.
    while not Ada.Text_IO.End_Of_File(inputFile) loop
	-- Saltar de linea si hemos llegado al final
	if Ada.Text_IO.End_Of_Line(inputFile) then

	    Ada.Text_IO.Skip_Line(inputFile);

	    j:=j + 1 ;
	    i:= 1 ;
	else
	    -- Leemos la siguiente posicion del archivo
	    Ada.Integer_Text_IO.Get(inputFile,M(i,j));

	    i:=i + 1 ;
	end if ;
    end loop ;

    -- Cerramos el archivo
    Ada.Text_IO.Close(inputFile);

    --Crearmos un archivo donde guardar los datos de salida
    Ada.Text_IO.Create(outputFile, Ada.Text_IO.Out_File, "output.txt" );
    Ada.Text_IO.Close(outputFile);

    -- Abrirmos el archivo de salida
    Ada.Text_IO.Open(outputFile, Ada.Text_IO.Out_File, "output.txt" );


    for k in 1..10 loop
	for l in 1..5 loop
	    Ada.Text_IO.Put(outputFile, Integer ' Image (M(k,l)) & " " );
	end loop ;
	Ada.Text_IO.Put_Line(outputFile, "" );
    end loop ;
    --Cerrar archivo
    Ada.Text_IO.Close(outputFile);

end Ejercicio1;
