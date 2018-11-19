<%@ page language="java" contentType="text/html; charset=utf-8"
%>
<!DOCTYPE html>
<html>
<head>
	<link rel="icon" href="img/icono.png" type="image/png" sizes="32x32">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Respuestas</title>

    <!-- Bootstrap core CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
	<!-- Estilos para esta pagina -->
    <link href="css/clean-blog.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
   <!-- <link href="css/all.min.css" rel="stylesheet" type="text/css"> --> 
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
   
    <link href="css/clean-blog.min.css" rel="stylesheet">
	
	<!--  IMPORTS de JAVA -->
	<%@ page import="datos.VO.UsuarioVO" %>
	<%@ page import="datos.VO.CuestionarioVO" %>
	<%@ page import="datos.VO.RespuestaVO" %>
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
    	
    	if(login == null){
    		login = "";
    	}
    	
		// Obtener top 5
		List<UsuarioVO> top5 = new ArrayList<UsuarioVO>();
		Facade fachada = new Facade();
		List<Integer> idsEntradas = new ArrayList<Integer>();
		
		try{
			top5 = fachada.getTopCinco();
			idsEntradas = fachada.consigueIdsEntradas();
			System.out.println(login);
		}catch(Exception e){
			
		}
	%>




<!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand" href="index.jsp" style="color:#000000;">EcoUnizar</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            
            <li class="nav-item">
              <a class="nav-link" href="respuestas.jsp" style="color:#000000;">Respuestas</a>
            </li>
            <!-- Header dinamico segun si usuario logeado -->
            <%
            if(!login.equals("")){
            	// Se obtiene el rol para mostrar la pagina personalizada
            	int tipo = fachada.consigueTipo(login);
            	if(tipo == 1){	// Profesor
            		out.write("<li class=\"nav-item\">");
                	out.write("<a class=\"nav-link\" href=\"#\" style=\"color:#000000;\">Gestionar Carteles</a>");
                	out.write("</li>");	
            	}else if(tipo == 2){	//alumno
            		out.write("<li class=\"nav-item\">");
                	out.write("<a class=\"nav-link\" href=\"#\" style=\"color:#000000;\">Subir Cartel</a>");
                	out.write("</li>");
            	}else{			// Admin
            		
            	}
            	out.write("<li class=\"nav-item\">");
            	out.write("<a class=\"nav-link\" href=\"CerrarSesion\" style=\"color:#000000;\">Cerrar sesion</a>");
            	out.write("</li>");
            }else{
            	out.write("<li class=\"nav-item\">");
            	out.write("<a class=\"nav-link dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\" style=\"color:#000000;\">Iniciar Sesion<span class=\"caret\"></span></a>");
            	out.write("<ul id=\"login-dp\" style=\"left: 70%;\" class=\"dropdown-menu\">");
            	out.write("<li>");
            	out.write("<div class=\"row\">");
            	out.write("<div class=\"col-md-10 offset-md-1\">");
            	out.write("<form class=\"form\" action =\"LoginServlet\" method=\"post\" role=\"form\" accept-charset=\"UTF-8\" id=\"login-nav\">");
            	out.write("<div class=\"form-group\">");
            	out.write("<label class=\"sr-only\"  for=\"emailLogin\">Usuario/Email</label>");
            	out.write("<input type=\"email\" name =\"emailLogin\" class=\"form-control\" placeholder=\"Email\" required> ");
            	out.write("</div>");
            	out.write("<div class=\"form-group\">");
            	out.write("<label class=\"sr-only\" for=\"passWordLogin\">Contraseña</label>");
            	out.write("<input type=\"password\" name =\"passWordLogin\" class=\"form-control\" placeholder=\"Contraseña\" required> ");
            	out.write("<div class=\"help-block text-right\"><a href=\"\">Has olvidado la contraseña?</a></div>");
            	out.write("</div>");
            	out.write("<div class=\"form-group\">");
            	out.write("<input type=\"submit\" class=\"btn btn-primary btn-block\" value=\"Iniciar Sesion\">");
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
            	out.write("<a class=\"nav-link\" href=\"RegistrarUsuario\" style=\"color:#000000;\">Registro</a>");
            	out.write("</li>");
            	
            }
             
            %>
          </ul>
        </div>
      </div>
    </nav>
	<br><br>

<div class="container">

        <div class="row">
            <div class="card card-register">
                <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="card-header text-center"><h3>Soluciones de los cuestionarios respondidos</h3></div>
                <% 
                	CuestionarioVO cuestionario = new CuestionarioVO();
                	for(Integer i : idsEntradas){
                		cuestionario = fachada.consigueCuestionario(i, 0);
                		List<RespuestaVO> respuestas = fachada.consigueRespuestas(i, 0);
                		if(cuestionario != null){
	                		out.write("<h2>" + cuestionario.getPregunta() +"</h2>");
	                		for(RespuestaVO respuesta : respuestas){
	                			out.write("<div>");
	                			if(respuesta.getPosicion() == cuestionario.getPosCorrecta() ){	// Respuesta correcta
	                				out.write("<i style=\"color: green\" class=\"fas fa-check\"></i><span>&nbsp;&nbsp;" + respuesta.getCuerpo() + "</span>");
	                			}else{
	                				out.write("<i style=\"color: red\" class=\"fas fa-times\"></i><span>&nbsp;&nbsp;&nbsp;" + respuesta.getCuerpo() + "</span>");
	                			}
	                			out.write("</div>");
	                		}
	                		out.write("<hr/>");
                		}
                	}
                %>
 

                </div>
            </div>
			<!-- RANKING -->
            <div class="col-lg-4 col-md-4 col-sm-4">
                <div class="card-header text-center"><h3>Ranking 5</h3></div>
                    <table class="table table-bordered table-sm m-0">
                        <thead class="">
                        <tr>
                            <th style=text-align:center;>Puesto</th>
                            <th style=text-align:center;>Usuario</th>
                            <th style=text-align:center;>Puntuación</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                        	int i = 1;
                        	for(UsuarioVO usuario : top5){
                        		out.write("<tr>");
                        		out.write("<td class=\"align-middle text-center\"><p>"+Integer.toString(i)+"º</p></td>");
                        		out.write("<td class=\"align-middle text-center\">" + usuario.getName() + "</td>");
                        		out.write("<td class=\"align-middle text-center\">" + usuario.getPuntuation() + " puntos</td>");
                        		out.write("</tr>");
                        		i = i + 1;
                        	}
                        %>
                        </tbody>
                    </table>
            </div>
        </div>
</div>


<!-- Bootstrap core JavaScript -->
<script src="jquery/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Custom scripts for this template -->
<script src="js/clean-blog.min.js"></script>


</body>
</html>