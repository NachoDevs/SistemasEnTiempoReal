with Ada.Text_IO;
use Ada.Text_IO;

package body control is

    t_bomb : estadoBomba := Off;
    
    function ControlarSC1 (t_oSt1 : temperatura;
			    t_oSt2 : temperatura;
			    t_st2  : temperatura;
			    t_st4  : temperatura;
			    t_sr1  : radiacion;
			    t_bomb : out estadoBomba) return string is
    begin
	t_bomb := On;
	
	return ("Controlando SC1(" 
	   & "), estado de la bomba: " & t_bomb'image);
    end;
    

    function ControlarSC2 (t_oSt2 : temperatura;
			    t_st3  : temperatura;
			    t_sd1  : caudal;
			    t_bomb : out estadoBomba) return string is
    begin
	t_bomb := On;
	
	return ("Controlando SC2("  
	   & "), estado de la bomba: " & t_bomb'image);
    end;

end control;
