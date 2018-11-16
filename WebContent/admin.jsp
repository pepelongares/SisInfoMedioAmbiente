<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
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
	<%@ page import="datos.Facade" %>
	
</head>

<body id="page-top">

	<nav class="navbar navbar-expand navbar-dark bg-dark static-top">
	
	  <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
        <i class="fas fa-bars"></i>
      </button>

    </nav>
    
    <div id="wrapper">

      <!-- Sidebar -->
      <ul class="sidebar navbar-nav">
		  <li class="nav-item">
			  <a class="nav-link" href="index.html">
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
            <a class="dropdown-item" href="#" onclick="mostrarAlta()">Dar de Alta</a>
            <a class="dropdown-item" href="#" onclick="mostrarBaja()">Dar de Baja</a>
            <a class="dropdown-item" href="#" onclick="mostrarModificar()">Modificar datos</a>
          </div>
        </li>
      </ul>

      <div id="content-wrapper">

        <div class="container-fluid">

          <!-- Principal-->
          <div class="row" id="principal">
		  
		  
		  <!-- Panel de registrar -->
				<div class="container" id="principal1" style="display:none;">
				<div class="card card-register mx-auto mt-5">
				<div class="card-header">Añadir usuario</div>
				<div class="card-body">
				  <form class="form" action ="RegistrarUsuario" method="post" role="form" accept-charset="UTF-8">
					<div class="form-group">
						  <div class="form-label-group">
							<input type="text" name="name" id="name1" class="form-control" placeholder="Nombre completo" required="required" autofocus="autofocus">
							<label for="name1">Nombre</label>
						  </div>
					</div>
					<div class="form-group">
					  <div class="form-label-group">
						<input type="email" name="email" id="inputEmail" class="form-control" placeholder="Email address" required="required">
						<label for="inputEmail">Email</label>
					  </div>
					</div>
					<div class="form-group">
					  <div class="form-label-group">
						<input type="number" name="edad" id="edad" class="form-control" placeholder="Año Nacimiento" required="required">
						<label for="edad">Año Nacimiento</label>
					  </div>
					</div>
					<div class="form-group">
					  <div class="form-label-group">
						<input type="number" name="grupo" id="grupo" class="form-control" placeholder="Grupo asignar" required="required">
						<label for="grupo">Grupo Asignado</label>
					  </div>
					</div>
					<div class="form-group">
					  <div class="form-label-group">
						<input type="number" name="rol" id="rol" class="form-control" placeholder="Rol asignar" required="required">
						<label for="rol">Rol asignado (0:Admin, 1:Profesor, 2:Alumno)</label>
					  </div>
					</div>
					<div class="form-group">
					  <div class="form-row">
						<div class="col-md-6">
						  <div class="form-label-group">
							<input type="password" name="pass" id="inputPassword" class="form-control" placeholder="Password" required="required">
							<label for="inputPassword">Contraseña</label>
						  </div>
						</div>
						<div class="col-md-6">
						  <div class="form-label-group">
							<input type="password" id="confirmPassword" class="form-control" placeholder="Confirm password" required="required">
							<label for="confirmPassword">Repita Contraseña</label>
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
			
			<!-- Panel de eliminar usuario -->
				<div class="container" id="principal2" style="display:none;">
				<div class="card card-register mx-auto mt-5">
				<div class="card-header">Eliminar usuario</div>
				<div class="card-body">
				  <form class="form" action ="EliminarUsuario" method="post" role="form" accept-charset="UTF-8">
					<div class="form-group">
					  <div class="form-label-group">
						<input type="email" name = "email2" id="inputEmail2" class="form-control" placeholder="Email address" required="required" autofocus="autofocus">
						<label for="inputEmail2">Email</label>
					  </div>
					</div>
					<div class="form-group">
						  <div class="form-label-group">
							<input type="text" id="inputText" class="form-control" placeholder="Borrar" required="required">
							<label for="inputText">Escriba BORRAR si desea borrar al usuario</label>
						  </div>
					</div>
					<input type="submit" class="btn btn-success btn-block" value="Eliminar Usuario">
				  </form>
				</div>
			  </div>
			</div>
			<!-- FIN PANEL DE ELIMINAR USUARIO -->
			
			<!-- Panel de modificar Usuario -->
				<div class="container" id="principal3" style="display:none;">
				<div class="card card-register mx-auto mt-5">
				<div class="card-header">Modificar Usuario</div>
				<div class="card-body">
				  <form>
					<div class="form-group">
					  <div class="form-label-group">
						<input type="email" name="email3" id="inputEmail3" class="form-control" placeholder="Email address" required="required" autofocus="autofocus">
						<label for="inputEmail3">Email</label>
					  </div>
					</div>
					<a class="btn btn-success btn-block" href="#" onclick="solicitarDatos()">Solicitar Datos</a></br>
					<div class="form-group">
						  <div class="form-label-group">
							<input type="text" id="name2" class="form-control" placeholder="Nombre Completo" required="required" >
							<label for="name2">Nombre</label>
						  </div>
					</div>
					<div class="form-group">
						  <div class="form-label-group">
							<input type="number" id="edad2" class="form-control" placeholder="Año Nacimiento" required="required" >
							<label for="edad2">Año Nacimiento</label>
						  </div>
					</div>
					<div class="form-group">
					  <div class="form-row">
						<div class="col-md-6">
						  <div class="form-label-group">
							<input type="password" id="inputPassword2" class="form-control" placeholder="Password" required="required">
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
					
					<a class="btn btn-success btn-block" href="#">MODIFICAR</a>
				  </form>
				</div>
			  </div>
			</div>
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
	
		function mostrarAlta(){
			console.log("Dar de Alta");
			document.getElementById("principal1").style.display = "block";
			document.getElementById("principal2").style.display = "none";
			document.getElementById("principal3").style.display = "none";
		}
		
		function mostrarBaja(){
			document.getElementById("principal1").style.display = "none";
			document.getElementById("principal2").style.display = "block";
			document.getElementById("principal3").style.display = "none";
		}
		
		function mostrarModificar(){
			document.getElementById("principal1").style.display = "none";
			document.getElementById("principal2").style.display = "none";
			document.getElementById("principal3").style.display = "block";
		}
 
		function solicitarDatos(){
			<%
				Facade fachada = new Facade();
				String email = request.getParameter("email3");
				
				UsuarioVO usuarioBuscado = null;
				if(email != null){
					usuarioBuscado = new UsuarioVO();
					usuarioBuscado = fachada.obtenerUsuario(email);
					usuarioBuscado.getYear();
				}else{
					usuarioBuscado = new UsuarioVO("", "", 0, "", 0, 0, 0);
				}
			%>
			 var name ="<%=usuarioBuscado.getName()%>";
			 var anyo ="<%=usuarioBuscado.getYear()%>"; 
			 document.getElementById("name2").value = name;
			 document.getElementById("edad2").value = anyo;
		}
	
	</script>


</body>
</html>