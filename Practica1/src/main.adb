with Ada.Text_IO.Unbounded_IO;
with Ada.Strings.Unbounded;
with SistemaReal;

procedure Main is

    -- Parametros para la tabla de datos
    maxRow: integer:=15;
    maxCol: integer:=3;

    -- Tipo de dato para la matriz de entrada (proximamente la lectura de los datos reales)
    type inputData is array(1..maxRow, 1..maxCol) of float;

    -- Creamos la matriz de entrada
    dataTable:inputData;

    -- Creamos el array para los datos de la simulacion
    od : SistemaReal.outputData;

    -- Variables para la lectura y escritura de archivos
    F    : Ada.Text_IO.File_Type;
    Data : Ada.Strings.Unbounded.Unbounded_String;

begin

    -- Inicializamos la tabla de datos para la simulacion
    dataTable:=(1 =>(600.0, 21.0, 20.0),
		2 =>(604.0, 21.0, 19.6),
		3 =>(610.0, 21.1, 19.8),
		4 =>(620.0, 21.0, 20.0),
		5 =>(580.0, 21.0, 20.0),
		6 =>(530.0, 21.0, 20.5),
		7 =>(450.0, 21.0, 20.0),
		8 =>(420.0, 21.2, 20.0),
		9 =>(460.0, 21.0, 21.0),
		10=>(400.0, 21.0, 20.0),
		11=>(450.0, 21.0, 19.5),
		12=>(480.0, 21.3, 19.0),
		13=>(400.0, 21.0, 19.5),
		14=>(400.0, 21.0, 20.0),
		15=>(350.0, 21.0, 21.0));


    -- Creamos el archivo de salida
    Ada.Text_IO.Create(F, Ada.Text_IO.Out_File, "data.txt");

    -- Aqui vamos añadir la primera linea del archivo de salida, donde indicamos los nombres de las columnas
    -- La primera columna es k
    data := Ada.Strings.Unbounded.To_Unbounded_String ("k;");
    Ada.Text_IO.Unbounded_IO.Put (F, Data);
    -- Ahora vamos a añadir las columnas de sensores
    For_Loop1 :
    for s in SistemaReal.sensores loop
	data := Ada.Strings.Unbounded.To_Unbounded_String (SistemaReal.sensores'Image(s) & ";");
	Ada.Text_IO.Unbounded_IO.Put (F, Data);
    end loop For_Loop1;
    Ada.Text_IO.Unbounded_IO.Put_Line (F, Ada.Strings.Unbounded.To_Unbounded_String (""));  -- Salto de linea...

    -- Vamos a emepezar a añadir los datos al archivo
    For_Loop2:
    for k in Integer range 1 .. maxRow loop
	-- Conseguimos los datos para la k correspondiente
	od:=SistemaReal.Planta(k, dataTable(k, 1), dataTable(k, 2), dataTable(k, 3));

	-- Añadimos el valor de la primera columna, que es la k
	Ada.Text_IO.Unbounded_IO.Put(F, Ada.Strings.Unbounded.To_Unbounded_String (integer'Image(k) & ";"));

	-- Ahora vamos a leer la salida, que es un array de datos y los vamos introduciendo al archivo
	For_LoopI :
	for i in Integer range 1 .. 8 loop
	    --Ada.Text_IO.Put_Line(float'Image(od(i)));
	    data := Ada.Strings.Unbounded.To_Unbounded_String (float'Image (od (i)) & ";");
	    Ada.Text_IO.Unbounded_IO.Put (F, Data);
	end loop For_LoopI;
	Ada.Text_IO.Unbounded_IO.Put_Line (F, Ada.Strings.Unbounded.To_Unbounded_String (""));  -- Salto de linea...
    end loop For_Loop2;

    -- Cerramos el archivo
    Ada.Text_IO.Close(F);
end Main;
