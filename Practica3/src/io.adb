with Ada.Text_IO;
use Ada.Text_IO;

with STR_Tasking;
use STR_Tasking;

package body IO is

    ----------------Leer--------------------
    
    function Leer (t_temp : out Temperatura) return string is
    begin
	t_temp := 2.0;
	Wait(Mutex);
	Tiempo_Computo (0, m_tiempoLectura, 0);
	Signal(Mutex);
	Return ("Leyendo temperatura: " & t_temp'image);
    end;
    
    function Leer (t_caud : out Caudal) return string is
    begin
	t_caud := 2.0;
	Wait(Mutex);
	Tiempo_Computo (0, m_tiempoLectura, 1);
	Signal(Mutex);
	Return ("Leyendo caudal: " & t_caud'image);
    end;

    function Leer (t_rad  : out Radiacion) return string is
    begin
	t_rad := 2.0;
	Wait(Mutex);
	Tiempo_Computo(0, m_tiempoLectura, 2);
	Signal(Mutex);
	Return ("Leyendo radiacion: " & t_rad'image);
    end;

   --------------Escribir------------------
    
    function Escribir (t_temp : in Temperatura) return string is
    begin
	Wait(Mutex);
	Tiempo_Computo(0, m_tiempoEscritura, 0);
	Signal(Mutex);
	Return ("Escribiendo temperatura: " & t_temp'image);
    end;
    
    function Escribir (t_caud : in Caudal) return string is
    begin
	Wait(Mutex);
	Tiempo_Computo(0, m_tiempoEscritura, 1);
	Signal(Mutex);
	Return ("Escribiendo caudal: " & t_caud'image);
    end;

    function Escribir (t_rad : in Radiacion) return string is
    begin
	Wait(Mutex);
	Tiempo_Computo(0, m_tiempoEscritura, 2);
	Signal(Mutex);
	Return ("Escribiendo radiacion: " & t_rad'image);
    end;
    
    ---------------Enviar-------------------
    
    function Enviar (t_temp : in Temperatura) return string is
    begin
	Wait(Mutex);
	Tiempo_Computo(0, m_tiempoEnvio, 0);
	Signal(Mutex);
	Return ("Enviando temperatura: " & t_temp'image);
    end;
    
    function Enviar (t_caud : in Caudal) return string is
    begin
	Wait(Mutex);
	Tiempo_Computo(0, m_tiempoEnvio, 1);
	Signal(Mutex);
	Return ("Enviando caudal: " & t_caud'image);
    end;

    function Enviar (t_rad : in Radiacion) return string is
    begin
	Wait(Mutex);
	Tiempo_Computo(0, m_tiempoEnvio, 2);
	Signal(Mutex);
	Return ("Enviando radiacion: " & t_rad'image);
    end;

    -------------Verificar-----------------
    
    function Verificar return string is
    begin
	Wait(Mutex);
	Tiempo_Computo(0, m_tiempoCalculo, 3);
	Signal(Mutex);
	Return ("Comprobando temperaturas");
    end;
        
end IO;
