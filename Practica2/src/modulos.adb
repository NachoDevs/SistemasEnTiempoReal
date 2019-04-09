with Tipos_Datos,
     Ada.Text_IO;
use Tipos_Datos,
    Ada.Text_IO;

package body modulos is

    procedure AlmacenamientoDeDatos is
    begin
	null;
    end AlmacenamientoDeDatos;
    
    procedure CampoSolar is
    begin
	Put_Line("CS: " & io.Leer (m_temp));
	Put_Line("CS: " & control.ControlarSC1 (m_temp, m_temp, m_temp, m_temp, m_rad, t_bomb));
	Put_Line("CS: " & io.Escribir (m_temp));
	Put_Line("CS: " & io.Enviar(m_temp));	

	Visualizador;
	
    end CampoSolar;
    
    procedure ModuloDestilacion is
    begin
	Put_Line("MD: " & io.Leer (m_caudal));
	Put_Line("MD: " & control.ControlarSC2 (m_temp, m_temp, m_caudal, t_bomb));
	Put_Line("MD: " & io.Escribir (m_temp));
	Put_Line("MD: " & io.Enviar (m_temp));
	
	Visualizador;
	
    end ModuloDestilacion;
 
    procedure SistemaDeSeguridad is
    begin
	Put_Line("SS: " & io.Leer (m_temp));
	Put_Line("SS: " & io.Leer (m_temp));
	Put_Line("SS: " & io.Verificar);
	Put_Line("SS: " & io.Enviar (m_temp));
	
	Visualizador;
	
    end SistemaDeSeguridad;
     
    procedure Visualizador is
    begin
	Put_Line("V: " & io.Escribir (m_temp));
	Put_Line("V: " & io.Escribir (m_caudal));
	Put_Line("V: " & io.Escribir (m_rad));
    end Visualizador;

end modulos;
