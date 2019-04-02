with Ada.Text_IO;
use Ada.Text_IO;

package body IO is

    ----------------Leer--------------------
    
    procedure Leer (t_temp : out Temperatura) is
    begin
	t_temp := 10.0;
	Put_Line ("Leyendo temperatura: " & t_temp'image);
    end;
    
    procedure Leer (t_caud : out Caudal) is
    begin
	t_caud := 10.0;
	Put_Line ("Leyendo caudal: " & t_caud'image);
    end;

    procedure Leer (t_rad  : out Radiacion) is
    begin
	t_rad := 10.0;
	Put_Line ("Leyendo radiacion: " & t_rad'image);
    end;

   --------------Escribir------------------
    
    procedure Escribir (t_temp : in Temperatura) is
    begin
	Put_Line ("Escribiendo temperatura: " & t_temp'image);
    end;
    
    procedure Escribir (t_caud : in Caudal) is
    begin
	Put_Line ("Escribiendo caudal: " & t_caud'image);
    end;

    procedure Escribir (t_rad : in Radiacion) is
    begin
	Put_Line ("Escribiendo radiacion: " & t_rad'image);
    end;
    
    ---------------Enviar-------------------
    
    procedure Enviar (t_temp : in Temperatura) is
    begin
	Put_Line ("Enviando temperatura: " & t_temp'image);
    end;
    
    procedure Enviar (t_caud : in Caudal) is
    begin
	Put_Line ("Enviando caudal: " & t_caud'image);
    end;

    procedure Enviar (t_rad : in Radiacion) is
    begin
	Put_Line ("Enviando radiacion: " & t_rad'image);
    end;
    
end IO;
