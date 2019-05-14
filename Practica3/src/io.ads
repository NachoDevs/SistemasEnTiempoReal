with tipos_datos;
use tipos_datos;

with semaforos;
use semaforos;

package IO is

    Mutex : Semaphore;
    
    m_tiempoLectura   : Integer := 2;
    m_tiempoCalculo  : Integer := 2;
    m_tiempoEscritura : Integer := 3;
    m_tiempoEnvio     : Integer := 3;
    
    function Leer (t_temp : out Temperatura) return string;
    function Leer (t_caud : out Caudal) return string;
    function Leer (t_rad  : out Radiacion) return string;
    
    function Escribir (t_temp : in Temperatura) return string;
    function Escribir (t_caud : in Caudal) return string;
    function Escribir (t_rad  : in Radiacion) return string;

    function Enviar (t_temp : in Temperatura) return string;
    function Enviar (t_caud : in Caudal) return string;
    function Enviar (t_rad  : in Radiacion) return string;
    
    function Verificar return string;
    
end IO;
