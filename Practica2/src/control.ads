with tipos_datos;
use tipos_datos;

package control is

    procedure ControlarSC1 (t_oSt1 : temperatura;
			    t_oSt2 : temperatura;
			    t_st2  : temperatura;
			    t_st4  : temperatura;
			    t_sr1  : radiacion;
			    t_bomb : out estadoBomba);

    procedure ControlarSC2 (t_oSt2 : temperatura;
			    t_st3  : temperatura;
			    t_sd1  : caudal;
			    t_bomb : out estadoBomba);
   
end control;
