<%@ page language="java" contentType="text/html; charset=utf-8; "
    pageEncoding="UTF-8"%>
    
    
<html lang="es">

  <head>

	<meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin Alumno</title>
    
    <!-- Fuentes  -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">

    <!-- Bootstrap core CSS-->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Page level plugin CSS-->
    <link href="bootstrap/datatables/dataTables.bootstrap4.css" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin.min.css" rel="stylesheet">

	<!--  IMPORTS de JAVA -->
	<%@ page import="datos.VO.EntradaVO" %>
	<%@ page import="datos.VO.GrupoVO" %>
	<%@ page import="datos.Facade" %>
	<%@ page import="java.util.List" %>
	<%@ page import="java.util.ArrayList" %>
	

  </head>

  <body id="page-top">
  
  <%
	//Cookie
	String email = null;
   	try {
   		Cookie[] cookies = request.getCookies(); 
   		 		
   		if (cookies != null) {
      		for (int i = 0; i < cookies.length; i++) {
	   			if (cookies[i].getName().equals("email")) {
	      			email = cookies[i].getValue();
	      			System.out.println("Login: "+email);
	    
	        	}
      		}
   		}
   	} catch (Exception e) {
     		e.printStackTrace(System.err);
     		
   	}
   	// FALTA TRATAR EXCEPCIONES DE FALTA DECOOKIES
  	List<EntradaVO> entradas = new ArrayList<EntradaVO>();
    GrupoVO grupoUsuario = new GrupoVO();
    Facade fachada = new Facade();
  	grupoUsuario = fachada.getGrupoUsuario(email);
  	entradas = fachada.getEntradasGrupo(grupoUsuario.getId());
  %>
    
    <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

      <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
        <i class="fas fa-bars"></i>
      </button>

    </nav>

    <div id="wrapper">

      <!-- Sidebar -->
        <ul class="sidebar navbar-nav" style="min-height: calc(100% - 40px);">
            <li class="nav-item">
                <a class="nav-link" href="index.jsp">
                    <i class="fas fa-arrow-left"></i>
                    <span>REGRESO AL INICIO</span>
                </a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>Administrar</span>
                </a>
                <div class="dropdown-menu" aria-labelledby="pagesDropdown">
                    <a class="dropdown-item" href="#" onclick="mostrarSubirNoticia()">Subir entrada</a>
                    <a class="dropdown-item" href="#" onclick="mostrarCartelesPropios()">Tus carteles</a>
                </div>
            </li>
        </ul>

      <div id="content-wrapper">

        <div class="container-fluid">

			<%
				String value = (String)request.getAttribute("sucess");
				if(value != null){
					if(value.equals("true")){
						out.write("<div class=\"alert alert-success alert-dismissible\">");
						out.write("<a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>");
		  				out.write("<strong>¡Conseguido!</strong> La entrada se ha registrado correctamente.");
		  				out.write("</div>");
					}else if(value.equals("false")){
						out.write("<div class=\"alert alert-danger alert-dismissible\">");
						out.write("<a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>");
		  				out.write("<strong>¡Error!</strong> No se ha podido registrar la noticia.");
		  				out.write("</div>");
					}	
				}
			%>
			
			
          <!-- Principal-->
          <div class="row" id="principal">
          
			<!-- Panel de Subir Cartel -->
				<div class="container" id="subirCartel" style="display:none;">
				<div class="card card-register mx-auto mt-5" style="width: 100%;">
				<div class="card-header"><h3>Crear nuevo cartel</h3></div>
				<div class="card-body">
				<form class="form" action="UploadFileServlet" method="post" role="form" accept-charset="UTF-8" id="entrada_id"  enctype="multipart/form-data">
						<div class="form-group">
							<div class="input-group input-file" name="Fichier1" >
    							<input type="text" class="form-control" placeholder='Selecciona una imagen...' required/>			
           							<span class="input-group-btn">
        								<button class="btn btn-default btn-choose" type="button">Seleccionar</button>
    								</span>
							</div>
						</div>
				<h5>Diseña tu noticia</h5>
					<div class="input-group">
						<input type="text" class="form-control" name="blog_title" id="blog_title" placeholder="Título de la noticia" required>
					</div>
					 <div class="form-group">
					    <textarea class="form-control" name="blog_body" id="blog_body" rows="5" placeholder="Cuerpo de la noticia" style="resize: none" required></textarea>
					 </div>
				<!-- FALTAN LOS CUESTIONARIOS -->
					<div class="form-group">
					    <textarea class="form-control" name="blog_advice" id="blog_advice" rows="3" placeholder="Consejo" style="resize: none" required></textarea>
					 </div>
					 <div class="form-group">
					    <textarea class="form-control" name="blog_challenge" id="blog_challenge" rows="3" placeholder="Reto" style="resize: none" required></textarea>
					 </div>
				<h5>Crea tus cuestionarios</h5>
				<!-- Primer cuestionario -->
				<div class="row align-items-center">
					<div class="input-group col-lg-12">
						<input type="text" class="form-control" name="cuestionario1" id="cuestionario1" placeholder="Pregunta del cuesionario" required>
					</div>
					<div class="col-lg-1 col-sm-1 mt-1">
						<label><input type="radio" name="optradio1" id="radio1.1" value="1" required></label>
					</div>
					<div class="col-lg-10 col-sm-10 mt-1">
						<input type="text" class="form-control" name="respuesta1.1" id="respuesta1.1" placeholder="Respuesta 1" required>
					</div>
					<div class="col-lg-1 col-sm-1 mt-1"></div>
					
					<div class="col-lg-1 col-sm-1 mt-1">
						<label><input type="radio" name="optradio1"  id="radio1.2" value="2"></label>
					</div>
					<div class="col-lg-10 col-sm-10 mt-1">
						<input type="text" class="form-control" name="respuesta1.2" id="respuesta1.2" placeholder="Respuesta 2" required>
					</div>
					<div class="col-lg-1 col-sm-1 mt-1"></div>
					
					<div class="col-lg-1 col-sm-1 mt-1">
						<label><input type="radio" name="optradio1"  id="radio1.3" value="3"></label>
					</div>
					<div class="col-lg-10 col-sm-10 mt-1">
						<input type="text" class="form-control" name="respuesta1.3" id="respuesta1.3" placeholder="Respuesta 3">
					</div>
					<div class="col-lg-1 col-sm-1 mt-1"></div>
					
					<div class="col-lg-1 col-sm-1 mt-1">
						<label><input type="radio" name="optradio1" id="radio1.4" value="4"></label>
					</div>
					<div class="col-lg-10 col-sm-10 mt-1">
						<input type="text" class="form-control" name="respuesta1.4" id="respuesta1.4" placeholder="Respuesta 4">
					</div>
					<div class="col-lg-1 col-sm-1 mt-1"></div>
					
					<div class="col-lg-1 col-sm-1 mt-1">
						<label><input type="radio" name="optradio1" id="radio1.5" value="5"></label>
					</div>
					<div class="col-lg-10 col-sm-10 mt-1">
						<input type="text" class="form-control" name="respuesta1.5" id="respuesta1.5" placeholder="Todas respuestas anteriores son correctas, algunas son correctas...">
					</div>
					<div class="col-lg-1 col-sm-1 mt-1"></div>
				</div>
				<br/>
				<!-- Segundo cuestionario -->
				<div class="row align-items-center">
					<div class="input-group col-lg-12">
						<input type="text" class="form-control" name="cuestionario2" id="cuestionario2" placeholder="Pregunta del cuesionario de opinión" required>
					</div>
					<div class="col-lg-1 col-sm-1 mt-1"></div>
					<div class="col-lg-10 col-sm-10 mt-1">
						<input type="text" class="form-control" name="respuesta2.1" id="respuesta2.1" placeholder="Respuesta 1" required>
					</div>
					<div class="col-lg-1 col-sm-1 mt-1"></div>
					
					<div class="col-lg-1 col-sm-1 mt-1"></div>
					<div class="col-lg-10 col-sm-10 mt-1">
						<input type="text" class="form-control" name="respuesta2.2" id="respuesta2.2" placeholder="Respuesta 2" required>
					</div>
					<div class="col-lg-1 col-sm-1 mt-1"></div>
					
					<div class="col-lg-1 col-sm-1 mt-1"></div>
					<div class="col-lg-10 col-sm-10 mt-1">
						<input type="text" class="form-control" name="respuesta2.3" id="respuesta2.3" placeholder="Respuesta 3">
					</div>
					<div class="col-lg-1 col-sm-1 mt-1"></div>
					
					<div class="col-lg-1 col-sm-1 mt-1"></div>
					<div class="col-lg-10 col-sm-10 mt-1">
						<input type="text" class="form-control" name="respuesta2.4" id="respuesta2.4" placeholder="Respuesta 4">
					</div>
					<div class="col-lg-1 col-sm-1 mt-1"></div>			
				</div>
				<br/>
				<div class="row justify-content-end" style="margin:10px">
					<div class="col-lg-1 col-sm-1">
						<%
							out.write("<input type=\"text\" class=\"form-control\" name=\"usuario\" style=\"display:none\" value=\""+email+"\">");
						%>						
					</div>
					<div class="col-lg-3 col-sm-3">
						<input class="btn btn-success" type="submit" value="Subir entrada">
					</div>
				</div>
				</form>
				</div>
			 </div>
			</div>
			<!-- FIN PANEL DE SUBIR CARTEL -->
			
			<!-- Panel de Ver lista -->
				<div class="container" id="verCarteles" style="display:none;">
				<div class="card card-register mx-auto mt-5" style="width: 200%;">
				<div class="card-header"><h3>Tus carteles</h3></div>
				<div class="card-body">
				<%
					if(entradas.isEmpty()){
						out.write("<h5>Aun no tienes carteles en el sistema</h5>");						
					}else{
						for(EntradaVO entrada : entradas){
							out.write("<div class=\"post-preview\">");
								out.write("<div class=\"row align-items-center\">");
									out.write("<div class=\"col-lg-3\">");
										out.write("<a class=\"thumbnail\" href=\"entrada.jsp?id="+entrada.getId()+"\">");
										out.write("<img class=\"img-thumbnail\" src=\""+entrada.getUrlImagen()+"\">");
										out.write("</a>");
									out.write("</div>");
									out.write("<div class=\"col-lg-6\">");
										out.write("<a href=\"entrada.jsp?id="+entrada.getId()+"\">");
										out.write("<h3 class=\"post-title\">");
										out.write(entrada.getTitulo());
										out.write("</h3>");
										out.write("</a>");
									out.write("</div>");	
									out.write("<div class=\"col-lg-2\">");
									switch(entrada.getEstado()){
										case 1: out.write("<button type=\"button\" class=\"btn btn-success\" disabled>Aceptado</button>"); break;
										case 2: out.write("<button type=\"button\" class=\"btn btn-danger\" disabled>Rechazado</button>"); break;
										default: out.write("<button type=\"button\" class=\"btn btn-secondary\" disabled>En revisión</button>"); break;
									}
									out.write("</div>");
								out.write("</div>");
							out.write("</div>");
							out.write("<hr/>");						
						}
						out.write("</div>");
						out.write("</div>");
						out.write("</div>");
						out.write("</div>");
					}
				%>
				
			</div>
			<!-- FIN PANEL DE SUBIR CARTEL -->
			
			
          </div>
		  </div>  
	          
      </div>
      <!-- /.content-wrapper -->
	</div>
    </div>
    <!-- /#wrapper -->
    </div>

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fas fa-angle-up"></i>
    </a>
 
    <!-- Bootstrap core JavaScript-->
    <script src="jquery/jquery.min.js"></script>
    <script src="bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="jquery/jquery.easing.min.js"></script>

    <!-- Page level plugin JavaScript-->
    <script src="js/Chart.min.js"></script>
    <script src="bootstrap/datatables/jquery.dataTables.js"></script>
    <script src="bootstrap/datatables/dataTables.bootstrap4.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin.min.js"></script>

    <!-- Demo scripts for this page-->
    <script src="js/datatables-demo.js"></script>
    <script src="js/chart-area-demo.js"></script>
	
	<script>
	
	function bs_input_file() {
		$(".input-file").before(
			function() {
				if ( ! $(this).prev().hasClass('input-ghost') ) {
					var element = $("<input type='file' class='input-ghost' style='visibility:hidden accept=\"image/*\"; height:0'>");
					element.attr("name",$(this).attr("name"));
					element.attr("accept","image/*");
					element.change(function(){
						element.next(element).find('input').val((element.val()).split('\\').pop());
					});
					$(this).find("button.btn-choose").click(function(){
						element.click();
					});
					$(this).find("button.btn-reset").click(function(){
						element.val(null);
						$(this).parents(".input-file").find('input').val('');
					});
					$(this).find('input').css("cursor","pointer");
					$(this).find('input').mousedown(function() {
						$(this).parents('.input-file').prev().click();
						return false;
					});
					return element;
				}
			}
		);
	}
	$(function() {
		bs_input_file();
	});
	
	
		function mostrarSubirNoticia(){
		    console.log("holi");
			document.getElementById("subirCartel").style.display = "block";
			document.getElementById("verCarteles").style.display = "none";
		}

		function mostrarCartelesPropios(){
			document.getElementById("verCarteles").style.display = "block";
			document.getElementById("subirCartel").style.display = "none";
		}
		
		function actualizarInput(){
			console.log("Holi");
			document.getElementById("labelInput").innerText = document.getElementById("customFile").files[0].name;
			
		}
	</script>

  </body>

</html>