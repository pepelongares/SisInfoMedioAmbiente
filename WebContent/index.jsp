<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
	<title>MedioAmbiente</title>
	
	<!-- Stylesheet de Bootstrap -->
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Estilos para esta pagina -->
    <link href="css/clean-blog.min.css" rel="stylesheet">
	
	<!--  IMPORTS de JAVA -->
	<%@ page import="datos.VO.EntradaVO" %>
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
    	
		String off = request.getParameter("off"); //Offset
		int offset;
		if(off != null){
			offset = Integer.parseInt(off);
		}else{
			offset = 0;
		}
		List<EntradaVO> entradas = new ArrayList<EntradaVO>();
		Facade fachada = new Facade();
		try{
			entradas = fachada.getEntradasPrimeras(offset);
		}catch(Exception e){
			
		}
	%>
	
	<!--  BARRA DE NAVEGACION COMPARTIDA PARA TODAS LAS PAGINAS -->
	<!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand" href="index.jsp">Universidad de Zaragoza</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link" href="about.html">Respuestas</a>
            </li>
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
          </ul>
        </div>
      </div>
    </nav>
    
    <!--  Parte principal de la pagina web -->
    <header class="masthead" style="background-image: url('img/fondoPrincipal.jpg')">
      <div class="overlay"></div>
      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-md-10 mx-auto">
            <div class="site-heading">
              <h1>MEDIOAMBIENTE</h1>
              <span class="subheading">Problemáticas sobre el medioAmbiente</span>
            </div>
          </div>
        </div>
      </div>
    </header>
    
    <!--  Contenido principal -->

    <div class="container">
      <div class="row">
        <div class="col-lg-10 col-md-10 mx-auto">
		<!-- Entradas de post -->
		
		<%
			for(EntradaVO entrada : entradas){
				if(entrada != null){
					GrupoVO grupo = fachada.getGrupoEntrada(entrada.getIdGrupo());
					out.write("<div class=\"post-preview\">");
					out.write("<div class=\"row\">");
					out.write("<div class=\"col-lg-3\">");
					out.write("<a class=\"thumbnail\" href=\"CargarEntrada?id="+ entrada.getId() + "\">");
					out.write("<img class=\"img-thumbnail\" src="+entrada.getUrlImagen()+  " \">");
					out.write("</a>");
					out.write("</div>");
					out.write("<div class=\"col-lg-9\">");
					
					out.write("<a href=\"CargarEntrada?id="+ entrada.getId() + "\">");
					out.write("<h2 class=\"post-title\">");
					out.write(entrada.getTitulo());
					out.write("</h2>");
					out.write("</a>");
					out.write("<p class=\"post-meta\">Posteado por "+grupo.getNombre()+"</p>");
					out.write("</div>");
					out.write("</div>");
					out.write("</div>");
					out.write("<hr>");
					
				}
			}
		%>

		  
		  
          <!-- Final de las entradas -->
          <% 
          	if(entradas.size() > 5){
          		out.write("<div class=\"clearfix\">");
          		out.write("<a class=\"btn btn-success float-right\" href=\"#\" onclick=\"location.href=index.jsp?off="+ Integer.toString(offset*5) + ";\">Entradas antiguas &rarr;</a>");
          		out.write("</div>");
          	}
          %>
          
        </div>
      </div>
    </div>

    <hr>


	<!-- ZONA DE SCRIPTS -->
	
	<!-- Scripts para esta pagina -->
	<script src="jquery/jquery.min.js"></script>
	<script src="bootstrap/js/bootstrap.bundle.min.js"></script>
	
    <script src="js/clean-blog.min.js"></script>

</body>
</html>