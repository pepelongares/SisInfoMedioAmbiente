package datos.DAO;

import datos.VO.CuestionarioVO;
import datos.VO.EntradaVO;
import datos.VO.GrupoVO;
import datos.VO.RespuestaVO;
import datos.VO.UsuarioVO;

import java.sql.*;
import java.util.*;


/* Une la clase CuestionarioVO a la Base de datos*/
public class CuestionarioDAO {

	 /**
	  * Obtiene el cuestionario que coincide con id y tipo
	  */
	public static CuestionarioVO obtenerCuestionario(int id, int tipo, Connection conexion) {
		String query = "SELECT * FROM Cuestionario WHERE idEntrada=? AND tipo=?";
		
		CuestionarioVO result = null;
		
		try {
			PreparedStatement ps = conexion.prepareStatement(query);
			ps.setInt(1, id); ps.setInt(2, tipo);
			
			ResultSet rs = ps.executeQuery(); //Se ejecuta la query
			
			
			while(rs.next()) {
				result = new CuestionarioVO(rs.getInt("tipo"), rs.getString("pregunta"), rs.getInt("numFallos"), 
						                    rs.getInt("numAciertos"), rs.getInt("posCorrecta"), rs.getInt("idEntrada"),null);
				result.setRespuestas(RespuestaDAO.obtenerRespuestas(id, tipo, conexion));
				
			}
			}catch(SQLException se) {
   		 	se.printStackTrace(); 
   	 		}catch(Exception e) {
   	 		e.printStackTrace(System.err);
   	 	}
		return result;
	}

	/*
	 * Añade a la base de datos un nuevo cuestionario
	 */
	public static boolean anyadirCuestionario(CuestionarioVO cuestionario, Connection conexion) {
		 String query = "INSERT INTO Cuestionario (tipo, pregunta, numFallos, numAciertos, posCorrecta, idEntrada) VALUES"+
	                    " (?,?,?,?,?,?)";

		 boolean result = false;

		 try {
			PreparedStatement ps = conexion.prepareStatement(query);
			ps.setInt(1, cuestionario.getTipo());
			ps.setString(2, cuestionario.getPregunta());
			ps.setInt(3, cuestionario.getNumFallos());
			ps.setInt(4, cuestionario.getNumAciertos());
			ps.setInt(5, cuestionario.getPosCorrecta());
			ps.setInt(6, cuestionario.getIdEntrada());

			


			// Se ejecuta la adicion
			int rs = ps.executeUpdate();
			
			// Si no ha podido registrarse, es por que algun parametro es incorrecto
			if(rs == 0) {
				throw new SQLException("ERROR: Algun parametro incorrecto");
			}else { //Si ha podido registrarse, devuelve el mismo objeto
				for (Iterator<RespuestaVO> i = cuestionario.getRespuestas().iterator(); i.hasNext();) {
				    RespuestaDAO.anyadirRespuesta(i.next(), conexion);
				}
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
