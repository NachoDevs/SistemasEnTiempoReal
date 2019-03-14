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

    -- Creamos la matriz para los datos de la simulacion
    sd : SistemaReal.sensorsData;

    -- Creamos un array para los datos de salida
    od : SistemaReal.outputData;

    -- Variables para la lectura y escritura de archivos
    F    : Ada.Text_IO.File_Type;
    Data : Ada.Strings.Unbounded.Unbounded_String;

    -- Valor auxiliar para un bucle
    i : integer := 1;

    m_sc1 : float;
    m_sc2 : float;

    -- Valores optimos
    m_oSd1 : float := 25.0;
    m_oSt2 : float := 80.0;

    m_st1_1 : float;
    m_st2_1 : float;

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
    --Ada.Text_IO.Skip_Line(F);

    -- Vamos a emepezar a añadir los datos al archivo
    For_Loop2:
    for k in Integer range 1 .. maxRow loop
	-- Conseguimos los datos para la k correspondiente
	if k < 2 then    -- Valores por defecto
	    m_st1_1 := 50.0;
	    m_st2_1 := 60.0;
	else
	    m_st1_1 := sd(k-1, SistemaReal.St1);
	    m_st2_1 := sd(k-1, SistemaReal.St2);
	end if;

	m_sc1 := ((SistemaReal.beta * SistemaReal.Leq * dataTable(k, 1))-(SistemaReal.h * (((m_st1_1 + m_oSt2) / 2.0) - dataTable(k, 2))))
	  * (SistemaReal.c / ((m_oSt2 - m_st1_1) * SistemaReal.Cp * SistemaReal.rho));

	m_sc2 := ((m_oSd1 / 24.0) - (0.135 + 0.003 * m_oSt2 - 0.0204 * dataTable(k, 3)))
	  / (-0.001 + 0.00004 * m_oSt2);

	-- Delimitando SC1
	if m_sc1 < 7.5 then
	    m_sc1 := 7.5;
	else if m_sc1 > 20.0 then
	    m_sc1 := 20.0;
	    end if;
	end if;

	-- Delimitando SC2
	if m_sc2 < 400.0 then
	    m_sc2 := 400.0;
	else if m_sc2 > 600.0 then
	    m_sc2 := 600.0;
	    end if;
	end if;


	-- Planta (t_k : integer; t_sr1, t_st4, t_st3, t_sc1, t_sc2 : float)
	od := SistemaReal.Planta (k, dataTable (k, 1), dataTable (k, 2), dataTable (k, 3), m_sc1, m_sc2);

	-- Añadimos el valor de la primera columna, que es la k
	Ada.Text_IO.Unbounded_IO.Put(F, Ada.Strings.Unbounded.To_Unbounded_String (integer'Image(k) & ";"));

	i:=1;
	-- Ahora vamos a leer la salida, que es un array de datos y los vamos introduciendo al archivo
	For_LoopS:
	for s in SistemaReal.sensores loop
	    sd(k, s):=od(i);
	    data := Ada.Strings.Unbounded.To_Unbounded_String (float'Image (sd(k, s)) & ";");
	    Ada.Text_IO.Unbounded_IO.Put (F, Data);
	    i:=i+1;
	end loop For_LoopS;
	Ada.Text_IO.Unbounded_IO.Put_Line (F, Ada.Strings.Unbounded.To_Unbounded_String (""));  -- Salto de linea...
    end loop For_Loop2;

    -- Cerramos el archivo
    Ada.Text_IO.Close(F);
end Main;
