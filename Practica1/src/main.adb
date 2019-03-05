with Ada.Text_IO.Unbounded_IO;
with Ada.Strings.Unbounded;
with SistemaReal;

procedure Main is

    maxRow: integer:=15;
    maxCol: integer:=3;

    type inputData is array(1..maxRow, 1..maxCol) of float;

    dataTable:inputData;

    od : SistemaReal.outputData;

    F    : Ada.Text_IO.File_Type;
    Data : Ada.Strings.Unbounded.Unbounded_String;

begin

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


    Ada.Text_IO.Create(F, Ada.Text_IO.Out_File, "data.txt");

    data := Ada.Strings.Unbounded.To_Unbounded_String ("k;");
    Ada.Text_IO.Unbounded_IO.Put (F, Data);
    For_Loop1 :
    for s in SistemaReal.sensores loop
	data := Ada.Strings.Unbounded.To_Unbounded_String (SistemaReal.sensores'Image(s) & ";");
	Ada.Text_IO.Unbounded_IO.Put (F, Data);
    end loop For_Loop1;
    Ada.Text_IO.Unbounded_IO.Put_Line (F, Ada.Strings.Unbounded.To_Unbounded_String (""));  -- Salto de linea...


    For_Loop2:
    for k in Integer range 1..maxRow loop
	od:=SistemaReal.Planta(k, dataTable(k, 1), dataTable(k, 2), dataTable(k, 3));

	-- Print for loop

	Ada.Text_IO.Unbounded_IO.Put(F, Ada.Strings.Unbounded.To_Unbounded_String (integer'Image(k) & ";"));

	For_LoopI :
	for i in Integer range 1 .. 8 loop
	    --Ada.Text_IO.Put_Line(float'Image(od(i)));
	    data := Ada.Strings.Unbounded.To_Unbounded_String (float'Image (od (i)) & ";");
	    Ada.Text_IO.Unbounded_IO.Put (F, Data);
	end loop For_LoopI;
	Ada.Text_IO.Unbounded_IO.Put_Line (F, Ada.Strings.Unbounded.To_Unbounded_String (""));  -- Salto de linea...
    end loop For_Loop2;

    Ada.Text_IO.Close(F);
end Main;
