package datos;

import java.sql.*;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import datos.BD.GestorConexionesJava;
import datos.DAO.ContestarDAO;
import datos.DAO.CuestionarioDAO;
import datos.DAO.EntradaDAO;
import datos.DAO.GrupoDAO;
import datos.DAO.RespuestaDAO;
import datos.DAO.UsuarioDAO;
import datos.VO.ContestarVO;
import datos.VO.CuestionarioVO;
import datos.VO.EntradaVO;
import datos.VO.GrupoVO;
import datos.VO.RespuestaVO;
import datos.VO.UsuarioVO;

// Clase fachada que interacciona con los demas objetos
public class Facade {

	public boolean eliminarUsuario(String correo) throws SQLException {
		Connection conexion = null;
		boolean result = false;
		try {
			conexion = GestorConexionesJava.getConnection();
			result = UsuarioDAO.eliminarUsuario(correo, conexion);
			
		}catch (Exception e) {
			e.printStackTrace(System.err);
		}finally {
			conexion.close();
		}
		
		return result;
	}
	
	
	public List<UsuarioVO> obtenerUsuarios() throws SQLException{
		Connection conexion = null;
		List<UsuarioVO> result = new ArrayList<UsuarioVO>();
		try {
			conexion = GestorConexionesJava.getConnection();
			result = UsuarioDAO.consigueUsuarios(conexion);
			
		}catch (Exception e) {
			e.printStackTrace(System.err);
		}finally {
			conexion.close();
		}
		
		return result;
	}
	
	public List<GrupoVO> obtenerGrupos() throws SQLException{
		Connection conexion = null;
		List<GrupoVO> result = new ArrayList<GrupoVO>();
		try {
			conexion = GestorConexionesJava.getConnection();
			result = GrupoDAO.consigueGrupos(conexion);
			
		}catch (Exception e) {
			e.printStackTrace(System.err);
		}finally {
			conexion.close();
		}
		
		return result;
	}
	
	public int numEntradas() throws SQLException {
		Connection conexion = null;
		int result = 0;
		try {
			conexion = GestorConexionesJava.getConnection();
			result = EntradaDAO.numEntradas(conexion);
			
		}catch (Exception e) {
			e.printStackTrace(System.err);
		}finally {
			conexion.close();
		}
		
		return result;
	}
	
	public int consigueTipo(String correo) throws SQLException {
		Connection conexion = null;
		int result = 0;
		try {
			conexion = GestorConexionesJava.getConnection();
			result = UsuarioDAO.consigueTipo(correo, conexion);
			
		}catch (Exception e) {
			e.printStackTrace(System.err);
		}finally {
			conexion.close();
		}
		
		return result;
	}
	
	public boolean anyadirUsuario(UsuarioVO usuario) throws SQLException {
		Connection conexion = null;
		boolean result = false;
		try {
			conexion = GestorConexionesJava.getConnection();
			result = UsuarioDAO.anyadirUsuario(usuario, conexion);
			
		}catch (Exception e) {
			e.printStackTrace(System.err);
		}finally {
			conexion.close();
		}
		
		return result;
	}
	
	public boolean anyadirGrupo(String nombre) throws SQLException {
		Connection conexion = null;
		boolean result = false;
		try {
			conexion = GestorConexionesJava.getConnection();
			result = GrupoDAO.anyadirGrupo(nombre, conexion);
			
		}catch (Exception e) {
			e.printStackTrace(System.err);
		}finally {
			conexion.close();
		}
		
		return result;
	}
	
	public boolean borrarGrupo(int id) throws SQLException {
		Connection conexion = null;
		boolean result = false;
		try {
			conexion = GestorConexionesJava.getConnection();
			result = GrupoDAO.borrarGrupo(id, conexion);
			
		}catch (Exception e) {
			e.printStackTrace(System.err);
		}finally {
			conexion.close();
		}
		
		return result;
	}
	
	public boolean borrarContestaciones(String correo) throws SQLException {
		Connection conexion = null;
		boolean result = false;
		try {
			conexion = GestorConexionesJava.getConnection();
			result = ContestarDAO.borrarContestacion(correo, conexion);
			
		}catch (Exception e) {
			e.printStackTrace(System.err);
		}finally {
			conexion.close();
		}
		
		return result;
	}
	
