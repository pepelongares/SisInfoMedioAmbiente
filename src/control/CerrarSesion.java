package control;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.Facade;
import datos.VO.UserVO;
import datos.VO.UsuarioVO;

/**
 * Servlet para la el login de los usuarios del sistema 
 */
@WebServlet("/CerrarSesion")
public class CerrarSesion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CerrarSesion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Llamada al metodo post
		try {
			
			Cookie cookiel = null;
			Cookie cookiec = null;
			cookiel = new Cookie("email", "");
			cookiec = new Cookie("password", "");
			cookiel.setMaxAge(0);
			cookiec.setMaxAge(0);
			response.addCookie(cookiel);
			response.addCookie(cookiec);
			response.sendRedirect("index.jsp");
			
		}catch (Throwable theException) {
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
