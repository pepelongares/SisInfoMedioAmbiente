package datos.DAO;

import java.sql.Connection; 
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import datos.VO.CuestionarioVO;
import datos.VO.EntradaVO;
import datos.VO.UsuarioVO;

public class EntradaDAO {
	
	public static int numEntradas(Connection conexion) {
		String query = "SELECT COUNT(*) FROM Entrada";
		int result = 0;
		
		try {
			PreparedStatement ps = conexion.prepareStatement(query);

			ResultSet rs = ps.executeQuery(); //Se ejecuta la query
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		}catch(SQLException se) {
   		 	se.printStackTrace(); 
   	 	}catch(Exception e) {
   	 		e.printStackTrace(System.err);
   	 	}
		return result;
		
	}
	
	/*
	 * Obtiene todas las entradas guardadas en la base de datos
	 */
	public static List<EntradaVO> obtenerEntradas(Connection conexion){
		String query = "SELECT * FROM Entrada";
		
		List<EntradaVO> result = new ArrayList<EntradaVO>(); //Lista
		
		try {
			PreparedStatement ps = conexion.prepareStatement(query);

			ResultSet rs = ps.executeQuery(); //Se ejecuta la query
			
			EntradaVO entrada = null;
			while(rs.next()) {
				entrada = new EntradaVO(rs.getDate("fecha"), rs.getInt("estado"), rs.getInt("idGrupo"), rs.getString("titulo"), 
						rs.getString("nombreImagen"), rs.getString("reto"), rs.getString("consejo"),
						rs.getInt("id"), rs.getString("noticia"), null, null);
				
				CuestionarioVO preguntas = CuestionarioDAO.obtenerCuestionario(entrada.getId(),1,conexion);
				CuestionarioVO opinion = CuestionarioDAO.obtenerCuestionario(entrada.getId(), 0, conexion);
				entrada.setPreguntas(preguntas); entrada.setOpinion(opinion);
				
				result.add(entrada);
			}
		}catch(SQLException se) {
   		 	se.printStackTrace(); 
   	 	}catch(Exception e) {
   	 		e.printStackTrace(System.err);
   	 	}
		return result;
	}
	
	
	/*
	 * Obtiene num entradas PUBLICADAS ordenadas por fecha y con offset
	 */
	public static List<EntradaVO> obtenerNumEntradas(int num, int offset, Connection conexion){
		String query = "SELECT * FROM Entrada WHERE estado = 1 ORDER BY fecha DESC "+
	                   "LIMIT ? OFFSET ?";
		
		List<EntradaVO> result = new ArrayList<EntradaVO>(); //Lista
		
		try {
			PreparedStatement ps = conexion.prepareStatement(query);
			ps.setInt(1, num);
			ps.setInt(2, num*offset);

			ResultSet rs = ps.executeQuery(); //Se ejecuta la query
			
			EntradaVO entrada = null;
			while(rs.next()) {
				entrada = new EntradaVO(rs.getDate("fecha"), rs.getInt("estado"), rs.getInt("idGrupo"), rs.getString("titulo"), 
						rs.getString("nombreImagen"), rs.getString("reto"), rs.getString("consejo"),
						rs.getInt("id"), rs.getString("noticia"), null, null);
				
				// Deberiamos obtener aqui los dos cuestionarios cuyo id es entrada.id
				CuestionarioVO preguntas = CuestionarioDAO.obtenerCuestionario(entrada.getId(),1,conexion);
				CuestionarioVO opinion = CuestionarioDAO.obtenerCuestionario(entrada.getId(), 0, conexion);
				entrada.setPreguntas(preguntas); entrada.setOpinion(opinion);
				
				result.add(entrada);
			}
		}catch(SQLException se) {
   		 	se.printStackTrace(); 
   	 	}catch(Exception e) {
   	 		e.printStackTrace(System.err);
   	 	}
		return result;
	}
	
	
	/*
	 *  Obtiene todas las entradas que quedan pendientes de moderar
	 */
	public static List<EntradaVO> obtenerEntradasPendientes(Connection conexion){
		String query = "SELECT * FROM Entrada WHERE estado = 0 ORDER BY fecha DESC";
		
		List<EntradaVO> result = new ArrayList<EntradaVO>(); //Lista
		
		try {
			PreparedStatement ps = conexion.prepareStatement(query);

			ResultSet rs = ps.executeQuery(); //Se ejecuta la query
			
			EntradaVO entrada = null;
			while(rs.next()) {
				entrada = new EntradaVO(rs.getDate("fecha"), rs.getInt("estado"), rs.getInt("idGrupo"), rs.getString("titulo"), 
						rs.getString("nombreImagen"), rs.getString("reto"), rs.getString("consejo"),
						rs.getInt("id"), rs.getString("noticia"), null, null);
				
				// Deberiamos obtener aqui los dos cuestionarios cuyo id es entrada.id
				CuestionarioVO preguntas = CuestionarioDAO.obtenerCuestionario(entrada.getId(),1,conexion);
				CuestionarioVO opinion = CuestionarioDAO.obtenerCuestionario(entrada.getId(), 0, conexion);
				entrada.setPreguntas(preguntas); entrada.setOpinion(opinion);
				
				result.add(entrada);
			}
		}catch(SQLException se) {
   		 	se.printStackTrace(); 
   	 	}catch(Exception e) {
   	 		e.printStackTrace(System.err);
   	 	}
		return result;
	}
	
