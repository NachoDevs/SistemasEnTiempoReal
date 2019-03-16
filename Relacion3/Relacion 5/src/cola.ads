package Cola is

   --Elemento de rango [-100, 100]
   type Elemento is range -100..100;
   --Devuelve true si está vacía y false si no lo está
   function Vacia return Boolean;
   --Añade el elemento indicado en la cola
   procedure Poner(E:Elemento);
   --Elimina el elemento indicado de la cola
   procedure Quitar(E: out Elemento);

end Cola;
