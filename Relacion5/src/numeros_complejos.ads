with Ada.Text_IO.Unbounded_IO,
     Ada.Strings,
     Ada.Strings.Unbounded;

package numeros_complejos is
      
    package SU renames Ada.Strings.Unbounded;   
    
    -- Creamos un tipo complejo
    type Complejo is private;

    -- Creacion de numeros complejos
    function Init(t_R,t_I: Float) return Complejo;

    -- Operaciones
    function "+"(t_X,t_Y: Complejo) return Complejo;
    function "-"(t_X,t_Y: Complejo) return Complejo;
    function "*"(t_X,t_Y: Complejo) return Complejo;
    function "/"(t_X,t_Y: Complejo) return Complejo;

    -- Funciones auxiliares
    function Conjugacion(t_X: Complejo) return Complejo;
    function Real(t_X: Complejo) return Float;
    function Imaginaria(t_X: Complejo) return Float;
    function ToString(t_X: Complejo) return SU.Unbounded_String;

    procedure Put(t_X: Complejo);
    procedure Put_Line(t_X: Complejo);

private

    type Complejo is tagged record
	m_Real      : Float;
	m_Imaginaria: Float;
    end record;

end numeros_complejos;
