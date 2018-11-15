<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Blog</title>

    <!-- Stylesheet de Bootstrap -->
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Estilos para esta pagina -->
    <link href="css/clean-blog.min.css" rel="stylesheet">
	
	<!--  IMPORTS de JAVA -->
	<%@ page import="datos.VO.EntradaVO" %>
	<%@ page import="datos.VO.RespuestaVO" %>
	<%@ page import="datos.VO.CuestionarioVO" %>
	<%@ page import="datos.VO.GrupoVO" %>
	<%@ page import="datos.Facade" %>
	<%@ page import="java.util.List" %>
	<%@ page import="java.util.ArrayList" %>
	
  </head>

  <body>
  	<%
 		// Caches
 		String login = null;
     	String pass = null;
     	try {
       		Cookie[] cookies = request.getCookies(); 
       		if (cookies != null) {
         		for (int i = 0; i < cookies.length; i++) {
           			if (cookies[i].getName().equals("email")) {
             			login = cookies[i].getValue();
             			System.out.println("Login: "+login);
           
 			          }
           			if (cookies[i].getName().equals("password")) {
             			pass = cookies[i].getValue();
             			System.out.println("Pass: "+pass);
           			}
         		}
       		}
     	} catch (Exception e) {
       		e.printStackTrace(System.err);
       		
     	}
  		if(login == null) request.getParameter("login");
  		
		int id = Integer.parseInt(request.getParameter("id")); //Offset
		boolean haContestadoOpinion = false;
		boolean haContestadoPregunta = false;
		EntradaVO entrada = new EntradaVO();
		Facade fachada = new Facade();
		GrupoVO grupo = new GrupoVO();
		CuestionarioVO opinion = new CuestionarioVO();
		List<RespuestaVO> respOpinion = new ArrayList<RespuestaVO>();
		CuestionarioVO pregunta = new CuestionarioVO();
		List<RespuestaVO> respPregunta = new ArrayList<RespuestaVO>();
		
		try{
			entrada = fachada.getEntradaId(id);
			grupo = fachada.getGrupoEntrada(entrada.getIdGrupo());
			pregunta = fachada.consigueCuestionario(entrada.getId(), 0);
			opinion = fachada.consigueCuestionario(entrada.getId(), 1);
			haContestadoOpinion = fachada.haContestado(login, 0, entrada.getId());
			respOpinion = fachada.obtenerRespuestas(entrada.getId(), 0);
			haContestadoPregunta = fachada.haContestado(login,1, entrada.getId());
			respPregunta = fachada.obtenerRespuestas(entrada.getId(), 1);
		}catch(Exception e){
			
		}
	%>
  

