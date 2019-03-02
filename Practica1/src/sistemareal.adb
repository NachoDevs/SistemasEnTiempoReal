package body sistemareal is

    sd:sensorsData;
    
    i :integer:=0;
    
    function Planta (t_k : integer; t_sr1, t_st4, t_st3 : float) return outputData is
      
	od:outputData;
	
	m_st1   :float;
	m_st1_1 :float;
	m_st2   :float;
	m_st2_1 :float;
	m_st3   :float;
	m_st4   :float;
	m_sc1   :float;
	m_sc2   :float;
	m_sr1   :float;
	m_sd1   :float;
	m_tt    :float;

    begin
	
	if t_k < 2 then    -- Valores por defecto
	    m_st1_1:=50.0;
	    m_st2_1:=60.0;
	else
	    m_st1_1:=sd(t_k-1, St1);
	    m_st2_1:=sd(t_k-1, St2);
	end if;
	    
	m_st3:=t_st3;
	m_st4:=t_st4;
	m_sc1:=20.0;
	m_sc2:=400.0;
	m_sr1:=t_sr1;
	m_sd1:=sd(t_k, Sd1);

	m_tt:=(m_st1_1 + m_st2_1) / 2.0;
	
	m_st2:=m_st1_1 +
	  (((beta * Leq * m_sr1)-(h * (m_tt - m_st4))) *
          (c / (m_sc1 * Cp * rho)));

	m_st1:=m_st2 - 11.0;

		    
	ada.text_io.Put_Line(float'Image(sd(t_k, St1)));
	
	od:=(m_st1, m_st2, m_st3, m_st4, 20.0, 400.0, m_sr1, m_sd1);
	
	For_Loop:
	for s in sensores'Range loop      
	    sd(t_k, s):=od(i);
	    i:=i+1;
	end loop For_Loop;	
	
	return od;
   
    end Planta;
    
begin
    
    -- Inicializando la matriz de datos de sensores
    For_LoopI:
    for i in Integer range 1..maxRow loop
	For_LoopJ:
	for j in sensores'Range loop
	    sd(i, j):=0.0;
	end loop For_LoopJ;
    end loop For_LoopI;
	    
--    sd:=(1  => (0.0, 0.0, 0.0, 0.0, 20.0, 400.0, 0.0, 0.0),
--	2  => (0.0, 0.0, 0.0, 0.0, 20.0, 400.0, 0.0, 0.0),
--	3  => (0.0, 0.0, 0.0, 0.0, 20.0, 400.0, 0.0, 0.0),
--	4  => (0.0, 0.0, 0.0, 0.0, 20.0, 400.0, 0.0, 0.0),
--	5  => (0.0, 0.0, 0.0, 0.0, 20.0, 400.0, 0.0, 0.0),
--	6  => (0.0, 0.0, 0.0, 0.0, 20.0, 400.0, 0.0, 0.0),
--	7  => (0.0, 0.0, 0.0, 0.0, 20.0, 400.0, 0.0, 0.0),
--	8  => (0.0, 0.0, 0.0, 0.0, 20.0, 400.0, 0.0, 0.0),
--	9  => (0.0, 0.0, 0.0, 0.0, 20.0, 400.0, 0.0, 0.0),
--	10 => (0.0, 0.0, 0.0, 0.0, 20.0, 400.0, 0.0, 0.0),
--	11 => (0.0, 0.0, 0.0, 0.0, 20.0, 400.0, 0.0, 0.0),
--	12 => (0.0, 0.0, 0.0, 0.0, 20.0, 400.0, 0.0, 0.0),
--	13 => (0.0, 0.0, 0.0, 0.0, 20.0, 400.0, 0.0, 0.0),
--	14 => (0.0, 0.0, 0.0, 0.0, 20.0, 400.0, 0.0, 0.0),
--	15 => (0.0, 0.0, 0.0, 0.0, 20.0, 400.0, 0.0, 0.0));
   
end sistemareal;
