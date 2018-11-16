package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.Facade;
import datos.DAO.UsuarioDAO;
import datos.VO.UserVO;
import datos.VO.UsuarioVO;

/**
 * Servlet para la el login de los usuarios del sistema 
 */
@WebServlet("/EliminarUsuario")
public class EliminarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EliminarUsuario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Llamada al metodo post
		try {
			
			doPost(request,response);
			
		}catch (Throwable theException) {
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String correo = request.getParameter("email2");
		
		Facade fachada = new Facade();
		boolean haPodido = false;
		try {
			
			haPodido = fachada.eliminarUsuario(correo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(haPodido == true) {
			response.sendRedirect("index.jsp"); // De momento de depuracion, deberia salir una pagina personalizada
		}else { // No ha podido eliminar, algun campo incorrecto, o ya existe
			
		}
	}

}
