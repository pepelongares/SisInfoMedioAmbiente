<%@ page language="java" contentType="text/html; charset=utf-8"%>
    
    	<!--  IMPORTS de JAVA -->
	<%@ page import="datos.VO.EntradaVO" %>
	<%@ page import="datos.VO.GrupoVO" %>
	<%@ page import="datos.VO.RespuestaVO" %>
	<%@ page import="datos.Facade" %>
	<%@ page import="datos.VO.CuestionarioVO" %>
	<%@ page import="java.util.List" %>
	<%@ page import="java.util.ArrayList" %>
	


<html lang="es">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin Profesor</title>

    <!-- Bootstrap core CSS-->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Fuentes  -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    
    

    <!-- Page level plugin CSS-->
    <link href="bootstrap/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin.min.css" rel="stylesheet">

</head>

<body id="page-top">

	<%
    	List<EntradaVO> todasLasEntradas = new ArrayList<EntradaVO>();
    	List<EntradaVO> entradasPublicadas = new ArrayList<EntradaVO>();
		Facade fachada = new Facade();	
	    entradasPublicadas = fachada.entradasPublicas();
	    todasLasEntradas = fachada.obtenerTodasEntradas();

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
                    <a class="dropdown-item" href="#" onclick="moderarCarteles()">Moderar carteles</a>
                    <a class="dropdown-item" href="#" onclick="mostrarBaja()">Estadísticas</a>
                </div>
            </li>
        </ul>
                  
	<div id="content-wrapper">

            <div class="container-fluid">
            <%
				String value = (String) request.getParameter("resp");
    			//String value2 = (String) request.getAttribute("resp");
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
                  
                     <div class="container" id="ayuda" style="display:block;">
				<div class="card card-register mx-auto mt-5">
				<div class="card-header">Ayuda</div>
				<div class="card-body">
					<div class="form-group">
						  <div class="form-label-group">
							<h2 align="center">Bienvenido al panel de administración del profesor</h2>
							<h6>Desde el panel izquierdo se pueden realizar todas las acciones de administración de los carteles de los alumnos y ver las 
									estadísticas de participación en las entradas ya publicadas</h6>
							<hr>
							<ul>
							<li>Ayuda: Muestra este panel</li>
							<li>Moderar carteles: Permite moderar los carteles subidos por los alumnos, publicarlos o denegarlos</li>
							<li>Estadísticas: Permite observar las estadísticas de participación en los cuestionarios de las entradas ya publicadas</li>
							</ul>
						  </div>
					</div>
				</div>
			  </div>
			  <br/>
			  
			  
			</div> 
                  
                  

                    
                     <!-- Panel de administración de todos los carteles -->
                    <main class="container pt-5" id="adminCarteles" style="display:none;" >
                        <div class="card mb-5" >
                            <div class="card-header">Moderar Carteles</div>
                            <div class="card-block p-0">
                                <table class="table table-bordered table-sm m-0">
                                    <thead class="">
                                    	<tr>
                                        <th>Grupo</th>
                                        <th>Fecha</th>
                                        <th>Cartel</th>
                                        <th>Estado</th>
                                        <th>Moderar</th>
                                        
                                   	 </tr>
                                    </thead>
                                    <tbody>
                                    
                                    
        <%
			for(EntradaVO entrada : todasLasEntradas){
				if(entrada != null){
					out.write("<tr>");
					GrupoVO grupo = fachada.obtenerGrupo(entrada.getIdGrupo());
				 	int estadoEntrada = entrada.getEstado();
					out.write("<td class=\"align-middle\"><p>" + grupo.getNombre() + "</p></td>");
					out.write("<td class=\"align-middle\"><p>" + entrada.getFecha() + "</p></td>");
					//link a la entrada
					out.write("<td class=\"align-middle\"><a href=\"entrada.jsp?id="+ entrada.getId() +  "\">" + entrada.getTitulo() + "</a></td>") ;
					out.write("<td class=\"align-middle\"><p>");
					
					if(estadoEntrada == 0){
						out.write("Pendiente");
					}
					else if(estadoEntrada == 1){
						out.write("Aceptado");
					}
					else{
						out.write("Rechazado");
					}
					out.write("<td>");
					if(estadoEntrada == 0){
						out.write("<a class=\"btn btn-success\"  href=\"ModerarEntradaServlet?id=" + entrada.getId() + "&tipo=1\"  >VALIDAR </a> ");
						out.write("<a class=\"btn btn-DANGER\"  href=\"ModerarEntradaServlet?id=" + entrada.getId() + "&tipo=2\"  >DENEGAR </a>");
					}
					else if(estadoEntrada == 1){
						out.write("<a class=\"btn btn-DANGER\"  href=\"ModerarEntradaServlet?id=" + entrada.getId() + "&tipo=2\"  >DENEGAR </a>");
					}
					else{
						out.write("<a class=\"btn btn-success\"  href=\"ModerarEntradaServlet?id=" + entrada.getId() + "&tipo=1\"  >VALIDAR </a> ");
					}
					out.write("</p></td>");
					out.write("<td width=\"20%\" class=\"align-middle\"><div class=\"text-center\">");	
					
					
					
					out.write("</div> </td> </tr>");
				}
			}
		%>
                                    
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </main>
                    
                    
                    
                    <!-- FIN PANEL DE ADMINISTRACION DE CARTELES -->

                    <!-- Panel de estadisticas -->
                    <main class="container pt-5"  id="estadisticas" style="display:none;">
                        <div class="card mb-5">
                            <div class="card-block p-0">
                                <table class="table table-bordered table-sm m-0">
                                    <thead class="">
                                    <tr>
                                        <th>Grupo</th>
                                        <th>Fecha</th>
                                        <th>Cartel</th>
                                        <th>Cuestionario  de test</th>
                                        <th>Cuestionario de opinion</th>
                                    </tr>
                                    </thead>
            						<tbody>