	/*
	 *  Obtiene todas las entradas hechas por un grupo
	 */
	public static List<EntradaVO> obtenerEntradasPorGrupo(int idGrupo, Connection conexion){
		String query = "SELECT * FROM Entrada WHERE idGrupo = ? ORDER BY fecha DESC";
		
		List<EntradaVO> result = new ArrayList<EntradaVO>(); //Lista
		
		try {
			PreparedStatement ps = conexion.prepareStatement(query);
			ps.setInt(1, idGrupo);

			ResultSet rs = ps.executeQuery(); //Se ejecuta la query
			
			EntradaVO entrada = null;
			while(rs.next()) {
				entrada = new EntradaVO(rs.getDate("fecha"), rs.getInt("estado"), rs.getInt("idGrupo"), rs.getString("titulo"), 
						rs.getString("nombreImagen"), rs.getString("reto"), rs.getString("consejo"),
						rs.getInt("id"), rs.getString("noticia"), null, null);
				
				// Deberiamos obtener aqui los dos cuestionarios cuyo id es entrada.id
				CuestionarioVO preguntas = CuestionarioDAO.obtenerCuestionario(entrada.getId(),1,conexion);
				CuestionarioVO opinion = CuestionarioDAO.obtenerCuestionario(entrada.getId(), 0, conexion);
				entrada.setPreguntas(preguntas); entrada.setOpinion(opinion);
				
				result.add(entrada);
			}
		}catch(SQLException se) {
   		 	se.printStackTrace(); 
   	 	}catch(Exception e) {
   	 		e.printStackTrace(System.err);
   	 	}
		return result;
	}
	
	
	/*
	 *  Obtiene los datos completos de una entrada
	 */
	public static EntradaVO obtenerEntradaUnica(int id, Connection conexion){
		String query = "SELECT * FROM Entrada WHERE id = ?";
		
		EntradaVO result = null; //Lista
		
		try {
			PreparedStatement ps = conexion.prepareStatement(query);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery(); //Se ejecuta la query
			
			while(rs.next()) {
				result = new EntradaVO(rs.getDate("fecha"), rs.getInt("estado"), rs.getInt("idGrupo"), rs.getString("titulo"), 
						rs.getString("nombreImagen"), rs.getString("reto"), rs.getString("consejo"),
						rs.getInt("id"), rs.getString("noticia"), null, null);
				
				
				CuestionarioVO preguntas = CuestionarioDAO.obtenerCuestionario(result.getId(),1,conexion);
				CuestionarioVO opinion = CuestionarioDAO.obtenerCuestionario(result.getId(), 0, conexion);
				result.setPreguntas(preguntas); result.setOpinion(opinion);
				
			}
		}catch(SQLException se) {
   		 	se.printStackTrace(); 
   	 	}catch(Exception e) {
   	 		e.printStackTrace(System.err);
   	 	}
		return result;
	}
	
	
	/*
	 * Añade a la base de datos una nueva entrada
	 */
	public static boolean anyadirEntrada(EntradaVO entrada, Connection conexion) {
		 String query = "INSERT INTO entrada (nombreImagen,titulo,fecha,noticia,reto,consejo,estado,idGrupo) VALUES "+
                 " (?,?,?,?,?,?,0,?)";

		 boolean result = false;

		 try {
			PreparedStatement ps = conexion.prepareStatement(query);
			ps.setString(1, entrada.getUrlImagen());
			ps.setString(2, entrada.getTitulo());
			ps.setDate(3, entrada.getFecha());
			ps.setString(4, entrada.getNoticia());
			ps.setString(5, entrada.getReto());
			ps.setString(6, entrada.getConsejo());
			ps.setInt(7, entrada.getIdGrupo());


			// Se ejecuta la adicion
			int rs = ps.executeUpdate();
			
			// Si no ha podido registrarse, es por que algun parametro es incorrecto
			if(rs == 0) {
				throw new SQLException("ERROR: Algun parametro incorrecto");
			}else { //Si ha podido registrarse, devuelve el mismo objeto
				if(entrada.getOpinion() != null) CuestionarioDAO.anyadirCuestionario(entrada.getOpinion(), conexion);
				if(entrada.getPreguntas() != null) CuestionarioDAO.anyadirCuestionario(entrada.getPreguntas(), conexion);
				result = true; 
			}
		}catch(SQLException se) {
			se.printStackTrace(); 
		}catch(Exception e) {
			e.printStackTrace(System.err);
		}

		 return result;
	}
	
	
	
	/*
	 * Modifica la entrada id con nuevos valores
	 */
	public static boolean modificarEntrada(int id, EntradaVO entrada, Connection conexion) {
		 String query = "UPDATE entrada SET nombreImagen =?, titulo = ?, fecha = ?, noticia = ?,"+
				 	    " reto = ?, consejo = ?, estado= ?, idGrupo = ? WHERE id = ?";

		 boolean result = false;

		 try {
			PreparedStatement ps = conexion.prepareStatement(query);
			
			ps.setString(1, entrada.getUrlImagen());
			ps.setString(2, entrada.getTitulo());
			ps.setDate(3, entrada.getFecha());
			ps.setString(4, entrada.getNoticia());
			ps.setString(5, entrada.getReto());
			ps.setString(6, entrada.getConsejo());
			ps.setInt(7, entrada.getEstado());
			ps.setInt(8, entrada.getIdGrupo());
			ps.setInt(9, entrada.getId());


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
			

	/*
	 * Añade de la base de datos una entrada cuyo id es 'id'
	 */
	public static boolean eliminarEntrada(int id, Connection conexion) {
		 String query = "DELETE FROM entrada WHERE id =?";

		 boolean result = false;

		 try {
			PreparedStatement ps = conexion.prepareStatement(query);
			ps.setInt(1, id);
	
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

}
