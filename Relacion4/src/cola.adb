package body Cola is

   type Nodo;
   --Enlace es un puntero al Nodo
   type Enlace is access Nodo;
   type Nodo is record
      Contenido: Elemento;
      Siguiente: Enlace;
   end record;
   
   --Se inicializa el primer y último enlace a null
   Primero, Ultimo : Enlace :=null;
   
   --Comprueba si la cola está vacía comprobando el primer elemento
   function Vacia return Boolean is
   begin
      return Primero = null;
   end Vacia;
   
   --Añade el elemento a la cola
   procedure Poner(E:Elemento) is 
      Nuevo : Enlace;
   begin
      Nuevo := new Nodo;
      Nuevo.Contenido:=E;
      Nuevo.Siguiente := null;
      if Vacia then
         Primero := Nuevo;
      else
         Ultimo.Siguiente := Nuevo;
      end if;
      Ultimo := Nuevo;
   end Poner;
   
   --Quita el primer elemento de la cola y devuelve dicho elemento
   procedure Quitar(E: out Elemento) is 
      Viejo: Enlace;
   begin
      Viejo := Primero;
      E := Viejo.Contenido;
      Primero := Viejo.Siguiente;
      if Primero = null then Ultimo := null;
      end if;
   end Quitar;

end Cola;
