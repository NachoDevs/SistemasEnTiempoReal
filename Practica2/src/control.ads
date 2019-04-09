with tipos_datos
     , Ada.Text_IO;

use tipos_datos
    , Ada.Text_IO;

package control is

    function ControlarSC1 (t_oSt1 : temperatura;
			    t_oSt2 : temperatura;
			    t_st2  : temperatura;
			    t_st4  : temperatura;
			    t_sr1  : radiacion;
			    t_bomb : out estadoBomba) return string;

    function ControlarSC2 (t_oSt2 : temperatura;
			    t_st3  : temperatura;
			    t_sd1  : caudal;
			    t_bomb : out estadoBomba) return string;
   
end control;
