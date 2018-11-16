package datos.DAO;

import datos.VO.UsuarioVO;

import java.sql.*;
import java.util.*;


/* Une la clase de UserVO con la base de datos */
public class UsuarioDAO {

	/*
	 * Busca en la base de datos si existe el usuario "usuario". Si está en la BD,
	 * devuelve un objeto UserVO con todos los atributos salvo la contraseña
	 */
	public static UsuarioVO buscarUsuario(String correo, Connection conexion) {
		String query = "SELECT * FROM Usuario WHERE correo=?"; //Query para buscar al usuario
		
		UsuarioVO result = null;
		
		// Realizamos la busqueda en la BD
		try {
			PreparedStatement ps = conexion.prepareStatement(query);
			ps.setString(1, correo);
			
			ResultSet rs = ps.executeQuery(); //Se ejecuta la query
			if(!rs.first()) { //Si no existe ningun usuario
				throw new SQLException("ERROR: No se ha encontrado ningun usuario con email: "+correo);
			}else { //Existe un usuario
				result = new UsuarioVO();
				result.setName(rs.getString("nombre"));
	        	result.setEmail(rs.getString("correo"));
	        	result.setYear(rs.getInt("nacimiento"));
	        	result.setRol(rs.getInt("rol"));
	        	result.setPuntuation(rs.getInt("puntuacion"));
			}
		}catch(SQLException se) {
			se.printStackTrace(); 
		}catch(Exception e) {
			e.printStackTrace(System.err);
		}
		
		return result;
	}
	
	/*
	 * Devuelve el tipo de usuario que es
	 */
	public static int consigueTipo(String correo, Connection conexion) {
		String query = "SELECT rol FROM Usuario WHERE correo = ?"; //Query para buscar al usuario
		
		int result = 0;
		
		// Realizamos la busqueda en la BD
		try {
			PreparedStatement ps = conexion.prepareStatement(query);
			ps.setString(1, correo);
			
			ResultSet rs = ps.executeQuery(); //Se ejecuta la query
			if(rs.next()) {
				result = rs.getInt("rol");
			}
			
		}catch(SQLException se) {
			se.printStackTrace(); 
		}catch(Exception e) {
			e.printStackTrace(System.err);
		}
		
		return result;
	}

	
	/*
	 * Busca en la base de datos si existe un usuario, con email y contraseña.
	 * Si existe, devuelve un usuario con todos los datos, para hacer un login en
	 * el sistema
	 */
	public static UsuarioVO login(String correo, String pass, Connection conexion) {
		String query = "SELECT * FROM Usuario WHERE correo= ? AND password= ?"; //Query para buscar al usuario
		
		UsuarioVO result = null;
		
		// Se realiza la busqueda en la BD
		try {
			PreparedStatement ps = conexion.prepareStatement(query);
			ps.setString(1, correo);
			ps.setString(2, pass);
			
			ResultSet rs = ps.executeQuery(); //Se lanza la query
			
			if(!rs.first()) { //Si no existe ningun usuario
				throw new SQLException("ERROR: No se ha encontrado ningun usuario con email: "+correo);
			}else { //Existe un usuario
				result = new UsuarioVO();
				result.setName(rs.getString("nombre"));
	        	result.setEmail(rs.getString("correo"));
	        	result.setYear(rs.getInt("nacimiento"));
	        	result.setRol(rs.getInt("rol"));
	        	result.setPuntuation(rs.getInt("puntuacion"));
			}
		}catch(SQLException se) {
			se.printStackTrace(); 
		}catch(Exception e) {
			e.printStackTrace(System.err);
		}
		
		return result;
		
	}
	

