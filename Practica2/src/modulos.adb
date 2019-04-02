with Tipos_Datos;
use tipos_datos;

package body modulos is

    procedure AlmacenamientoDeDatos is
    begin
	null;
    end AlmacenamientoDeDatos;
    
    procedure CampoSolar is
    begin
	io.Leer (m_temp);
	control.ControlarSC2 (m_temp, m_temp, m_caudal, t_bomb);
	io.Escribir (m_temp);
	
	io.Enviar(m_temp);
	
    end CampoSolar;
    
    procedure ModuloDestilacion is
    begin
	null;
    end ModuloDestilacion;
 
    procedure SistemaDeSeguridad is
    begin
	null;
    end SistemaDeSeguridad;
     
    procedure Visualizador is
    begin
	null;
    end Visualizador;

end modulos;
