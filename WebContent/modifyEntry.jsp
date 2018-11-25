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
	<%@ page import="datos.VO.CuestionarioVO" %>
	<%@ page import="datos.VO.GrupoVO" %>
	<%@ page import="datos.VO.RespuestaVO" %>
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
                <a class="nav-link" href="alumnoAdmin.jsp">
                    <i class="fas fa-arrow-left"></i>
                    <span>Regresar al panel</span>
                </a>
            </li>
        </ul>

      <div id="content-wrapper">

        <div class="container-fluid">
        
        <%
        
        EntradaVO entrada = (EntradaVO) request.getAttribute("entry");
        CuestionarioVO c1 = entrada.getPreguntas();
        CuestionarioVO c2 = entrada.getOpinion();
        String p1 = c1.getPregunta();
        String p2 = c2.getPregunta();
        List<RespuestaVO> r1 = c1.getRespuestas();
        List<RespuestaVO> r2 = c2.getRespuestas();
        int pos = c1.getPosCorrecta();
        %>
		
          <!-- Principal-->
          <div class="row" id="principal">
          
			<!-- Panel de Subir Cartel -->
				<div class="container" id="subirCartel">
				<div class="card card-register mx-auto mt-5" style="width: 100%;">
				<div class="card-header"><h3>Modifica tu cartel</h3></div>
				<div class="card-body">
				<form class="form" action="UpdateEntryServlet" method="post" role="form" accept-charset="UTF-8" id="entrada_id"  enctype="multipart/form-data" >
						<div class="form-group">
							<div class="input-group input-file" name="Fichier1" >
    							<input type="text" class="form-control" placeholder='Selecciona una imagen...' required/>			
           							<span class="input-group-btn">
        								<button class="btn btn-default btn-choose" type="button">Seleccionar</button>
    								</span>
							</div>
						</div>
				<h5>Cuerpo de tu noticia</h5>
					<div class="input-group">
					<%
						out.write("<input type=\"text\" class=\"form-control\" name=\"blog_title\" id=\"blog_title\" value=\""+entrada.getTitulo()+"\"required>");
					%>
						
					</div>
					 <div class="form-group">
				 	<%
				 		out.write("<textarea class=\"form-control\" name=\"blog_body\" id=\"blog_body\" rows=\"5\" style=\"resize: none\" required>"+entrada.getNoticia()+"</textarea>");
				 	%>
					 </div>
					<div class="form-group">
					<%
						out.write("<textarea class=\"form-control\" name=\"blog_advice\" id=\"blog_advice\" rows=\"3\" style=\"resize: none\" required>"+entrada.getConsejo()+"</textarea>");
					%>
					</div>
					 <div class="form-group">
					 <%
					 	out.write("<textarea class=\"form-control\" name=\"blog_challenge\" id=\"blog_challenge\" rows=\"3\" style=\"resize: none\" required>"+entrada.getReto()+"</textarea>"); 
					 %> 
					    </div>
				<h5>Cuestionarios</h5>
				<!-- Primer cuestionario -->
				<div class="row align-items-center">
					<div class="input-group col-lg-12">
					<%
						out.write("<input type=\"text\" class=\"form-control\" name=\"cuestionario1\" id=\"cuestionario1\" value=\""+p1+"\" required>");
					%>	
					</div>
					<div class="col-lg-1 col-sm-1 mt-1">
					<%
						if(pos == 1){
							out.write("<label><input type=\"radio\" name=\"optradio1\" id=\"radio1.1\" value=\"1\" required checked></label>");
						}else{
							out.write("<label><input type=\"radio\" name=\"optradio1\" id=\"radio1.1\" value=\"1\" required checked></label>");
						}
					%>	
					</div>
					<div class="col-lg-10 col-sm-10 mt-1">
					<%
						out.write("<input type=\"text\" class=\"form-control\" name=\"respuesta1.1\" id=\"respuesta1.1\" value=\""+r1.get(0).getCuerpo()+"\"required>");
					%>
						
					</div>
					<div class="col-lg-1 col-sm-1 mt-1"></div>
					
					<div class="col-lg-1 col-sm-1 mt-1">
					<%
						if(pos == 2){
							out.write("<label><input type=\"radio\" name=\"optradio1\" id=\"radio1.2\" value=\"2\" required checked></label>");
						}else{
							out.write("<label><input type=\"radio\" name=\"optradio1\" id=\"radio1.2\" value=\"2\" required></label>");
						}
					%>
					</div>
					<div class="col-lg-10 col-sm-10 mt-1">
					<%
						out.write("<input type=\"text\" class=\"form-control\" name=\"respuesta1.2\" id=\"respuesta1.2\" value=\""+r1.get(1).getCuerpo()+"\"required>");
					%>
					</div>
					<div class="col-lg-1 col-sm-1 mt-1"></div>
					
					<div class="col-lg-1 col-sm-1 mt-1">
					<%
						if(pos == 3){
							out.write("<label><input type=\"radio\" name=\"optradio1\" id=\"radio1.3\" value=\"3\" required checked></label>");
						}else{
							out.write("<label><input type=\"radio\" name=\"optradio1\" id=\"radio1.3\" value=\"3\" required></label>");
						}
					%>
					</div>
					<div class="col-lg-10 col-sm-10 mt-1">
					<%
						if(r1.size() > 2){
							out.write("<input type=\"text\" class=\"form-control\" name=\"respuesta1.3\" id=\"respuesta1.3\" value=\""+r1.get(2).getCuerpo()+"\"required>");
						}else{
							out.write("<input type=\"text\" class=\"form-control\" name=\"respuesta1.3\" id=\"respuesta1.3\" placeholder=\"Respuesta 3\">");
						}
						
					%>
					</div>
					<div class="col-lg-1 col-sm-1 mt-1"></div>
					
					<div class="col-lg-1 col-sm-1 mt-1">
					<%
						if(pos == 4){
							out.write("<label><input type=\"radio\" name=\"optradio1\" id=\"radio1.4\" value=\"4\" required checked></label>");
						}else{
							out.write("<label><input type=\"radio\" name=\"optradio1\" id=\"radio1.4\" value=\"4\" required></label>");
						}
					%>
					</div>
					<div class="col-lg-10 col-sm-10 mt-1">
					<%
						if(r1.size() > 3){
							out.write("<input type=\"text\" class=\"form-control\" name=\"respuesta1.4\" id=\"respuesta1.4\" value=\""+r1.get(3).getCuerpo()+"\"required>");
						}else{
							out.write("<input type=\"text\" class=\"form-control\" name=\"respuesta1.4\" id=\"respuesta1.4\" placeholder=\"Respuesta 4\">");
						}
						
					%>
					</div>
					<div class="col-lg-1 col-sm-1 mt-1"></div>
					
					<div class="col-lg-1 col-sm-1 mt-1">
					<%
						if(pos == 5){
							out.write("<label><input type=\"radio\" name=\"optradio1\" id=\"radio1.5\" value=\"5\" required checked></label>");
						}else{
							out.write("<label><input type=\"radio\" name=\"optradio1\" id=\"radio1.5\" value=\"5\" required></label>");
						}
					%>
					</div>
					<div class="col-lg-10 col-sm-10 mt-1">
					<%
						if(r1.size() > 4){
							out.write("<input type=\"text\" class=\"form-control\" name=\"respuesta1.5\" id=\"respuesta1.5\" value=\""+r1.get(4).getCuerpo()+"\"required>");
						}else{
							out.write("<input type=\"text\" class=\"form-control\" name=\"respuesta1.5\" id=\"respuesta1.5\" placeholder=\"Todas respuestas anteriores son correctas, algunas son correctas...\">");
						}
						
					%>
					</div>
					<div class="col-lg-1 col-sm-1 mt-1"></div>
				</div>
				<br/>
				<!-- Segundo cuestionario -->
				<div class="row align-items-center">
					<div class="input-group col-lg-12">
					<%
						out.write("<input type=\"text\" class=\"form-control\" name=\"cuestionario2\" id=\"cuestionario2\" value=\""+p2+"\" required>");
					%>	
					</div>
					<div class="col-lg-1 col-sm-1 mt-1"></div>
					<div class="col-lg-10 col-sm-10 mt-1">
					<%
						out.write("<input type=\"text\" class=\"form-control\" name=\"respuesta2.1\" id=\"respuesta2.1\" value=\""+r2.get(0).getCuerpo()+"\"required>");
					%>
					</div>
					<div class="col-lg-1 col-sm-1 mt-1"></div>
					
					<div class="col-lg-1 col-sm-1 mt-1"></div>
					<div class="col-lg-10 col-sm-10 mt-1">
					<%
						out.write("<input type=\"text\" class=\"form-control\" name=\"respuesta2.2\" id=\"respuesta2.2\" value=\""+r2.get(1).getCuerpo()+"\"required>");
					%>
					</div>
					<div class="col-lg-1 col-sm-1 mt-1"></div>
					
					<div class="col-lg-1 col-sm-1 mt-1"></div>
					<div class="col-lg-10 col-sm-10 mt-1">
					<%
						if(r2.size() > 2){
							out.write("<input type=\"text\" class=\"form-control\" name=\"respuesta2.3\" id=\"respuesta2.3\" value=\""+r2.get(2).getCuerpo()+"\"required>");
						}else{
							out.write("<input type=\"text\" class=\"form-control\" name=\"respuesta2.3\" id=\"respuesta2.3\" placeholder=\"Respuesta 3\">");
						}
						
					%>
					</div>
					<div class="col-lg-1 col-sm-1 mt-1"></div>
					
					<div class="col-lg-1 col-sm-1 mt-1"></div>
					<div class="col-lg-10 col-sm-10 mt-1">
					<%
						if(r1.size() > 3){
							out.write("<input type=\"text\" class=\"form-control\" name=\"respuesta2.4\" id=\"respuesta2.4\" value=\""+r2.get(3).getCuerpo()+"\"required>");
						}else{
							out.write("<input type=\"text\" class=\"form-control\" name=\"respuesta2.4\" id=\"respuesta2.4\" placeholder=\"Respuesta 4\">");
						}
						
					%>
					</div>
					<div class="col-lg-1 col-sm-1 mt-1"></div>			
				</div>
				<br/>
				<div class="row justify-content-end" style="margin:10px">
					<div class="col-lg-1 col-sm-1">
						<%
							out.write("<input type=\"text\" class=\"form-control\" name=\"idEntrada\" style=\"display:none\" value=\""+entrada.getId()+"\">");
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
			
			
				
			</div>
			<!-- FIN PANEL DE SUBIR CARTEL -->
			
			
          </div>
		  </div>  
	          
      </div>
      <!-- /.content-wrapper -->


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