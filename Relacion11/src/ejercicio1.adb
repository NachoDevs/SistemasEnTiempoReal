with Ada.Real_Time; use Ada.Real_Time; -- paquete para trabajar con tiempo (periodo)
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics; use Ada.Numerics;
with Ada.Numerics.Discrete_Random;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Strings; use Ada.Strings;

procedure Ejercicio1 is
    T : Time;
    Nh : Integer;
    L : Integer;
    H : Time_Span;
    Ch : Time_Span := Milliseconds (10);
    Cc : Time_Span := Milliseconds (5);

    Dado : Integer;

    function Generate_Number (MinValue : Integer;
			      MaxValue : Integer) return Integer
    is
	subtype Random_Type is Integer range MinValue .. MaxValue;
	package Random_Pack is new Ada.Numerics.Discrete_Random (Random_Type);
	G : Random_Pack.Generator;
    begin
	Random_Pack.Reset (G);
	return Random_Pack.Random (G);

    end Generate_Number;

    task type Horse (t_id : Integer) is
	entry SetNombre (t_nombre : in Unbounded_String);
	entry CargarDatos(t_id : Integer);
	entry Tirada;
    end Horse;

    task body Horse is
	nombre : Unbounded_String := To_Unbounded_String(" ");
	pos : integer := 0;
    begin
	loop
	    accept SetNombre (t_nombre : in Unbounded_String) do
		nombre := t_nombre;
		--Put (To_String (nombre));
	    end SetNombre;
	    accept Tirada do
		Dado := Generate_Number (0, 6);
		--Put_Line(Integer'Image(Dado));
	    end Tirada;
	end loop;
    end Horse;

    type Ref_Horse is access Horse;

    task Com is
	entry Com;
    end;
    task body Com is
    begin
	loop
	    accept Com do
		Put ("B"); -- aquí irán las acciones de la tarea
	    end Com;
	end loop;
    end Com;

     Caballito : Ref_Horse;

begin
    T := Clock;
    -- preguntar N
    -- preguntamos L
    Nh := 5;
    L := 20;

    H := Ch * Nh + Cc;

    -- Inicializar caballos
    for i in Integer range 1 .. Nh loop
	Caballito := new Horse (i);
	Caballito.SetNombre (To_Unbounded_String (Integer'Image (i)));
    end loop;

    -- loop de tareas
    For_Loop_IteracionPrincipal:
    for j in Integer range 1 .. 5 loop
	T := T + H;
	delay until (T);

	For_Loop_Tiradas:
	for k in Integer range 1 .. Nh loop
	    --Caballito.CargarDatos(k);
	    Put_Line("new");
	    Caballito.Tirada;
	    Put_Line ("-----");
	end loop For_Loop_Tiradas;
	Put_Line("endLoop");

	--Com.Com;

    end loop For_Loop_IteracionPrincipal;
end Ejercicio1;
