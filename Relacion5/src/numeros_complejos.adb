package body numeros_complejos is
    
    S                  : Complejo; -- Complejo para realizar operaciones
    m_f1,m_f2,m_f3,m_f4: Float; -- Floats necesarios para completar las operaciones
    str                : SU.Unbounded_String; -- Output de consola

    -- Asignar valor a la variable S
    function Init(t_R,t_I: Float) return Complejo is
    begin
	S.m_Real:=t_R;
	S.m_Imaginaria:=t_I;
	
	return S;
    end Init;

    -- Funcion suma
    function "+"(t_X,t_Y: in Complejo) return Complejo is
    begin
	m_f1:=t_X.m_Real;
	m_f2:=t_X.m_Imaginaria;
	m_f3:=t_Y.m_Real;
	m_f4:=t_Y.m_Imaginaria;
	
	-- Calculo de las partes del numero complejo
	S.m_Real:=m_f1+m_f3;
	S.m_Imaginaria:=m_f2+m_f4;
	  
	return S;
    end "+";

    -- Funcion resta
    function "-"(t_X,t_Y: in Complejo) return Complejo is
    begin
	m_f1:=t_X.m_Real;
	m_f2:=t_X.m_Imaginaria;
	m_f3:=t_Y.m_Real;
	m_f4:=t_Y.m_Imaginaria;
	
	-- Calculo de las partes del numero complejo
	S.m_Real:=m_f1-m_f3;
	S.m_Imaginaria:=m_f2-m_f4;
	
	return S;
    end "-";

    -- Funcion multiplicacion
    function "*"(t_X,t_Y: in Complejo) return Complejo is
    begin
	m_f1:=t_X.m_Real;
	m_f2:=t_X.m_Imaginaria;
	m_f3:=t_Y.m_Real;
	m_f4:=t_Y.m_Imaginaria;
	
	-- Calculo de las partes del numero complejo
	S.m_Real:=(m_f1*m_f3)-(m_f2*m_f4);
	S.m_Imaginaria:=(m_f1*m_f4)+(m_f2*m_f3);
	
	return S;
    end "*";

    -- Funcion división
    function "/"(t_X,t_Y: in Complejo) return Complejo is
    begin
	m_f1:=t_X.m_Real;
	m_f2:=t_X.m_Imaginaria;
	m_f3:=t_Y.m_Real;
	m_f4:=t_Y.m_Imaginaria;

	-- Calculo de las partes del numero complejo
	S.m_Real:=((m_f1*m_f3)+(m_f2*m_f4))/((m_f3*m_f3)+(m_f4*m_f4));
	S.m_Imaginaria:=((m_f2*m_f3)-(m_f1*m_f4))/((m_f3*m_f3)+(m_f4*m_f4));
	
	return S;
    end "/";

    -- Función conjugado
    function Conjugacion(t_X: in Complejo) return Complejo is
    begin
	m_f1:=t_X.m_Real;
	m_f2:=t_X.m_Imaginaria;
	
	-- Calculo de las partes del numero complejo
	S.m_Real:=m_f1;
	S.m_Imaginaria:=m_f2*(-1.0);
	
	return S;
    end Conjugacion;

    -- Devolvemos la parte real
    function Real(t_X: in Complejo) return Float is
    begin
	return t_X.m_Real;
    end Real;

    -- Devolvemos la parte imaginaria
    function Imaginaria(t_X: in Complejo) return Float is
    begin
	return t_X.m_Imaginaria;
    end Imaginaria;

    -- Imprimir por consoala del numero complejo
    function ToString(t_X: in Complejo) return SU.Unbounded_String is
    begin

	str:=SU.To_Unbounded_String(Real(t_X)'Image);
	if(Imaginaria(t_X)>=0.0) then
	    SU.Append(str, SU.To_Unbounded_String(" + "));
	else
	    SU.Append(str, SU.To_Unbounded_String(" "));
	end if;
	
	SU.Append(str, SU.To_Unbounded_String(Imaginaria(t_X)'Image));
	SU.Append(str, SU.To_Unbounded_String("i"));

	return str;

    end ToString;

    procedure Put(t_X:Complejo) is C : Complejo;
    begin
	C:=t_X;
    end Put;

    procedure Put_Line(t_X:Complejo) is C : Complejo;
    begin
	C:=t_X;
    end Put_Line;

end numeros_complejos;
