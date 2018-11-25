package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.Facade;

/**
 * Servlet implementation class moderarEntradaServlet
 */
@WebServlet(description = "modera entradas", urlPatterns = { "/ModerarEntradaServlet" })
public class ModerarEntradaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModerarEntradaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Moderando entrada");
		String idEntrada = request.getParameter("id");
		String tipo = request.getParameter("tipo");
		System.out.println("Id entrada: " +  idEntrada);
		System.out.println("Tipò : " + tipo  );
		Facade fachada = new Facade();
		boolean resultados = false;
		List<String> correosAcertantes = new ArrayList<String>();
		try {
		resultados = fachada.modificaEstadoEntrada(Integer.parseInt(idEntrada), Integer.parseInt(tipo));
		correosAcertantes = fachada.obtenerAcertantes();
		int aciertos = correosAcertantes.size();
		int idAux = fachada.getEntradasPrimeras(0).get(0).getId();
		int participantes = fachada.vecesContestado(idAux, 0);
		fachada.modificarCuestionario(idAux,aciertos, participantes-aciertos);
		for(String correo : correosAcertantes) {
			fachada.sumarPuntos(correo);
		}
		
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		if(resultados = true) {
		response.sendRedirect("ProfesorAdmin.jsp?resp=1");
		}
		else {
			response.sendRedirect("ProfesorAdmin.jsp?resp=0");	
		}
	}

}
