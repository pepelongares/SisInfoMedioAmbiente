package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdk.management.resource.ResourceRequestDeniedException;

/**
 * Servlet que redirige a la entrada seleccionada
 */
@WebServlet(description = "Carga la entrada seleccionada", urlPatterns = { "/CargarEntrada" })
public class CargarEntrada extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CargarEntrada() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Hay que redirigir a la pagina jsp relativa a la entrada seleccionada.
		// Al ser metodo get, va implicito el id en la url.
		System.out.println("ME han llamado");
		String id = request.getParameter("id"); 
		request.setAttribute("login", request.getParameter("user"));
		request.getRequestDispatcher( "entrada.jsp?id="+id ).forward( request, response );
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}