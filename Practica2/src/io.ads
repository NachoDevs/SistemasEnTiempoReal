with tipos_datos;
use tipos_datos;

package IO is

    procedure Leer (t_temp : out Temperatura);
    procedure Leer (t_caud : out Caudal);
    procedure Leer (t_rad  : out Radiacion);
    
    procedure Escribir (t_temp : in Temperatura);
    procedure Escribir (t_caud : in Caudal);
    procedure Escribir (t_rad  : in Radiacion);

end IO;
