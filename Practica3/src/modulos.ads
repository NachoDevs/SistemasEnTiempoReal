with tipos_datos,
     io,
     control;

use tipos_datos;

package modulos is
    
    m_temp  : Temperatura := 30.0; 
    m_caudal: Caudal      := 25.0;
    m_rad   : Radiacion   := 1.5;
    
    t_bomb : estadoBomba := Off;
    
    procedure AlmacenamientoDeDatos;
    
    procedure CampoSolar;
    
    procedure ModuloDestilacion;
 
    procedure SistemaDeSeguridad;
     
    procedure Visualizador;
    
end modulos;