<%          
			int contador = 0;
			for(EntradaVO entrada : entradasPublicadas){
				if(entrada != null){
					out.write("<tr>");
					GrupoVO grupo = fachada.obtenerGrupo(entrada.getIdGrupo());
					out.write("<td class=\"align-middle\"><p>" + grupo.getNombre() + "</p></td>");
					out.write("<td class=\"align-middle\"><p>" + entrada.getFecha() + "</p></td>");
					//link a la entrada
					out.write("<td class=\"align-middle\"><a href=\"entrada.jsp?id="+ entrada.getId() +  "\">" + entrada.getTitulo() + "</a></td>") ;
					
					//grafica respuesta
					out.write("<td>");
					out.write("<div class=\"row\">");
					out.write("<div class=\"lg-1 offset-lg-2\" id=\"" +  contador  +  "\"></div>");
					out.write("</div>");
					out.write("</td>");
					//grafica opinion
					out.write("<td>");
					out.write("<div class=\"row\">");
					out.write("<div class=\"lg-1 offset-lg-2\" id=\"O" +  contador  +  "\"></div>");
					out.write("</div>");
					out.write("</td>");
					out.write("</tr>");
					contador++;
				}
			
			}
			
		%>
		 
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </main>
	
		
		</div>
		</div>
		</div>
		</div>


        <!-- /#wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>



    <!-- Bootstrap core JavaScript OK-->
    <script src="jquery/jquery.min.js"></script>
    <script src="bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript OK-->
    <script src="jquery/jquery.easing.min.js"></script>

    <!-- Page level plugin JavaScript-->
    <script src="js/Chart.min.js"></script>
    <script src="datatables/jquery.dataTables.js"></script>
    <script src="datatables/dataTables.bootstrap4.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin.min.js"></script>

    <!-- Demo scripts for this page-->
    <script src="js/datatables-demo.js"></script>
    <script src="js/chart-area-demo.js"></script>

    <script>
		
    function mostrarAyuda(){
			document.getElementById("adminCarteles").style.display = "none";
			document.getElementById("estadisticas").style.display = "none";
			document.getElementById("ayuda").style.display = "block";
		}
	    
    
        function moderarCarteles(){
        	
            document.getElementById("adminCarteles").style.display = "block";
            document.getElementById("estadisticas").style.display = "none"; 
			document.getElementById("ayuda").style.display = "none";
        }
        function mostrarBaja(){
        	
            document.getElementById("adminCarteles").style.display = "none";
            document.getElementById("estadisticas").style.display = "block";
			document.getElementById("ayuda").style.display = "none";
 
        }

    </script>

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

    <script type="text/javascript">
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {
        	


        	
        	<%
        	int contador2 = 0;
        	for(EntradaVO entrada : entradasPublicadas){
        		if(entrada != null){
        			//tipo 0 cuestionario con respuestas correctas e incorrectas
        			CuestionarioVO cuestionarioaAux = fachada.consigueCuestionario(entrada.getId(), 0);
        			if(cuestionarioaAux != null){
	        			out.write("var optionsA"+ contador2 +"= {'title': 'Participación:"+  Integer.toString(fachada.vecesContestado(entrada.getId(), 0))    + 
	        					"','width':200,'height':200,'is3D':true};  ");
	        			int aciertos = cuestionarioaAux.getNumAciertos();
	        			int fallos = cuestionarioaAux.getNumFallos();
	        			out.write("var data"+ contador2 +"= google.visualization.arrayToDataTable([");
	        			out.write("['Aciertos/Fallos', 'Numero'],");
	        			out.write("['Aciertos',"+ aciertos + "],");
	        			out.write("['Fallos'," +  fallos  + "]");
	        			out.write("]);");
	            		out.write("var grafica = new google.visualization.PieChart(document.getElementById('"+ contador2 + "'));");
	            		out.write("grafica.draw(data"+ contador2 + ", optionsA"+ contador2 + ");");
	            		//tipo 1 cuestionario de opinion
	            		out.write("var optionsB"+ contador2 + "= {'title': 'Participación:"+  Integer.toString(fachada.vecesContestado(entrada.getId(), 1))    +  
	            				"','width':200,'height':200,'is3D':true};  ");
	            		List<RespuestaVO> respuestasOpinion = fachada.obtenerRespuestas(entrada.getId(), 1);
	            		int numRespuestas = respuestasOpinion.size();
	            		out.write("var dataO"+ contador2 +"= google.visualization.arrayToDataTable([");
	   					out.write("['");
	        			for(int i = 1 ; i <= numRespuestas; i++){
	        				out.write(Integer.toString(i));
	        				if(i != numRespuestas){
	        					out.write("/");
	        				}
	        			}
	        		    out.write("', 'Numero'],");
	        		    //Contador para saber si es el ultimo
	        		    int CuentaUltimo = 0;
	        		    
	        			
	        		    for(RespuestaVO respuesta: respuestasOpinion){
	        		    	out.write("['" + respuesta.getCuerpo()  +  "',"   + Integer.toString(fachada.vecesContestadaConcreta(respuesta)) + " ]" );
	        		    	CuentaUltimo++;
	        		    	if(CuentaUltimo != numRespuestas){
	        		    		out.write(",");
	        		    	}
        		    }
        		    
        		    
        			out.write(" ]);");
            		out.write("var grafica = new google.visualization.PieChart(document.getElementById('O"+ contador2 + "'));");
            		out.write("grafica.draw(dataO"+ contador2 + ", optionsB" +contador2 +  ");");
            		contador2++;
        			}
        		}
        	}    
            System.out.println(contador2);    
             %>
        }
        </script>
</body>
</html>
        	