package Cola is

   --Elemento de rango [-100, 100]
   type Elemento is range -100..100;
   --Devuelve true si est� vac�a y false si no lo est�
   function Vacia return Boolean;
   --A�ade el elemento indicado en la cola
   procedure Poner(E:Elemento);
   --Elimina el elemento indicado de la cola
   procedure Quitar(E: out Elemento);

end Cola;
