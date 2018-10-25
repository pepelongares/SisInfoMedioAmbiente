package datos.BD;

// Importamos las clases de conexion a SQL
import java.sql.*;

public class GestorConexionesJava {

	// JDBC nombre del driver y URL de BD
	 private static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";  
	 private static final String DB_URL = "jdbc:mysql://localhost:3306/prueba?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	 
	 // Credenciales de la Base de Datos
	 private static final String USER = "username";
	 private static final String PASS = "password";
	 
	 static {			
			try {
				Class.forName(JDBC_DRIVER);
			} catch (ClassNotFoundException e) {
				e.printStackTrace(System.err);
			}	
	}
	 
	// Devuelve la conexion, para no tener que abrirla y cerrarla siempre.
	 public final static Connection getConnection() throws SQLException {
					return DriverManager.getConnection(DB_URL, USER, PASS);
	 }
	
}
