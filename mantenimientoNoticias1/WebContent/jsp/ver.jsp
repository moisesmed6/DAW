<%@page language="java" contentType="text/html"%>
<%@page import="mantenimientoNoticias.beans.Agenda"%>
<jsp:useBean id="dataManager" scope="application"
  class="mantenimientoNoticias.model.DataManager"/>
<%
  String base = (String)application.getAttribute("base");
  String imageURL = (String)application.getAttribute("imageURL");
  %>
  
  
  <%
  String action = request.getParameter("action");
  if (action != null && action.equals("borrar")) {
	    try {
	      String agendaId = request.getParameter("agendaId");
	     dataManager.borrarNoticia(agendaId);
	      }
	    catch (Exception e) {
	      out.println("Error deleting the selected item from the database!");
	      }
	    }
  
  
	int pagena=0;
    
    try{
	pagena = Integer.parseInt(request.getParameter("pagina"));
	} catch (NumberFormatException e) {
	      //out.println("Error deleting the selected item from the database!");
	      }
    
   
  %>
<!DOCTYPE HTML>
<html lang="en">
  <head>
    <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../docs-assets/ico/favicon.png">


    <!-- Bootstrap core CSS -->
   <link href="/mantenimientoNoticias1/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="/mantenimientoNoticias1/bootstrap/css/hover.css" rel="stylesheet" media="all">
      
   <link href="../bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="../bootstrap/css/hover.css" rel="stylesheet" media="all">

    <!-- Custom styles for this template -->
    <!--<link href="jumbotron.css" rel="stylesheet">-->

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../docs-assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

<!------------------------------------------------------------------------------------- De aqui para arriba es de bootstrap--------------------->
<!--<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-15" />-->
<!--<link rel="stylesheet" type="text/css" href="../css/indice.css">-->
 <title>Ver noticia</title>
</head>
<body>
   <header>
   
                <div class="navbar navbar-default navbar-fixed-top" role="navigation">
              <div class="container">
                <div class="navbar-header">
                  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                  </button>
                  <a class="navbar-brand" href="index.jsp">Java</a>
                </div>
               <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <ul class="nav navbar-nav">
               <li><a href="index.jsp">Inicio</a></li>
                <li><a href="admin.jsp">Administrar</a></li>
               <!-- <li><a href="#">Link</a></li>-->
                <!--<li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">Ejercicios<b class="caret"></b></a>
                  <ul class="dropdown-menu">
                    <li><a href="ejercicios/pizza.html">Pizza</a></li>
                  </ul>
                </li>-->
              </ul>
            </div>
              </div>
            </div>
 
   </header>    
   
   
	<div class="container">
    
    
     <!--<div data-scrollReveal="enter bottom and move 50px over 1s" class="jumbotron">
      <div class="container">
        <div class="media">
              <a class="pull-left" href="#">
                  <img class="media-object img-responsive img-thumbnail" src="../images/avatar.png" alt="...">
              </a>
              <div class="media-body">
                    <h1></h1>
               <h1 class="media-heading text-center">Desarrollo web <small>en entorno servidor</small></h1>
              </div>
        </div>
           
      </div>
    </div>-->
  

   
      <div class="panel panel-default">
 		 <div class="panel-heading text-center"><h2>Detalles del libro</h2></div>   
    	   <div class="panel-body text-center">
    	  <a class="btn btn-primary" href="admin.jsp?pagina=<%=pagena%>">Volver al panel de administracion</a>
    	  </div>  
   
<%
  try {
    String agendaId = request.getParameter("agendaId");
    Agenda agenda = dataManager.getAgendaDetalles(agendaId);
    if (agenda != null) {
  %>
      <table class="table table-hover table-bordered table-striped text-center">
        <tr>
           <th>Foto</th>
           <th>Id</th>
           <th>Seccion</th>
           <th>Titulo</th>
           <th>Texto</th>
           <th>Fecha</th>
           <th>Precio</th>
        </tr>
        <tr>
          <td><img src="<%=(imageURL + agenda.getFoto())%>"/></td>
          <td><%= agenda.getId() %></td>
          <td><%= agenda.getSeccion() %></td>   
          <td><%= agenda.getCabecera() %></td>          
          <td><%= agenda.getTexto() %></td>
          <td><%= agenda.getFecha() %></td>
          <td><%= agenda.getPrecio() %></td>
        </tr>
        </table>
        
<%
      }else{
    	 %> 
          <div class="panel-body">
 		   <h3>No hay ningun libro</h3>
    	  </div>
          <%
		
    	 
      }
    }
  catch (Exception e) {
	%><p>Invalid book identifier!</p><%
    }
  %>
    </div> 
    
     <hr>

      <footer>
        <p>&copy;  Nelson Noda, Adrian Marrero y Moises Medina 2014</p>
      </footer>
 <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="/mantenimientoNoticias1/bootstrap/js/jquery.js"></script>
    <script src="/mantenimientoNoticias1/bootstrap/js/bootstrap.min.js"></script>  
     <script src="/mantenimientoNoticias1/bootstrap/js/scrollReveal.js"></script>
  <script>

      window.scrollReveal = new scrollReveal();

  </script>             
</body>
</html>



