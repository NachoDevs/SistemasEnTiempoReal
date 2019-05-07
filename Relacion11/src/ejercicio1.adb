with Ada.Real_Time; use Ada.Real_Time; -- paquete para trabajar con tiempo (periodo)
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics; use Ada.Numerics;
with Ada.Numerics.Discrete_Random;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Strings; use Ada.Strings;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Ejercicio1 is
    T : Time;
    Nh : Integer;
    L : Integer;
    H : Time_Span;
    Ch : Time_Span := Milliseconds (10);
    Cc : Time_Span := Milliseconds (5);

    Dado : Integer;
    newPos : Integer;

    type listaNombres is array(Integer range <>) of Unbounded_String;
    type listaPosiciones is array(Integer range <>) of integer;

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

    task type Horse is
	entry Tirada (t_newPos : out Integer);
	entry CargarPosicion (t_pos : in Integer);
	entry VolverAlEstablo;
    end Horse;

    task body Horse is
	pos : integer := 0;
    begin
	loop
	    select
		accept Tirada  (t_newPos : out Integer) do
		    Dado := Generate_Number (1, 6);
		    --Put_Line (Integer'Image (Dado));
		    pos := pos + Dado;
		    t_newPos := pos;
		end Tirada;
	    or
		accept CargarPosicion (t_pos : in integer) do
		    --Put_Line ("Cargar pos: " & Integer'Image (t_pos));
		    pos := t_pos;
		end CargarPosicion;
	    or
		accept VolverAlEstablo;
		exit;
	    end select;
	end loop;
    end Horse;

    type Ref_Horse is access Horse;

    task Com is
	entry Comentar (t_nombre : Unbounded_String; t_pos : Integer);
	entry Ganador (t_nombre : Unbounded_String);
	entry VolverACasa;
    end;
    task body Com is
    begin
	loop
	    select
		accept Comentar (t_nombre : Unbounded_String; t_pos : Integer) do
		    Put_Line ("El caballo " & To_String(t_nombre) & " va en posicion " & Integer'Image(t_pos) & "!"); -- aquí irán las acciones de la tarea
		end Comentar;
		  or
		accept Ganador (t_nombre : Unbounded_String) do
		    Put_Line ("Y el ganador es " & To_String(t_nombre) & "!!!!");
		end Ganador;
	    or
		accept VolverACasa;
		exit;
	    end select;
	end loop;
    end Com;

     Caballito : Ref_Horse;

begin
    T := Clock;

    Caballito := new Horse;

    put_Line ("Numero de caballos?");
    Ada.Integer_Text_IO.get(Nh);

    put_Line ("Longitud de la pista?");
    Ada.Integer_Text_IO.get(L);

    H := Ch * Nh + Cc;

    declare
	listaNom : listaNombres (0 .. Nh);
	listaPos : listaPosiciones (0 .. Nh);

    begin

	-- Inicializar caballos
	for i in Integer range 1 .. Nh loop
	    listaPos(i) := 0;
	    listaNom(i) := To_Unbounded_String ("Caballo_" & Integer'Image (i));
	end loop;

	-- loop de tareas
	For_Loop_IteracionPrincipal :
	loop
	    T := T + H;
	    delay until (T);

	    For_Loop_Tiradas :
	    for k in Integer range 1 .. Nh loop
		T := T + Ch;
		delay until (T);
		--Put_Line (To_String(listaNom(k)));
		--Put_Line ("Posicion pre tirada: " & Integer'Image(listaPos (k)));

		Caballito.CargarPosicion (listaPos (k));

		--Put_Line("Datos cargados");
		Caballito.Tirada(newPos);
		listaPos (k) := newPos;
		--Put_Line ("Dado: " & Integer'Image(newPos));
		--Put_Line ("Posicion tras tirada: " & Integer'Image(listaPos (k)));

		if newPos >= L then
		    Com.Ganador (listaNom (k));
		   exit For_Loop_IteracionPrincipal; -- when newPos >= L;
		end if;

	    end loop For_Loop_Tiradas;

	    T := T + Cc;
	    delay until (T);
	    for j in Integer range 1 .. Nh loop
		Com.Comentar (listaNom (j), listaPos (j));
	    end loop;
	    Put_Line ("-------------");
	end loop For_Loop_IteracionPrincipal;
    end;
    --mandarAlEstablo := true;
    Caballito.VolverAlEstablo;
    Com.VolverACasa;

end Ejercicio1;
