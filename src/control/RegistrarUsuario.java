package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
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
@WebServlet("/RegistrarUsuario")
public class RegistrarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrarUsuario() {
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
		request.setCharacterEncoding("UTF-8");
		String nombre = request.getParameter("name");
		String correo = request.getParameter("email");
		String pass   = request.getParameter("inputPassword");
		String anyo   = request.getParameter("edad");
		String grupo  = request.getParameter("grupo");
		String rol    = request.getParameter("rol");  
		
		Facade fachada = new Facade();
		boolean haPodido = false;
		UsuarioVO usuario = null;
		if(grupo == null || rol == null) { // Registro de usuario externo
			usuario = new UsuarioVO(correo, pass, 3, nombre, Integer.parseInt(anyo), 0, 1);
			try {
				System.out.println(usuario);
				haPodido = fachada.anyadirUsuario(usuario);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else {				// Registro de usuario interno
			
			if(Integer.parseInt(rol) == 0 || Integer.parseInt(rol) == 1) { //Profesor o admin -> Grupo no carteles
				usuario = new UsuarioVO(correo, pass, Integer.parseInt(rol), nombre, Integer.parseInt(anyo), 0, 1);
			}else {
				usuario = new UsuarioVO(correo, pass, Integer.parseInt(rol), nombre, Integer.parseInt(anyo), 0, Integer.parseInt(grupo));
			}
			
			try {
				haPodido = fachada.anyadirUsuario(usuario);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println(usuario);
		if(haPodido == true) {
			RequestDispatcher rd = request.getRequestDispatcher("LoginServlet");
			request.setAttribute("emailLogin", usuario.getEmail());
			request.setAttribute("passWordLogin", usuario.getPassword());
			rd.forward(request,response);
			//response.sendRedirect("index.jsp"); // De momento de depuracion, deberia salir una pagina personalizada
		}else { // No ha podido registrarse, algun campo incorrecto, o ya existe
			
		}
	}

}