    /*
     * Añade al usuario user a la base de datos		
     */
	 public static boolean anyadirUsuario(UsuarioVO usuario, Connection conexion) {
		 String query = "INSERT INTO usuario (correo,password,rol,nombre,nacimiento,puntuacion,idGrupo) VALUES "+
                                           " (?,?,?,?,?,?,?)";
		 
		 boolean result = false;
		 
		 try {
			 PreparedStatement ps = conexion.prepareStatement(query);
    		 ps.setString(1, usuario.getEmail());
    		 ps.setString(2, usuario.getPassword());
    		 ps.setInt(3, usuario.getRol());
    		 ps.setString(4, usuario.getName());
    		 ps.setInt(5, usuario.getYear());
    		 ps.setInt(6, usuario.getPuntuation());
    		 ps.setInt(7, usuario.getGroup());
    		 
    		 
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
     * Añade al usuario user a la base de datos		
     */
	 public static boolean modificarUsuario(String correo, UsuarioVO usuario, Connection conexion) {
		 String query = "UPDATE Usuario SET correo=?,password=?,rol=?,nombre=?,nacimiento=?,puntuacion=?,idGrupo=? WHERE correo=?";
		 
		 
		 
		 boolean result = false;
		 
		 try {
			 PreparedStatement ps = conexion.prepareStatement(query);
    		 ps.setString(1, usuario.getEmail());
    		 ps.setString(2, usuario.getPassword());
    		 ps.setInt(3, usuario.getRol());
    		 ps.setString(4, usuario.getName());
    		 ps.setInt(5, usuario.getYear());
    		 ps.setInt(6, usuario.getPuntuation());
    		 ps.setInt(7, usuario.getGroup());
    		 ps.setString(8, correo);
    		 
    		 
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
     * Suma los puntos al usuario	
     */
	 public static boolean sumarPuntos(String correo, int puntos, Connection conexion) {
		 String query = "UPDATE Usuario SET puntuacion=puntuacion+? WHERE correo=?";
		 
		 boolean result = false;
		 
		 try {
			 PreparedStatement ps = conexion.prepareStatement(query);
    		 ps.setInt(1, puntos);
    		 ps.setString(2, correo);
    		 
    		 
    		 
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
	  * Devuelve la lista TOP 5 de los usuarios con mayor puntuacion
	  */
	 public static List<UsuarioVO> topCinco(Connection conexion){
		 String query = "SELECT * FROM Usuario WHERE rol > 1 AND puntuacion <> 0 ORDER BY puntuacion DESC LIMIT 5";
		 
		 
		 List<UsuarioVO> top5 = new ArrayList<UsuarioVO>(); //Lista TOP5
		 try {
			PreparedStatement ps = conexion.prepareStatement(query);

			ResultSet rs = ps.executeQuery(); //Se ejecuta la query
			
			UsuarioVO usuario = null;
			// Mientras exista elementos, los vamos añadiendo
			while(rs.next()) {
				usuario = new UsuarioVO(rs.getString("correo"), null, rs.getInt("rol"), 
					                 rs.getString("nombre"), rs.getInt("nacimiento"), rs.getInt("puntuacion"),
					                 rs.getInt("idGrupo"));
				top5.add(usuario);
				
			}
		 }catch(SQLException se) {
    		 se.printStackTrace(); 
    	 }catch(Exception e) {
    		 e.printStackTrace(System.err);
    	 }
		 
		 return top5;
	 }
	 
	 /**
	  * Devuelve una lista de todos los acertantes de la pregunta de idEntrada
	  * @param idEntrada
	  * @param conexion
	  * @return
	  */
	 public static List<UsuarioVO> consigueAcertantes(int idEntrada, Connection conexion){
		List<UsuarioVO> retVal = new ArrayList();
		String query = "SELECT DISTINCT u.* FROM Usuario u Contestar c1, Cuestionario c2"
                        + " WHERE c1.posPregunta = c2.posCorrecta AND c1.correo=u.correo AND "
                        + " c2.idEntrada=?";
		

		try{
			PreparedStatement ps = conexion.prepareStatement(query);
			ps.setInt(1,idEntrada);
            ResultSet rs = ps.executeQuery();
			while(rs.next()){
                    UsuarioVO usuarioAux = new UsuarioVO();
                    usuarioAux.setName(rs.getString("nombre"));
                    usuarioAux.setEmail(rs.getString("correo"));
                    usuarioAux.setYear(rs.getInt("nacimiento"));
                    usuarioAux.setRol(rs.getInt("rol"));
                    usuarioAux.setPuntuation(rs.getInt("puntuacion"));
                    retVal.add(usuarioAux);
            }
			
		}
		catch(SQLException e){
			e.printStackTrace();
		}catch(Exception e) {
   		 e.printStackTrace(System.err);
   	 	}
		return retVal;
	 }

	 
	 /*
     * Elimina al usuario de la Base de Datos	
     */
	 public static boolean eliminarUsuario(String correo, Connection conexion) {
		 String query = "DELETE FROM Usuario WHERE correo = ?";
		 
		 boolean result = false;
		 
		 try {
			 PreparedStatement ps = conexion.prepareStatement(query);
    		 ps.setString(1, correo);
    		 
    		 // Borrar usuario
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
     * Devuelve verdad si y solo si el usuario ha contestado el cuestionario de tipo 'tipo'
     * relativo a la entrada idEntrada	
     */
	 public static boolean haContestado(String correo, int tipo, int idEntrada, Connection conexion) {
		 String query = "SELECT DISTINCT correo FROM contestar c WHERE c.idEntrada=? AND "+
	                    "c.tipo = ? AND c.correo=?";
		 
		 boolean result = false;
		 
		 try {
			 PreparedStatement ps = conexion.prepareStatement(query);
			 ps.setInt(1, idEntrada);
			 ps.setInt(2, tipo);
			 ps.setString(3, correo);
    		 
    		 
    		 
    		 // Realizar busqueda
    		 ResultSet rs = ps.executeQuery();
    		 
    		 // Si no ha podido registrarse, es por que algun parametro es incorrecto
    		 if(!rs.first()) {
    			 result = false;
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