<!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand" href="#" style="color:#000000;" onclick ="window.history.go(-1); return false;">Universidad de Zaragoza</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link" href="index.html" style="color:#000000;">Inicio</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="about.html" style="color:#000000;">Respuestas</a>
            </li>
            <!-- Header dinamico segun si usuario logeado -->
            <%
            if(login != null){
            	out.write("<li class=\"nav-item\">");
            	out.write("<a class=\"nav-link\" href=\"CerrarSesion\">Cerrar sesion</a>");
            	out.write("</li>");
            }else{
            	out.write("<li class=\"nav-item\">");
            	out.write("<a class=\"nav-link dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">Iniciar Sesion<span class=\"caret\"></span></a>");
            	out.write("<ul id=\"login-dp\" style=\"left: 70%;\" class=\"dropdown-menu\">");
            	out.write("<li>");
            	out.write("<div class=\"row\">");
            	out.write("<div class=\"col-md-10 offset-md-1\">");
            	out.write("<form class=\"form\" action =\"LoginServlet\" method=\"post\" role=\"form\" accept-charset=\"UTF-8\" id=\"login-nav\" novalidate>");
            	out.write("<div class=\"form-group\">");
            	out.write("<label class=\"sr-only\"  for=\"emailLogin\">Usuario/Email</label>");
            	out.write("<input type=\"email\" name =\"emailLogin\" class=\"form-control\" placeholder=\"Email\">");
            	out.write("</div>");
            	out.write("<div class=\"form-group\">");
            	out.write("<label class=\"sr-only\" for=\"passWordLogin\">Contraseña</label>");
            	out.write("<input type=\"password\" name =\"passWordLogin\" class=\"form-control\" placeholder=\"Contraseña\">");
            	out.write("<div class=\"help-block text-right\"><a href=\"\">Has olvidado la contraseña?</a></div>");
            	out.write("</div>");
            	out.write("<div class=\"form-group\">");
            	out.write("<input type=\"submit\" class=\"btn btn-primary btn-block\" value=\"submit\">Iniciar sesion");
            	out.write("</div>");
            	out.write("<div class=\"checkbox\">");
            	out.write("<label>");
            	out.write("<input type=\"checkbox\"> Mantener la sesión");
            	out.write("</label>");
            	out.write("</div>");
            	out.write("</form>");
            	out.write("</div>");
            	out.write("</div>");
            	out.write("</li>");
            	out.write("</ul>");
            	out.write("</li>");
            	out.write("<li class=\"nav-item\">");
            	out.write("<a class=\"nav-link\" href=\"RegistrarUsuario\">Registro</a>");
            	out.write("</li>");
            	
            }
             
            %>
            <!--  -->
			<li class="nav-item">
              <a class="nav-link" href="register.html" style="color:#000000;">Registro</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
	</br></br>

    <!-- Page Header -->
    <div class="container">
        <div class="row">
		  <div class="col-lg-8 col-md-10 mx-auto">
		  	<%
		  		if(entrada != null)
		  		out.write("<img class=\"img-thumbnail\" src=\""+ entrada.getUrlImagen() + "\">");
		  	%>
		  </div>
          <div class="col-lg-8 col-md-10 mx-auto">
            <div class="post-heading">
            </div>
          </div>
        </div>
    </div>

    <!-- Post Content -->
    <article>
      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-md-10 mx-auto">
          <%
          	if(entrada != null){
          		out.write("<h2>"+ entrada.getTitulo() +"</h2>");
          		out.write("<p>"+ entrada.getNoticia() +"</p>");
          	}
          %>
						
						
						
			<!-- Cuestionario -->
			<%
				out.write("<h2 class=\"section-heading\">Cuestionario sobre el medio ambiente</h2>");
				out.write("<p>"+ pregunta.getPregunta() +"</p>");
				if(haContestadoPregunta == false){ // No ha contestado
					for(RespuestaVO respuesta : respPregunta){
						out.write("<div class=\"radio\">");
						out.write("<label><input type=\"radio\" name=\"optradio\"> "+ respuesta.getCuerpo() +"</label>");
						out.write("</div>");
					}
					out.write("<input class=\"btn btn-success\" type=\"submit\" value=\"Enviar\">");
				}else{ // Si que ha contestado, no mostrar botones habilitados
					for(RespuestaVO respuesta : respPregunta){
						out.write("<div class=\"radio\">");
						out.write("<label><input type=\"radio\" name=\"optradio\" disabled> "+ respuesta.getCuerpo() +"</label>");
						out.write("</div>");
					}
					out.write("<br/>");
					out.write("<input class=\"btn btn-success\" type=\"submit\" value=\"Ya has contestado\" disabled>");
				}
			%>
            
            <!-- Opinion -->

			<%
			out.write("<h2 class=\"section-heading\">Danos tu opinión</h2>");
			out.write("<p>"+ pregunta.getPregunta() +"</p>");
			if(haContestadoOpinion == false){ // No ha contestado
				for(RespuestaVO respuesta : respOpinion){
					out.write("<div class=\"radio\">");
					out.write("<label><input type=\"radio\" name=\"optradio\"> "+ respuesta.getCuerpo() +"</label>");
					out.write("</div>");
				}
				out.write("<input class=\"btn btn-success\" type=\"submit\" value=\"Enviar\">");
			}else{ // Si que ha contestado, no mostrar botones habilitados
				for(RespuestaVO respuesta : respOpinion){
					out.write("<div class=\"radio\">");
					out.write("<label><input type=\"radio\" name=\"optradio\" disabled> "+ respuesta.getCuerpo() +"</label>");
					out.write("</div>");
				}
				out.write("<br/>");
				out.write("<input class=\"btn btn-success\" type=\"submit\" value=\"Ya has contestado\" disabled>");
			}
		%>	

			
			
			<!--  Reto -->
			<h2 class="section-heading">Vamos a por el reto</h2>
			<%
				out.write("<p>"+ entrada.getReto() +"</p>");
			%>
			
			<!-- Consejo -->
			<h2 class="section-heading">Consejo medioambiental!</h2>
			<%
				out.write("<p>"+ entrada.getConsejo() +"</p>");
			%>

			<h4 class="section-heading" style="font-size: 25px;">Si te ha gustado la noticia, comparte!</h4></br>
			<!-- Compartir -->

			<a target="_blank" id="facebook" alt="Compartir en Facebook" href="" rel="nofollow"><img src="https://static.tumblr.com/omgciym/nIWp60bqo/fb_boton.png" alt="Compartir en Facebook" width="89"/></a>

			<a target="_blank" id="twitter" alt="Twittear" href="" target="Blank_" rel="nofollow"><img src="https://static.tumblr.com/omgciym/3mip60br0/tw_boton.png" alt="Compartir en Twitter" width="89"/></a>
			  

            <p>Entrada escrita por
              <%
              	out.write("el grupo "+ grupo.getNombre());
              %>
            </p>
          </div>
        </div>
      </div>
    </article>

    <hr>

    <!-- Footer -->
    <footer>
      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-md-10 mx-auto">
            <ul class="list-inline text-center">
              <li class="list-inline-item">
                <a href="#">
                  <span class="fa-stack fa-lg">
                    <i class="fas fa-circle fa-stack-2x"></i>
                    <i class="fab fa-twitter fa-stack-1x fa-inverse"></i>
                  </span>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <span class="fa-stack fa-lg">
                    <i class="fas fa-circle fa-stack-2x"></i>
                    <i class="fab fa-facebook-f fa-stack-1x fa-inverse"></i>
                  </span>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <span class="fa-stack fa-lg">
                    <i class="fas fa-circle fa-stack-2x"></i>
                    <i class="fab fa-github fa-stack-1x fa-inverse"></i>
                  </span>
                </a>
              </li>
            </ul>
            <p class="copyright text-muted">Copyright &copy; MEDIOAMBIENTE</p>
          </div>
        </div>
      </div>
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="jquery/jquery.min.js"></script>
    <script src="bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Custom scripts for this template -->
    <script src="js/clean-blog.min.js"></script>
	
	<script>
		
		var face = document.getElementById("facebook");
		var twit = document.getElementById("twitter");
		
		face.href = "https://www.facebook.com/sharer/sharer.php?u="+window.location;
		twit.href = "https://twitter.com/intent/tweet?text=Me%20gust%C3%B3%20esta%20entrada:%20&url="+window.location;
	
	</script>

  </body>

</html>