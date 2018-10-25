package datos.DAO;

import datos.VO.GrupoVO;
import datos.VO.UsuarioVO;

import java.sql.*;
import java.util.*;


/* Une la clase de GrupoDao con la BD */
public class GrupoDAO {

	/*
	 * A�ade el grupo a la Base de Datos
	 */
	public static boolean anyadirGrupo(String nombre, Connection conexion) {
		String query = "INSERT INTO grupo(nombre) VALUES (?)";
		 
		 boolean result = false;
		 
		 try {
			 PreparedStatement ps = conexion.prepareStatement(query);
			 ps.setString(1, nombre);
   		 
			 // A�adir grupo
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
	 * Elimina el grupo a la Base de Datos
	 */
	public static boolean borrarGrupo(int id, Connection conexion) {
		String query = "DELETE FROM grupo WHERE id = ?";
		 
		 boolean result = false;
		 
		 try {
			 PreparedStatement ps = conexion.prepareStatement(query);
			 ps.setInt(1, id);
   		 
			 // A�adir grupo
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
	 * Elimina el grupo a la Base de Datos
	 */
	public static boolean modificarGrupo(int id, String nombre, Connection conexion) {
		String query = "UPDATE Grupo SET nombre=? WHERE id=?";
		 
		 boolean result = false;
		 
		 try {
			 PreparedStatement ps = conexion.prepareStatement(query);
			 ps.setString(1, nombre);
			 ps.setInt(2, id);
			 
   		 
			 // A�adir grupo
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
	 * A�ade el grupo a la Base de Datos
	 */
	public static GrupoVO buscarGrupo(GrupoVO grupo, Connection conexion) {
		String query = "SELECT * FROM grupo WHERE id = ? OR nombre = ?";
		 
		GrupoVO result = null;
		 
		 try {
			 PreparedStatement ps = conexion.prepareStatement(query);
			 ps.setInt(1, grupo.getId());
			 ps.setString(2, grupo.getNombre());
   		 
			 // A�adir grupo
			 ResultSet rs = ps.executeQuery();
   		 
			 // Si no ha podido registrarse, es por que algun parametro es incorrecto
			 if(!rs.first()) {
				 throw new SQLException("ERROR: Algun parametro incorrecto");
			 }else { //Si ha podido registrarse, devuelve el mismo objeto
				 result = new GrupoVO();
				 result.setId(rs.getInt("id"));
				 result.setNombre(rs.getString("nombre"));
			 }
		 }catch(SQLException se) {
			 se.printStackTrace(); 
		 }catch(Exception e) {
			 e.printStackTrace(System.err);
		 }
		 
		 return result;
	}
			 
	 
}
