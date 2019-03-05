with Ada.Text_IO;
use Ada.Text_IO;

procedure ejercicio4 is

    type vectorA is array (Integer range 1 .. 15) of integer;
    
    type matrix is array (1 .. 3, 1 .. 10, 1 .. 10) of float;
    
    type vectorB is array(Integer range <>) of float;
    
    vecA : vectorA;
    mat : matrix;
    vecB : vectorB(1..10);
    
begin
   
    Put_Line("Vector de enteros de rango 1 a 15");
    
    For_Loop1:
    for x in Integer range 1..15 loop
	vecA (x) := 0;
	Put (Integer'Image (vecA (x)) & ", ");
    end loop For_Loop1;

    Put_Line("");
    Put_Line ("Matriz de reales 3x10x10");
    
    For_Loop2:
    for i in Integer range 1..3 loop
	For_Loop3:
	for j in Integer range 1..10 loop
	    For_Loop4:
	    for k in Integer range 1..10 loop
		mat (i, j, k) := 0.0;
		Put(float'Image (mat (i, j, k)) & ", ");
	    end loop For_Loop4;
	    Put_Line("");
	end loop For_Loop3;
    end loop For_Loop2;

    Put_Line("");
    Put_Line("Vector de reales sin rango");
    
    For_Loop5:
    for y in Integer range 1..10 loop
	vecB (y) := 0.0;
	Put(float'Image(vecB(y)) & ", ");
    end loop For_Loop5;

    
end ejercicio4;
