with Ada.Text_IO;
with SistemaReal;

procedure Main is

    maxRow: integer:=15;
    maxCol: integer:=3;

    type inputData is array(1..maxRow, 1..maxCol) of float;

    dataTable:inputData;

    od:SistemaReal.outputData;

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

    For_Loop:
    for k in Integer range 1..maxRow loop
	od:=SistemaReal.Planta(k, dataTable(k, 1), dataTable(k, 2), dataTable(k, 3));
    end loop For_Loop;

    -- Print for loop
    For_LoopI:
    for i in Integer range 1..maxRow loop
	For_LoopJ:
	for j in Integer range 1..maxCol loop
	    Ada.Text_IO.Put_Line(float'Image(dataTable(i, j)));
	end loop For_LoopJ;
	Ada.Text_IO.Put_Line("-----");
    end loop For_LoopI;

end Main;
