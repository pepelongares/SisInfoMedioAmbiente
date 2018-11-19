package control;

import java.io.IOException;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.Facade;
import datos.VO.UsuarioVO;

/**
 * Servlet para la el login de los usuarios del sistema 
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Llamada al metodo post
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			// Parametros del inicio de sesion
			String correo = request.getParameter("emailLogin");
			String pass = request.getParameter("passWordLogin");
			if(correo == null || pass == null) {
				correo = (String) request.getAttribute("emailLogin");
				pass   = (String) request.getAttribute("passWordLogin");
			}
			
			//Muestra por pantalla la accion
			System.out.println("SERVLET: LOGIN");
			System.out.print("Email: " +correo);
			System.out.println("Password: " +pass);
			System.out.println("----------------------------------");
			
			// Llamamos a la fachada para que nos rellene el usuario	
			Facade fachada = new Facade();
			
			UsuarioVO usuario = fachada.buscarUsuario(correo, pass);
			if(usuario != null) {
				Cookie cookiee = new Cookie("email",correo);
		        Cookie cookiep = new Cookie("password",pass);
				if(usuario.getRol() == 0) { // Si es administrador					
					response.addCookie(cookiee);
				    response.addCookie(cookiep);
					response.sendRedirect("admin.jsp");
				}else {
					// Guardamos las cookies
			        response.addCookie(cookiee);
			        response.addCookie(cookiep);
			        request.setAttribute("user", correo);
			        System.out.println(request.getHeader("Referer"));
			        String page = request.getHeader("Referer").replaceAll("http://localhost:8080/SistemasInformacion/", "");
			        page = page.replace("?loginCorrecto=0", "");
			        page = page.replace("&loginCorrecto=0", "");
			        System.out.println("Pagina: " +page);
			        if(page.contentEquals("pagina_registro.jsp")) {
			        	page = "index.jsp";
			        }
			        response.sendRedirect(page);
				}
			}else {		// Usuario nulo, el login no ha ido bien
				System.out.println("Login incorrecto");
				String page2 = request.getHeader("Referer").replaceAll("http://localhost:8080/SistemasInformacion/", "");
				System.out.println(page2);
				if(page2.contentEquals("pagina_registro.jsp")) {
					
				}else {
					if(page2.contains("?")) {
						page2 = page2 + "&loginCorrecto=0";
					}else {
						page2 = page2 + "?loginCorrecto=0";
					}
					
				}
				response.sendRedirect(page2);
			}
			
			
			/* Comprobamos que tipo de usuario es, para cargar una cosa u otra */
			/* Usuarios: Externo, Profesor o Alumno */
			//Enviamos el nombre que aparecera del usuario en la respuesta
			//request.setAttribute("username", usuario.getName());

			/* Llamamos a la nueva pagina */
			
		}catch (Throwable theException) {
			
		}
	}

}
