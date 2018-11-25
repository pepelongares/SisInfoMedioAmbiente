package datos.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import datos.VO.CuestionarioVO;
import datos.VO.EntradaVO;
import datos.VO.RespuestaVO;

public class RespuestaDAO {
	
	/**
	  *  Obtiene las respuestas de un cuestionario
	  */
	public static List<RespuestaVO> obtenerRespuestas(int id, int tipo, Connection conexion) {
		String query = "SELECT * FROM Respuesta WHERE tipoCuestionario=? AND idEntrada=?";
		
		List<RespuestaVO> result = new ArrayList<RespuestaVO>();
		
		try {
			PreparedStatement ps = conexion.prepareStatement(query);
			ps.setInt(1, tipo); ps.setInt(2, id);
			
			ResultSet rs = ps.executeQuery(); //Se ejecuta la query
			
			RespuestaVO respuesta = null;
			while(rs.next()) {
				respuesta = new RespuestaVO(rs.getInt("posicion"),rs.getString("cuerpo"), rs.getInt("tipoCuestionario"), rs.getInt("idEntrada"));
						
				result.add(respuesta);
				
			}
			}catch(SQLException se) {
  		 	se.printStackTrace(); 
  	 		}catch(Exception e) {
  	 		e.printStackTrace(System.err);
  	 	}
		return result;
	}
	
	/*
	 * Añade a la base de datos una respuesta de un cuestionario
	 */
	public static boolean anyadirRespuesta(RespuestaVO respuesta, Connection conexion) {
		 String query = "INSERT INTO Respuesta (posicion, cuerpo, tipoCuestionario, idEntrada) VALUES (?,?,?,?)";

		 boolean result = false;

		 try {
			PreparedStatement ps = conexion.prepareStatement(query);
			ps.setInt(1, respuesta.getPosicion());
			ps.setString(2, respuesta.getCuerpo());
			ps.setInt(3, respuesta.getTipoCuestionario());
			ps.setInt(4, respuesta.getIdEntrada());


			// Se ejecuta la adicion
			int rs = ps.executeUpdate();
			
			// Si no ha podido registrarse, es por que algun parametro es incorrecto
			if(rs == 0) {
				throw new SQLException("ERROR: Algun parametro incorrecto");
			}else { //Si ha podido registrarse, devuelve el mismo objeto

				result = true; 
			}
		}catch(SQLException se) {
			se.printStackTrace(); 
		}catch(Exception e) {
			e.printStackTrace(System.err);
		}

		 return result;
	}
	
	/**
	 * Borra la respuesta de una entrada
	 * @param idEntrada
	 * @param conexion
	 * @return
	 */
	public static boolean borrarRespuesta(int idEntrada, Connection conexion) {
	     String query = "DELETE FROM respuesta WHERE idEntrada=?";

	     boolean result = false;

	     try {
	      PreparedStatement ps = conexion.prepareStatement(query);
	      ps.setInt(1, idEntrada);
	      
	      // Se ejecuta la qwery
	      int rs = ps.executeUpdate();
	      
	      if(rs == 0) {
	        throw new SQLException("ERROR: Algun parametro incorrecto");
	      }else {

	        result = true; 
	      }
	    }catch(SQLException se) {
	      se.printStackTrace(); 
	    }catch(Exception e) {
	      e.printStackTrace(System.err);
	    }

	     return result;
	  }
}
