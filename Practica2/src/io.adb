with Ada.Text_IO;
use Ada.Text_IO;

package body IO is

    ----------------Leer--------------------
    
    function Leer (t_temp : out Temperatura) return string is
    begin
	t_temp := 10.0;
	Return ("Leyendo temperatura: " & t_temp'image);
    end;
    
    function Leer (t_caud : out Caudal) return string is
    begin
	t_caud := 10.0;
	Return ("Leyendo caudal: " & t_caud'image);
    end;

    function Leer (t_rad  : out Radiacion) return string is
    begin
	t_rad := 10.0;
	Return ("Leyendo radiacion: " & t_rad'image);
    end;

   --------------Escribir------------------
    
    function Escribir (t_temp : in Temperatura) return string is
    begin
	Return ("Escribiendo temperatura: " & t_temp'image);
    end;
    
    function Escribir (t_caud : in Caudal) return string is
    begin
	Return ("Escribiendo caudal: " & t_caud'image);
    end;

    function Escribir (t_rad : in Radiacion) return string is
    begin
	Return ("Escribiendo radiacion: " & t_rad'image);
    end;
    
    ---------------Enviar-------------------
    
    function Enviar (t_temp : in Temperatura) return string is
    begin
	Return ("Enviando temperatura: " & t_temp'image);
    end;
    
    function Enviar (t_caud : in Caudal) return string is
    begin
	Return ("Enviando caudal: " & t_caud'image);
    end;

    function Enviar (t_rad : in Radiacion) return string is
    begin
	Return ("Enviando radiacion: " & t_rad'image);
    end;

    -------------Verificar-----------------
    
    function Verificar return string is
    begin
	Return ("Comprobando temperaturas");
    end;
        
end IO;