	public boolean modificarUsuario(UsuarioVO user) throws SQLException {
		Connection conexion = null;
		boolean result = false;
		try {
			conexion = GestorConexionesJava.getConnection();
			result = UsuarioDAO.modificarUsuario(user.getEmail(), user, conexion);
			
		}catch (Exception e) {
			e.printStackTrace(System.err);
		}finally {
			conexion.close();
		}
		
		return result;
	}
	
	public UsuarioVO buscarUsuario(String correo, String pass) throws SQLException {
		Connection conexion = null;
		UsuarioVO result = null;
		try {
			conexion = GestorConexionesJava.getConnection();
			result = UsuarioDAO.login(correo, pass, conexion);
			
		}catch (Exception e) {
			e.printStackTrace(System.err);
		}finally {
			conexion.close();
		}
	
		return result;
	}
	
	public UsuarioVO obtenerUsuario(String correo) throws SQLException {
		Connection conexion = null;
		UsuarioVO result = null;
		try {
			conexion = GestorConexionesJava.getConnection();
			result = UsuarioDAO.buscarUsuario(correo, conexion);
			
		}catch (Exception e) {
			e.printStackTrace(System.err);
		}finally {
			conexion.close();
		}
	
		return result;
	}
	
	
	/**
	 * @throws SQLException 
	 */
	public List<EntradaVO> getEntradasPrimeras(int offset) throws SQLException{
		
		Connection conexion = null;
		List<EntradaVO> result = new ArrayList<EntradaVO>();
		try {
			conexion = GestorConexionesJava.getConnection();
			result = EntradaDAO.obtenerNumEntradas(5, offset, conexion);
			
		}catch(Exception e) {
			e.printStackTrace(System.err);
		}finally {
			conexion.close();
		}
		
		return result;
	}
	
	/**
	 * @throws SQLException 
	 */
	public List<Integer> consigueIdsEntradas() throws SQLException{
		
		Connection conexion = null;
		List<Integer> result = new ArrayList<Integer>();
		try {
			conexion = GestorConexionesJava.getConnection();
			result = EntradaDAO.obtenerIdsEntradas(conexion);
			
		}catch(Exception e) {
			e.printStackTrace(System.err);
		}finally {
			conexion.close();
		}
		System.out.println("Lista: " +result);
		return result;
	}
	
	/**
	 * @throws SQLException 
	 */
	public List<UsuarioVO> getTopCinco() throws SQLException{
		
		Connection conexion = null;
		List<UsuarioVO> result = new ArrayList<UsuarioVO>();
		try {
			conexion = GestorConexionesJava.getConnection();
			result = UsuarioDAO.topCinco(conexion);
			
		}catch(Exception e) {
			e.printStackTrace(System.err);
		}finally {
			conexion.close();
		}
		
		return result;
	}
	
	
	/**
	 * @throws SQLException 
	 */
	public EntradaVO getEntradaId(int id) throws SQLException{
		
		Connection conexion = null;
		EntradaVO result = null;
		try {
			conexion = GestorConexionesJava.getConnection();
			result = EntradaDAO.obtenerEntradaUnica(id,conexion);
			
		}catch(Exception e) {
			e.printStackTrace(System.err);
		}finally {
			conexion.close();
		}
		
		return result;
	}
	
	
	/**
	 * Devuelve el grupo que identificado por idGrupo
	 * @param idGrupo
	 * @return
	 * @throws SQLException 
	 */
	public GrupoVO getGrupoEntrada(int idGrupo) throws SQLException {
		Connection conexion = null;
		GrupoVO result = null;
		try {
			conexion = GestorConexionesJava.getConnection();
			result = new GrupoVO(idGrupo,"");
			result = GrupoDAO.buscarGrupo(result, conexion);
			
		}catch(Exception e) {
			e.printStackTrace(System.err);
		}finally {
			conexion.close();
		}
		
		return result;
	}
	
	/**
	 * Devuelve el cuestionario de idEntrada y tipo
	 * @param idEntrada, tipo
	 * @return
	 * @throws SQLException 
	 */
	public CuestionarioVO consigueCuestionario(int idEntrada, int tipo) throws SQLException {
		Connection conexion = null;
		CuestionarioVO result = new CuestionarioVO();
		try {
			conexion = GestorConexionesJava.getConnection();
			result = CuestionarioDAO.obtenerCuestionario(idEntrada, tipo, conexion);
			
		}catch(Exception e) {
			e.printStackTrace(System.err);
		}finally {
			conexion.close();
		}
		
		return result;
	}
	
