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
						rs.getString("urlImagen"), rs.getString("reto"), rs.getString("consejo"),
						rs.getInt("id"), rs.getString("noticia"), null, null);
				
				// Deberiamos obtener aqui los dos cuestionarios cuyo id es entrada.id
				
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
						rs.getString("urlImagen"), rs.getString("reto"), rs.getString("consejo"),
						rs.getInt("id"), rs.getString("noticia"), null, null);
				
				// Deberiamos obtener aqui los dos cuestionarios cuyo id es entrada.id
				// CuestionarioVO preguntas = CuestionarioVO.obtenerCuestionario(entrada.id,tipo0,conexion);
				// CuestionarioVO opinion = Cuestionario.obtenerCuestionario(entrada.id, tipo1, conexion);
				// entrada.setPreguntas(preguntas); entrada.setOpinion(opinion);
				
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
						rs.getString("urlImagen"), rs.getString("reto"), rs.getString("consejo"),
						rs.getInt("id"), rs.getString("noticia"), null, null);
				
				// Deberiamos obtener aqui los dos cuestionarios cuyo id es entrada.id
				// CuestionarioVO preguntas = CuestionarioVO.obtenerCuestionario(entrada.id,tipo0,conexion);
				// CuestionarioVO opinion = Cuestionario.obtenerCuestionario(entrada.id, tipo1, conexion);
				// entrada.setPreguntas(preguntas); entrada.setOpinion(opinion);
				
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
						rs.getString("urlImagen"), rs.getString("reto"), rs.getString("consejo"),
						rs.getInt("id"), rs.getString("noticia"), null, null);
				
				// Deberiamos obtener aqui los dos cuestionarios cuyo id es entrada.id
				// CuestionarioVO preguntas = CuestionarioVO.obtenerCuestionario(entrada.id,tipo0,conexion);
				// CuestionarioVO opinion = Cuestionario.obtenerCuestionario(entrada.id, tipo1, conexion);
				// entrada.setPreguntas(preguntas); entrada.setOpinion(opinion);
				
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
	public static List<EntradaVO> obtenerEntradaUnica(int id, Connection conexion){
		String query = "SELECT * FROM Entrada WHERE id = ?";
		
		List<EntradaVO> result = new ArrayList<EntradaVO>(); //Lista
		
		try {
			PreparedStatement ps = conexion.prepareStatement(query);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery(); //Se ejecuta la query
			
			EntradaVO entrada = null;
			while(rs.next()) {
				entrada = new EntradaVO(rs.getDate("fecha"), rs.getInt("estado"), rs.getInt("idGrupo"), rs.getString("titulo"), 
						rs.getString("urlImagen"), rs.getString("reto"), rs.getString("consejo"),
						rs.getInt("id"), rs.getString("noticia"), null, null);
				
				// Deberiamos obtener aqui los dos cuestionarios cuyo id es entrada.id
				// CuestionarioVO preguntas = CuestionarioVO.obtenerCuestionario(entrada.id,tipo0,conexion);
				// CuestionarioVO opinion = Cuestionario.obtenerCuestionario(entrada.id, tipo1, conexion);
				// entrada.setPreguntas(preguntas); entrada.setOpinion(opinion);
				
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
	 * Añade a la base de datos una nueva entrada
	 */
	public static boolean anyadirEntrada(EntradaVO entrada, Connection conexion) {
		 String query = "INSERT INTO entrada (id,nombreImagen,titulo,fecha,noticia,reto,consejo,estado,idGrupo) VALUES "+
                 " (?,?,?,?,?,?,?,0,?)";

		 boolean result = false;

		 try {
			PreparedStatement ps = conexion.prepareStatement(query);
			ps.setInt(1, entrada.getId());
			ps.setString(2, entrada.getUrlImagen());
			ps.setString(3, entrada.getTitulo());
			ps.setDate(4, entrada.getFecha());
			ps.setString(5, entrada.getNoticia());
			ps.setString(6, entrada.getReto());
			ps.setString(7, entrada.getConsejo());
			ps.setInt(8, entrada.getIdGrupo());


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
	
	
	// Eliminar y modificar de la misma manera que añadir, pero con otra sentencia
	

}
