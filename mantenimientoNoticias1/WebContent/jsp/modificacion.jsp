<%@page language="java" contentType="text/html"%>
<%@page import="mantenimientoNoticias.beans.Agenda"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="dataManager" scope="application"
  class="mantenimientoNoticias.model.DataManager"/>
<%
  String base = (String)application.getAttribute("base");
  String imageURL = (String)application.getAttribute("imageURL");
  %>
  
   <%
   int consulta=0;
   @SuppressWarnings("unchecked")
   ArrayList <String> datos=(ArrayList<String>)session.getAttribute("datos");
   if (datos == null) {
	    datos = new ArrayList<String>();
	    }
  String action = request.getParameter("action");
  if (action != null && action.equals("actualizar")) {
	    try {
	      String seccion = request.getParameter("seccion");
	      String cabecera = request.getParameter("cabecera");
	      String texto = request.getParameter("texto");
	      String fecha = request.getParameter("fecha");
	      String precio = request.getParameter("precio");
	      String agendaId = request.getParameter("agendaId");
	     	datos.removeAll(datos);
	      datos.add(seccion);
	      datos.add(cabecera);
	      datos.add(texto);
	      datos.add(fecha);
	      datos.add(precio);
	      datos.add(agendaId);
	      consulta=dataManager.actualizarNoticia(datos);
	      session.setAttribute("datos", datos);
	      }
	    catch (Exception e) {
	      out.println("Error deleting the selected item from the database!");
	      }
	    }
  /* Hashtable<String, CartItem> shoppingCart =
      (Hashtable<String, CartItem>)session.getAttribute("shoppingCart");
  if (shoppingCart == null) {
    shoppingCart = new Hashtable<String, CartItem>(10);
    }
  String action = request.getParameter("action");
  if (action != null && action.equals("a�adirItem")) {
    try {
      String agendaId = request.getParameter("agendaId");
      Agenda agenda = dataManager.getDetallesNoticia(agendaId);
      if (agenda != null) {
        CartItem item = new CartItem(agenda, 1);
        shoppingCart.remove(agendaId);
        shoppingCart.put(agendaId, item);
        session.setAttribute("shoppingCart", shoppingCart);
        }
      }
    catch (Exception e) {
      out.println("Error adding the selected book to the shopping cart!");
      }
    }
  if (action != null && action.equals("modificarItem")) {
    try {
      String agendaId = request.getParameter("agendaId");
      String quantity = request.getParameter("quantity");
      CartItem item = shoppingCart.get(agendaId);
      if (item != null) {
        item.setQuantity(quantity);
        }
      }
    catch (Exception e) {
      out.println("Error updating shopping cart!");
      }
    }*/
	
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
  <title>Modificar libro</title>
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
 		 <div class="panel-heading text-center"><h2>Modificar libro</h2></div>   
    	   <div class="panel-body text-center">
    	   <a class="btn btn-primary" href="admin.jsp?pagina=<%=pagena%>">Volver al panel de administracion</a>
    	  </div>  
 
<%
  try {
    String agendaId = request.getParameter("agendaId");
    Agenda agenda = dataManager.getAgendaDetalles(agendaId);
   
    @SuppressWarnings("unchecked")
    ArrayList <String> datas=(ArrayList<String>)session.getAttribute("datos");
    if (consulta != 1) {
  %>
  
  
     
        <form class="form-signin" role="form" action="">
        <table class="table table-hover table-bordered table-striped text-center">
         <tr>
         	 <td><input type="text" name="seccion" value="<%=agenda.getSeccion()%>"></input></td>
         </tr>
         <tr>
         	 <td><input type="text" name="cabecera" value="<%=agenda.getCabecera()%>"></input></td>
         </tr>
         <tr>
         	 <td><textarea rows="10" name="texto" cols="100"><%=agenda.getTexto()%></textarea></td>
         </tr>
         <tr>
         	 <td><input type="text" name="fecha" value="<%=agenda.getFecha()%>"></input></td>
         </tr>
          <!--  <input type="text" value="<%=agenda.getFoto()%>"></input><br>-->
         <tr>
          	<td><input type="text" name="precio" value="<%=agenda.getPrecio()%>"></input></td>
         </tr>
         <tr>
          	<td>
           <input type="hidden" name="action" value="actualizar"/>
              <input type="hidden" name="agendaId" 
                value="<%=agenda.getId()%>"/>
                 <input type="hidden" name="pagina" 
                value="<%=pagena%>"/>
              <input class="btn btn-primary" type="submit" value="Actualizar"/>
           </td>
          </tr>
        </table>
        </form>
<%
      }else{
    	 %> 
           <div class="panel-body text-center">
    	    <h3>El libro se ha modificado con exito</h3>
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