	public List<RespuestaVO> consigueRespuestas(int id, int tipo) throws SQLException {
		Connection conexion = null;
		List<RespuestaVO> result = new ArrayList<RespuestaVO>();
		try {
			conexion = GestorConexionesJava.getConnection();
			result = RespuestaDAO.obtenerRespuestas(id, tipo, conexion);
			
		}catch(Exception e) {
			e.printStackTrace(System.err);
		}finally {
			conexion.close();
		}
		
		return result;
	}
	
	
	/**
	 * Devuelve verdad si y solo si el usuario ha respondido la pregunta
	 * @return
	 */
	public boolean haContestado(String correo, int tipo, int idEntrada) throws SQLException {
		Connection conexion = null;
		boolean result = false;
		try {
			// Intentamos la conexion
			System.out.println("Conectamos con BD2...");
			conexion = GestorConexionesJava.getConnection();

			
			result = UsuarioDAO.haContestado(correo, tipo, idEntrada, conexion);
			
		}catch (Exception e) {
			e.printStackTrace(System.err);
		}finally {
			conexion.close();
		}
	
		return result;
	}
	
	public List<RespuestaVO> obtenerRespuestas(int id, int tipo) throws SQLException{
		Connection conexion = null;
		List<RespuestaVO> result = new ArrayList<RespuestaVO>();
		try {
			conexion = GestorConexionesJava.getConnection();
			result = RespuestaDAO.obtenerRespuestas(id, tipo, conexion);
			result.sort(Comparator.comparing(RespuestaVO::getPosicion)); // Ordenar por posicion
		}catch (Exception e) {
			e.printStackTrace(System.err);
		}finally {
			conexion.close();
		}
		
		return result;
	}
	
	/**
	 * Obtiene el grupo de un usuario
	 * @param correo
	 * @return
	 * @throws SQLException
	 */
	public GrupoVO getGrupoUsuario(String correo) throws SQLException {
		Connection conexion = null;
		GrupoVO result = null;
		try {
			conexion = GestorConexionesJava.getConnection();
			result = GrupoDAO.buscarGrupoUsuario(correo, conexion);
		}catch (Exception e) {
			e.printStackTrace(System.err);
		}finally {
			conexion.close();
		}
		
		return result;
	}
	
	/**
	 * Obtiene las entradas de un grupo
	 * @param correo
	 * @return
	 * @throws SQLException
	 */
	public List<EntradaVO> getEntradasGrupo(int idGrupo) throws SQLException {
		Connection conexion = null;
		List<EntradaVO> result = new ArrayList<EntradaVO>();
		try {
			conexion = GestorConexionesJava.getConnection();
			result = EntradaDAO.obtenerEntradasPorGrupo(idGrupo, conexion);
		}catch (Exception e) {
			e.printStackTrace(System.err);
		}finally {
			conexion.close();
		}
		
		return result;
	}
	
	public boolean anyadirEntrada(EntradaVO entrada) throws SQLException {
		Connection conexion = null;
		boolean result = false;
		try {
			conexion = GestorConexionesJava.getConnection();
			result = EntradaDAO.anyadirEntrada(entrada, conexion);
			
		}catch (Exception e) {
			e.printStackTrace(System.err);
		}finally {
			conexion.close();
		}
		
		return result;
	}
	
	public int getUltimoId() throws SQLException {
		Connection conexion = null;
		int result = -1;
		try {
			conexion = GestorConexionesJava.getConnection();
			result = EntradaDAO.obtenerUltimoID(conexion);
		}catch(Exception e){
			e.printStackTrace(System.err);
		}finally {
			conexion.close();
		}
		return result;
	}
	
	public boolean contestar(ContestarVO contesta) throws SQLException {
		Connection conexion = null;
		boolean result = false;
		try {
			conexion = GestorConexionesJava.getConnection();
			result = ContestarDAO.anyadirContestacion(contesta,conexion);
		}catch(Exception e){
			e.printStackTrace(System.err);
		}finally {
			conexion.close();
		}
		return result;
	}
	
	
	
}
