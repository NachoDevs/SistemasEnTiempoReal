with Numeros_Complejos,
     Ada.Text_IO.Unbounded_IO,
     Ada.Float_Text_IO,
     Ada.Strings.Unbounded;

procedure Ejercicio1 is

    package SU renames Ada.Strings.Unbounded;

    x,y,z:Numeros_Complejos.Complejo;
    str  : SU.Unbounded_String;

begin
    x:=Numeros_Complejos.Init(1.0,2.0);
    y:=Numeros_Complejos.Init(3.0,4.0);

    Ada.Text_IO.Put("X= ");
    str:=Numeros_Complejos.ToString(x);
    Ada.Text_IO.Unbounded_IO.Put_Line(str);
    --Ada.Text_IO.New_Line(1);

    Ada.Text_IO.Put("Y= ");
    str:=Numeros_Complejos.ToString(y);
    Ada.Text_IO.Unbounded_IO.Put_Line(str);
    --Ada.Text_IO.New_Line(1);

    -- Suma
    Ada.Text_IO.Put("Suma = ");
    z:=Numeros_Complejos."+"(x,y);
    str := Numeros_Complejos.ToString(z);
    Ada.Text_IO.Unbounded_IO.Put_Line(str);
    --Ada.Text_IO.New_Line(1);

    -- Resta
    Ada.Text_IO.Put("Resta = ");
    z:=Numeros_Complejos."-"(x,y);
    str := Numeros_Complejos.ToString(z);
    Ada.Text_IO.Unbounded_IO.Put_Line(str);
    --Ada.Text_IO.New_Line(1);

    -- Multiplicacion
    Ada.Text_IO.Put("Multiplicacion = ");
    z:=Numeros_Complejos."*"(x,y);
    str := Numeros_Complejos.ToString(z);
    Ada.Text_IO.Unbounded_IO.Put_Line(str);
    --Ada.Text_IO.New_Line(1);

    -- Division
    Ada.Text_IO.Put("Division = ");
    z:=Numeros_Complejos."/"(x,y);
    str := Numeros_Complejos.ToString(z);
    Ada.Text_IO.Unbounded_IO.Put_Line(str);
    --Ada.Text_IO.New_Line(1);

    -- Conjugacion
    Ada.Text_IO.Put("Conjugado (x) = ");
    z:=Numeros_Complejos.Conjugacion(x);
    str := Numeros_Complejos.ToString(z);
    Ada.Text_IO.Unbounded_IO.Put_Line(str);
    --Ada.Text_IO.New_Line(1);

end Ejercicio1;
