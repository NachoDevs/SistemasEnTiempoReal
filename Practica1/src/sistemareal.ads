with ada.text_io;

package SistemaReal is

    beta: float := 0.13;
    Leq : float := 15.0;
    h   : float := 4.0;
    c   : float := 1080000.0;
    Cp  : float := 4190.0;
    rho : float := 97.05;    --p
    
    maxRow : integer := 15;
    maxCol : integer := 8;

    type sensores is (St1, St2, St3, St4, Sc1, Sc2, Sr1, Sd1); 
    
    type sensorsData is array (1 .. maxRow, sensores) of float;
    
    type outputData  is array (1 .. maxCol) of float;
   
    function Planta (t_k : integer; t_sr1, t_st4, t_st3 : float) return outputData; -- devuelve un vector con los datos

private 
    
        
end SistemaReal;
