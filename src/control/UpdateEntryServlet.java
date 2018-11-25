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
import datos.VO.CuestionarioVO;
import datos.VO.EntradaVO;
import datos.VO.GrupoVO;
import datos.VO.RespuestaVO;

/**
 * Servlet implementation class UpdateEntryServlet
 */
@WebServlet("/UpdateEntryServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*10, 	// 10 MB 
maxFileSize=1024*1024*50,      	// 50 MB
maxRequestSize=1024*1024*100)   	// 100 MB
public class UpdateEntryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateEntryServlet() {
        super();
    }
    
    private static final String UPLOAD_DIR = "img/";
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
    		request.setCharacterEncoding("UTF-8");
    		// Parametros necesarios
        	
        	String email = request.getParameter("usuario");
        	
    		String blog_title = request.getParameter("blog_title");
    		String blog_body = request.getParameter("blog_body");
    		String blog_advice = request.getParameter("blog_advice");
    		String blog_challenge = request.getParameter("blog_challenge");
    		System.out.println(blog_body);
    		
    		String q1_question = request.getParameter("cuestionario1");
    		String[] q1_answer = new String[5];
    		q1_answer[0] = request.getParameter("respuesta1.1");
    		q1_answer[1] = request.getParameter("respuesta1.2");
    		q1_answer[2] = request.getParameter("respuesta1.3");
    		q1_answer[3] = request.getParameter("respuesta1.4");
    		q1_answer[4] = request.getParameter("respuesta1.5");
    		String q1_correct = request.getParameter("optradio1");
    		
    		String q2_question = request.getParameter("cuestionario2");
    		String[] q2_answer = new String[4];
    		q2_answer[0] = request.getParameter("respuesta2.1");
    		q2_answer[1] = request.getParameter("respuesta2.2");
    		q2_answer[2] = request.getParameter("respuesta2.3");
    		q2_answer[3] = request.getParameter("respuesta2.4");
    		
    		String idAux = request.getParameter("idEntrada");
    		int idEntrada = Integer.parseInt(idAux);
    		
    		// Conseguimos el path del servidor y construimos el path donde guardar la imagen
    		String applicationPath = request.getServletContext().getRealPath("");
            String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;
            System.out.println(uploadFilePath);
            
    		// Creamos un objeto fachada con el que rellenar los objetos necesarios para crear una nueva entrada
    		Facade fachada = new Facade();

    		GrupoVO grupoUsuario = new GrupoVO();
    		grupoUsuario = fachada.getGrupoUsuario(email);
    		int idGrupo = grupoUsuario.getId();
       
            String fileName = null;
            String aux = null;
            //Get all the parts from request and write it to the file on server
            for (Part part : request.getParts()) {
            	fileName = getFileName(part);
            	System.out.println(fileName);
            	if(fileName != "") {
            		aux = "img" + Integer.toString(idEntrada+1) + fileName.toLowerCase();
                    part.write(uploadFilePath + File.separator + aux);
            	}              
            }	

            List<RespuestaVO> r1 = new ArrayList<RespuestaVO>();
            List<RespuestaVO> r2 = new ArrayList<RespuestaVO>();
            RespuestaVO rAux = null;
            for(int i=0;i<5;i++) {
            	if(!q1_answer[i].equals("")){
            		rAux = new RespuestaVO(i, q1_answer[i], 0, idEntrada+1);
                	r1.add(rAux);
            	}
            }
            for(int i=0;i<4;i++) {
            	if(!q2_answer[i].equals("")) {
            		rAux = new RespuestaVO(i, q2_answer[i], 1, idEntrada+1);
                	r2.add(rAux);
            	}
            }
            
            System.out.println(r1);
            
            System.out.println(r2);
            
            
            CuestionarioVO c1 = new CuestionarioVO(0, q1_question, 0, 0, Integer.parseInt(q1_correct), idEntrada+1, r1);
            CuestionarioVO c2 = new CuestionarioVO(1, q2_question, 0, 0, 0, idEntrada+1, r2);
            
            
            EntradaVO entradaNueva = new EntradaVO(null, 0, idGrupo, blog_title, "img/"+ aux, blog_challenge, blog_advice,
        			idEntrada, blog_body, c1, c2);
            
            boolean sucess = fachada.modificarEntrada(idEntrada,entradaNueva);
            int result = -1;
            if(sucess) {result = 3;}
            
            request.setAttribute("sucess", String.valueOf(result));
            request.getRequestDispatcher("alumnoAdmin.jsp").forward(request, response);
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
	
    /**
     * Utility method to get file name from HTTP header content-disposition
     */
    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
            	String aux = token.substring(token.indexOf("."), token.length()-1);
            	return aux.toLowerCase();
            }
        }
        return "";
    }

}
