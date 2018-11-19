<%@ page language="java" contentType="text/html; charset=utf-8"
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <!-- This file has been downloaded from Bootsnipp.com. Enjoy! -->
    <title>Pagina de Registro</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        /*
/* Created by Filipe Pina
 * Specific styles of signin, register, component
 */
/*
 * General styles
 */

body, html{
     height: 100%;
 	background-repeat: no-repeat;
 	background-color: #d3d3d3;
 	font-family: 'Oxygen', sans-serif;
}

.main{
 	margin-top: 70px;
}

h1.title { 
	font-size: 50px;
	font-family: 'Passion One', cursive; 
	font-weight: 400; 
}

hr{
	width: 10%;
	color: #fff;
}

.form-group{
	margin-bottom: 15px;
}

label{
	margin-bottom: 15px;
}

input,
input::-webkit-input-placeholder {
    font-size: 11px;
    padding-top: 3px;
}

.main-login{
 	background-color: #fff;
    /* shadows and rounded borders */
    -moz-border-radius: 2px;
    -webkit-border-radius: 2px;
    border-radius: 2px;
    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);

}

.main-center{
 	margin-top: 30px;
 	margin: 0 auto;
 	max-width: 330px;
    padding: 40px 40px;

}

.login-button{
	margin-top: 5px;
}

.login-register{
	font-size: 11px;
	text-align: center;
}

    </style>
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</head>
<body>
<!-- <!DOCTYPE html> -->
<html>
    <head> 
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta charset="utf-8">
		

		<!-- Website Font style -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
		
		
		<title>Registro</title>
	</head>
	<body>
		<div class="container">
			<div class="row">
				<div class="panel-heading">
	               <div class="panel-title text-center">
	               		<h1 class="site-heading">EcoUnizar</h1>
	               		<hr/>
	               	</div>
	            </div> 
				<div class="main-login main-center">
					<form class="form-horizontal" action ="RegistrarUsuario" method="post" role="form" accept-charset="UTF-8" id="formulario" data-toggle="validator">
						
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">Nombre y Apellidos</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="name" id="name"  placeholder="Ingresa tu nombre" required>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">Email</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
									<input type="email" class="form-control" name="email" id="email"  placeholder="Ingresa tu Email" data-error="Email invalido" required>
								</div>
							</div>
							<div class="help-block with-errors"></div>
						</div>
						
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">Año de Nacimiento</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									<input type="number" min="1900" max="2018" class="form-control" name="edad" id="edad"  placeholder="Ingresa tu año de nacimiento" required>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">Contraseña</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" data-minlength="6" class="form-control" id="inputPassword" name= "inputPassword" placeholder="Ingresa aqui tu contraseña" required>
								</div>
								<div class="help-block">Minimo de 6 caracteres</div>
							</div>
						</div>

						<div class="form-group">
							<label for="confirm" class="cols-sm-2 control-label">Confirmar Contraseña</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" class="form-control" id="inputPasswordConfirm" data-match="#inputPassword" data-match-error="Las contraseñas no coinciden" placeholder="Confirma tu contraseña" required>
        							
								</div>
							</div>
							<div class="help-block with-errors"></div>
						</div>

						<div class="form-group ">
							<input type="submit" value="Registrarse" class="btn btn-primary btn-lg btn-block login-button" ></input>
						</div>
					</form>
				</div>
			</div>
		</div>

		<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
		<script type="text/javascript" src="js/validator.js"></script>
		<script>$('formulario').validator()</script>
	</body>
</html>
<script type="text/javascript">

</script>
</body>
</html>
