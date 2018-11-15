package datos.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import datos.VO.ContestarVO;

public class ContestarDAO {
	
	
	/*
	 * Obtiene todas las respuestas de los usuarios 
	 */
	
    public List <ContestarVO> getRespuestas(Connection conexion) {
		
    	List<ContestarVO> retVal = new ArrayList<ContestarVO>();	
	   try{			  
		     String query = "SELECT *  FROM contestar" ;
		     PreparedStatement ps = conexion.prepareStatement(query);
              ResultSet rs = ps.executeQuery();
              while(rs.next()){
            	  ContestarVO contestarAux = new ContestarVO(rs.getInt("idEntrada"),rs.getInt("tipo"), rs.getString("correo"), rs.getInt("posPregunta"));
            	  retVal.add(contestarAux) ;
            }
        }
        catch(SQLException e){
                 e.printStackTrace();
        }			
		return retVal;
	}
	/*
	 * Devuelve los correos de la gente que ha contestado a esa pregunta con esa respuesta
	 */
	public List <ContestarVO> consigueCorreos(int idEntrada,int tipo,int posPregunta,Connection conexion) {
		
		List<ContestarVO> retVal = new ArrayList<ContestarVO>();	
		  try{			  
		     String query = "SELECT *  FROM contestar WHERE idEntrada = ? AND tipo = ? AND posPregunta = ? ";
		  	 PreparedStatement ps = conexion.prepareStatement(query);
		  	 ps.setString(2, Integer.toString(tipo));
		  	 ps.setString(1, Integer.toString(idEntrada));
		  	 ps.setString(3, Integer.toString(posPregunta));
              ResultSet rs = ps.executeQuery();
              while(rs.next()){
            	  ContestarVO contestarAux = new ContestarVO(idEntrada, tipo, rs.getString("correo"), posPregunta);
            	  retVal.add(contestarAux) ;
            }
          }
         catch(SQLException e){
                 e.printStackTrace();
         }			
		return retVal;
	}


    /*
     * Devuelve si el usuario ha contestado al cuestionario
     */
    public boolean haContestado(String correo,int idEntrada,int tipo,Connection conexion) {
		
		boolean retVal = false;	
		  try{			  
		     String query = "SELECT *  FROM contestar WHERE idEntrada = ? AND tipo = ? AND correo = ?";
		  	 PreparedStatement ps = conexion.prepareStatement(query);
		  	 ps.setInt(2, tipo);
		  	 ps.setInt(1, idEntrada);
		  	 ps.setString(3, correo);
              ResultSet rs = ps.executeQuery();
              if(rs.first()){
            	  retVal = true;
            }
          }
         catch(SQLException e){
                 e.printStackTrace();
         }			
		return retVal;
    }
    
    /**
     * Añade a la base de datos una nueva contestacion de un usuario
     * @param contestacion
     * @param conexion
     * @return
     */
    public boolean anyadirContestacion(ContestarVO contestacion,Connection conexion){
        boolean retVal = false;
         String query = "INSERT INTO entrada (idEntrada,tipo,correo,posPregunta) VALUES "+
        " (?,?,?,?)";
        
        try{
            PreparedStatement ps = conexion.prepareStatement(query);
            ps.setInt(1, contestacion.getIdEntrada());
            ps.setInt(2,contestacion.getTipo());
            ps.setString(3, contestacion.getCorreo());
            ps.setInt(4, contestacion.getPosPregunta());
          // Se ejecuta la adicion
	   int rs = ps.executeUpdate();			
	   // Si no ha podido registrarse, es por que algun parametro es incorrecto
	    if(rs == 0) {
	          throw new SQLException("ERROR: Algun parametro incorrecto");			}
            else { //Si ha podido registrarse, devuelve el mismo objeto
		retVal = true; 
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return retVal;
    }
    
    
	

}