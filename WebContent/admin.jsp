<%@ page language="java" contentType="text/html; charset=utf-8"
%>
<!DOCTYPE html>

<html>
<head>

	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- Bootstrap core CSS-->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Fuentes  -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    
    

    <!-- Page level plugin CSS-->
    <link href="bootstrap/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin.min.css" rel="stylesheet">

	<title>Página del ADMIN</title>
	
	<%@ page import="datos.VO.UsuarioVO" %>
	<%@ page import="datos.VO.GrupoVO" %>
	<%@ page import="datos.Facade" %>
	<%@ page import="java.util.List" %>
	<%@ page import="java.util.ArrayList" %>
	
</head>

<body id="page-top">
<%
//Caches
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
 	
 	Facade fachada = new Facade();
 	
 	// Usuario no permitido
 	if(login == null){
 		System.out.println("USUARIO EXTERNO NO LOGEADO");
 		out.write("<script>");
 		out.write("window.location = \"index.jsp\";");
 		out.write("</script>");
 	}else if(fachada.consigueTipo(login) != 0){
 		System.out.println("USUARIO SIN PERMISOS");
 		out.write("<script>");
 		out.write("window.location = \"index.jsp\";");
 		out.write("</script>");	
 	}

	
%>

	<nav class="navbar navbar-expand navbar-dark bg-dark static-top">
	
	  <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
        <i class="fas fa-bars"></i>
      </button>

    </nav>
    
    <div id="wrapper">

      <!-- Sidebar -->
      <ul class="sidebar navbar-nav">
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
          	<a class="dropdown-item" href="#" onclick="mostrarAyuda()">Ayuda</a>
            <a class="dropdown-item" href="#" onclick="mostrarGrupo()">Administrar grupos</a>
            <a class="dropdown-item" href="#" onclick="mostrarAlta()">Dar de Alta</a>
            <a class="dropdown-item" href="#" onclick="mostrarBaja()">Dar de Baja</a>
          </div>
        </li>
      </ul>

      <div id="content-wrapper">

        <div class="container-fluid">
        
        <%
				String value = (String) request.getParameter("res");
    			String value2 = (String) request.getAttribute("res");
				if(value != null){
					if(value.equals("1")){
						out.write("<div class=\"alert alert-success alert-dismissible\">");
						out.write("<a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>");
		  				out.write("<strong>¡Hecho!</strong>");
		  				out.write("</div>");
					}else if(value.equals("0")){
						out.write("<div class=\"alert alert-danger alert-dismissible\">");
						out.write("<a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>");
		  				out.write("<strong>¡Error!</strong>");
		  				out.write("</div>");
					}	
				}
			%>

          <!-- Principal-->
          <div class="row" id="principal">
          
          <!-- Panel de Ayuda -->
          <div class="container" id="principal3" style="display:block;">
				<div class="card card-register mx-auto mt-5">
				<div class="card-header">Ayuda</div>
				<div class="card-body">
					<div class="form-group">
						  <div class="form-label-group">
							<h2 align="center">Bienvenido al panel de administrador</h2>
							<h6>Desde el panel izquierdo se pueden realizar todas las acciones de administración</h6>
							<hr>
							<ul>
							<li>Ayuda: Muestra este panel</li>
							<li>Administrar grupos: Permite crear nuevos grupos y eliminar los existentes</li>
							<li>Dar de Alta: Permite añadir nuevos usuarios al sistema</li>
							<li>Dar de Baja: Permite eliminar usuarios del sistema, o ver los existentes</li>
							</ul>
						  </div>
					</div>
				</div>
			  </div>
			  <br/>
			  
			  
			</div>
			
          
          <!-- Panel de crear grupo -->
          <div class="container" id="principal0" style="display:none;">
				<div class="card card-register mx-auto mt-5">
				<div class="card-header">Crear grupo</div>
				<div class="card-body">
				  <form class="form" action ="CrearGrupo" method="post" role="form" accept-charset="UTF-8">
					<div class="form-group">
						  <div class="form-label-group">
							<input type="text" name="name" id="name1" class="form-control" placeholder="Nombre completo" required="required" autofocus="autofocus">
							<label for="name1">Nombre del Grupo</label>
						  </div>
					</div>

					<input type="submit" class="btn btn-success btn-block" value="Añadir Grupo">
				  </form>
				</div>
			  </div>
			  <br/>
			  <div class="card card-register mx-auto mt-5">
				<div class="card-header">Grupos ya creados</div>
			  <div class="card-body">
					<div class="form-group">
						 <table class="table table-bordered table-sm m-0">
                        <thead class="">
                        <tr>
                            <th style=text-align:center;>ID</th>
                            <th style=text-align:center;>Nombre</th>
                            <th style=text-align:center;>Eliminar</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                        
                        List<GrupoVO> grupos = fachada.obtenerGrupos();
                        for(GrupoVO grupo : grupos){
                        	out.write("<form action=\"EliminarGrupo\" method=\"get\">");
                        	out.write("<tr>");
                        	out.write("<td class=\"align-middle text-center\">" + "<input type=\"text\" name=\"id\" value=\"" + grupo.getId() + "\" readonly>"+"</td>");
                    		out.write("<td class=\"align-middle text-center\">" + grupo.getNombre() + "</td>");
                    		out.write("<td class=\"align-middle text-center\">" + "<input type=\"submit\" value=\"Eliminar\" class=\"btn btn-danger btn-block\"></td>");
                    		out.write("</tr>");	
                    		out.write("</form>");
                        }
                        
                        
                        %>
                        </tbody>
                        </table>
					</div>

				</div>
				</div>
			  
			</div>
		  
		  
		  <!-- Panel de registrar -->
				<div class="container" id="principal1" style="display:none;">
				<div class="card card-register mx-auto mt-5">
				<div class="card-header">Añadir usuario</div>
				<div class="card-body">
				  <form class="form" action ="RegistrarUsuario" method="post" role="form" accept-charset="UTF-8">
					<div class="form-group">
						  <div class="form-label-group">
							<input type="text" name="name" id="name2" class="form-control" placeholder="Nombre completo" required="required" autofocus="autofocus">
							<label for="name2">Nombre</label>
						  </div>
					</div>
					<div class="form-group">
					  <div class="form-label-group">
						<input type="email" name="email" id="inputEmail2" class="form-control" placeholder="Email address" required="required">
						<label for="inputEmail2">Email</label>
					  </div>
					</div>
					<div class="form-group">
					  <div class="form-label-group">
						<input type="number" name="edad" id="edad2" class="form-control" placeholder="Año Nacimiento" required="required">
						<label for="edad2">Año Nacimiento</label>
					  </div>
					</div>
					<div class="form-group">
					  <div class="form-label-group">
						<input type="number" name="grupo" id="grupo2" class="form-control" placeholder="Grupo asignar" required="required">
						<label for="grupo2">Grupo Asignado</label>
					  </div>
					</div>
					<div class="form-group">
					  <div class="form-label-group">
						<input type="number" name="rol" id="rol2" class="form-control" placeholder="Rol asignar" required="required">
						<label for="rol2">Rol asignado (0:Admin, 1:Profesor, 2:Alumno)</label>
					  </div>
					</div>
					<div class="form-group">
					  <div class="form-row">
						<div class="col-md-6">
						  <div class="form-label-group">
							<input type="password" name="inputPassword" id="inputPassword2" class="form-control" placeholder="Password" required="required">
							<label for="inputPassword2">Contraseña</label>
						  </div>
						</div>
						<div class="col-md-6">
						  <div class="form-label-group">
							<input type="password" id="confirmPassword2" class="form-control" placeholder="Confirm password" required="required">
							<label for="confirmPassword2">Repita Contraseña</label>
						  </div>
						</div>
					  </div>
					</div>
					<input type="submit" class="btn btn-success btn-block" value="Registrar">
				  </form>
				</div>
			  </div>
			</div>
			<!-- FIN PANEL DE AÑADIR USUARIO -->
			<div class="container" id="principal2" style="display:none;">
				<div class="card card-register mx-auto mt-5">
				<div class="card-header">Eliminar Usuarios</div>
				<div class="card-body">
					<table class="table table-bordered table-sm m-0">
                        <thead class="">
                        <tr>
                            <th style=text-align:center;>Nombre</th>
                            <th style=text-align:center;>Correo</th>
                            <th style=text-align:center;>Eliminar</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                        	List<UsuarioVO> usuarios = fachada.obtenerUsuarios();
                        	for(UsuarioVO usuario : usuarios){
                        		if(usuario.getRol() != 0){
	                        		out.write("<form action=\"EliminarUsuario\" method=\"get\">");
	                        		out.write("<tr>");
	                        		out.write("<td class=\"align-middle text-center\">" + usuario.getName() + "</td>");
	                        		out.write("<td class=\"align-middle text-center\">" + "<input type=\"email\" name=\"email\" value=\"" + usuario.getEmail() + "\" readonly>"+"</td>");
	                        		out.write("<td class=\"align-middle text-center\">" + "<input type=\"submit\" value=\"Eliminar\" class=\"btn btn-danger btn-block\"></td>");
	                        		out.write("</tr>");
	                        		out.write("</form>");
                        		}
                        	}
                        
                        
                        %>
                        </tbody>
                        </table>
					
					
				</div>
			  </div>
			</div>
			<!-- Panel de eliminar usuario -->
			

			<!-- FIN PANEL DE ELIMINAR USUARIO -->
			
			
			
          </div>
          
        <!-- Sticky Footer -->
        <footer class="sticky-footer">
          <div class="container my-auto">
            <div class="copyright text-center my-auto">
              <span>Copyright ©</span>
            </div>
          </div>
        </footer>

      </div>
      <!-- /.content-wrapper -->

    </div>
    </div>


