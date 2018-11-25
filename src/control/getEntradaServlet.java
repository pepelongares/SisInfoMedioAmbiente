package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.Facade;
import datos.VO.EntradaVO;

/**
 * Servlet implementation class getEntradaServlet
 */
@WebServlet("/getEntradaServlet")
public class getEntradaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getEntradaServlet() {
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
		try {
			EntradaVO entradaAux = fachada.getDatosEntrada(idEntrada);
		     
		    request.setAttribute("entry", entradaAux);
			request.getRequestDispatcher("modifyEntry.jsp").forward(request, response);
		}catch (Throwable theException) {
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
