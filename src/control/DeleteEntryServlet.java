package control;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.Facade;

/**
 * Servlet implementation class DeleteEntryServlet
 */
@WebServlet("/DeleteEntryServlet")
public class DeleteEntryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteEntryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idAux = request.getParameter("idEntrada");
		int idEntrada = Integer.parseInt(idAux);
		Facade fachada = new Facade();
		boolean sucess = false;
		
		String applicationPath = request.getServletContext().getRealPath("");
        String deleteFilePath = applicationPath + File.separator;
		
		try {
			sucess = fachada.eliminarEntradaAlumno(idEntrada,deleteFilePath);	     
			if(sucess) {
				request.setAttribute("sucess", String.valueOf(2));
			}else {
				request.setAttribute("sucess", String.valueOf(-1));
			}
            request.getRequestDispatcher("alumnoAdmin.jsp").forward(request, response);
		}catch (Throwable theException) {
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
