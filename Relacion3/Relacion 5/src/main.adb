with Cola;
use Cola;
with Ada.Text_IO, Ada.Float_Text_IO;
use Ada.Text_IO, Ada.Float_Text_IO;

procedure main is
   E: Elemento;
   Eliminado: Integer := 0;

begin
   --Insertar números del 1 al 10 en la cola
   for i in 1..10 loop
      E := Elemento(i);
      Poner(E);
   end loop;

   --Eliminar los elementos de la cola y mostrarlos por pantalla
   while Vacia = false loop
      --Se elimina el elemento y se guarda en la variable Eliminado
      Quitar(Elemento(Eliminado));
      --Se imprime la variable por pantalla
      Put_Line(Integer'Image(Eliminado));
   end loop;

end main;
