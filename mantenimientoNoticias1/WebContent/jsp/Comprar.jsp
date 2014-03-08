<%@page language="java" contentType="text/html"%>
<%@page import="java.util.Hashtable"%>
<%@page import="mantenimientoNoticias.beans.CartItem"%>
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
  <title>Comprar</title>
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
                 <li><a href="/mantenimientoNoticias1/jsp/login.jsp">Login</a></li>
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
 		 <div class="panel-heading text-center"><h2>Introduce tus datos</h2></div>     
   
<%
  @SuppressWarnings("unchecked")
  Hashtable<String, CartItem> shoppingCart =
      (Hashtable<String, CartItem>)session.getAttribute("shoppingCart");
  if (shoppingCart != null && !shoppingCart.isEmpty()) {
  %>
    <form class="form-signin" role="form" action="">
      <input type="hidden" name="action" value="orderConfirmation"/>
      <table class="table table-hover table-bordered table-striped text-center">
        <tr>
          <th class="text-center">Detalles de la entrega</th>
        </tr>
        <tr>
          <td><label>Nombre de contacto:</label><input type="text" name="contactName"/></td>
        </tr>
        <tr>
          <td><label>Direccion de entrega:</label><input type="text" name="deliveryAddress"/></td>
        </tr>
        <tr>
          <th class="text-center">Detalles tarjeta de credito</th>
        </tr>
        <tr>
          <td><label>Nombre tarjeta credito:</label><input type="text" name="ccName"/></td>
        </tr>
        <tr>
          <td><label>Numero tarjeta credito:</label><input type="text" name="ccNumber"/></td>
        </tr>
        <tr>
          <td><label>Fecha expiracion tarjeta credito:</label><input type="text" name="ccExpiryDate"/></td>
        </tr>
        <tr>
          <td><input class="btn btn-primary" type="submit" value="Confirmar pedido"/></td>
        </tr>
        </table>
      </form>
<%
    }
  else {
    %><p class="error">ERROR: You can't check out an empty shopping cart!</p><% 
    }
  %>

      
      
    </div>   
      <hr>

      <footer>
        <p>&copy;  Nelson Noda, Adrian Marrero y Moises Medina 2014</p>
      </footer>
    </div> 
    
  
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