<!-- Bootstrap core JavaScript-->
    <script src="jquery/jquery.min.js"></script>
    <script src="bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="jquery/jquery.easing.min.js"></script>

    <!-- Page level plugin JavaScript-->
    <script src="js/Chart.min.js"></script>
    <script src="bootstrap/datatables/jquery.dataTables.min.js"></script>
    <script src="bootstrap/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin.min.js"></script>

    <!-- Demo scripts for this page-->
    <script src="js/datatables-demo.js"></script>
    <script src="js/chart-area-demo.js"></script>
    
    <script>
	
    	function mostrarGrupo(){
    		document.getElementById("principal0").style.display = "block";
			document.getElementById("principal1").style.display = "none";
			document.getElementById("principal2").style.display = "none";
			document.getElementById("principal3").style.display = "none";
    	}
		function mostrarAlta(){
			document.getElementById("principal0").style.display = "none";
			document.getElementById("principal1").style.display = "block";
			document.getElementById("principal2").style.display = "none";
			document.getElementById("principal3").style.display = "none";
		}
		
		function mostrarBaja(){
			document.getElementById("principal0").style.display = "none";
			document.getElementById("principal1").style.display = "none";
			document.getElementById("principal2").style.display = "block";
			document.getElementById("principal3").style.display = "none";
		}
		
		function mostrarAyuda(){
			document.getElementById("principal0").style.display = "none";
			document.getElementById("principal1").style.display = "none";
			document.getElementById("principal2").style.display = "none";
			document.getElementById("principal3").style.display = "block";
		}
		

	</script>

</body>
</html>