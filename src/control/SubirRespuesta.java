package control;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import datos.Facade;
import datos.DAO.ContestarDAO;
import datos.VO.ContestarVO;
import datos.VO.CuestionarioVO;
import datos.VO.EntradaVO;
import datos.VO.GrupoVO;
import datos.VO.RespuestaVO;

@WebServlet("/SubirRespuesta")

public class SubirRespuesta extends HttpServlet {
 
    private static final long serialVersionUID = 205242440643911308L;
	
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
    	try {
    		request.setCharacterEncoding("UTF-8");
    		// Parametros necesarios
        	
        	String email = request.getParameter("login");
        	int id = Integer.parseInt(request.getParameter("id"));
        	
        	
        	ContestarVO contestar1 = null;
        	ContestarVO contestar2 = null;
        	// Recorrido para coger las respuestas al cuestionario 1 y 2
        	
        	if(request.getParameter("optRadio1") != null) {
        		int i = Integer.parseInt(request.getParameter("optRadio1"));
    			contestar1 = new ContestarVO(id, 0, email, i);
    		}
    		if(request.getParameter("optRadio2") != null) {
    			int i = Integer.parseInt(request.getParameter("optRadio2"));
    			contestar2 = new ContestarVO(id, 1, email, i);
    		}

        	Facade fachada = new Facade();
        	if(contestar1 != null)
        		fachada.contestar(contestar1);
        	if(contestar2 != null)
        		fachada.contestar(contestar2);
        	
        	response.sendRedirect("entrada.jsp?id="+request.getParameter("id"));
        	
        		
        }catch(Throwable theException) {
        		
        }
         
         
    }
 
   
}

