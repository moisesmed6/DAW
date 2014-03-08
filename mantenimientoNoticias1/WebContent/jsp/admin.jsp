<%
if(session.getAttribute("usr")== null){
	response.sendRedirect("login.jsp");		
}else{
	String usuario= (String) session.getAttribute("usr");
}
%>
<%@page language="java" contentType="text/html"%>
<%@page import="mantenimientoNoticias.beans.Agenda"%>
<%@page import="java.util.Hashtable"%>
<%@page import="java.util.Enumeration"%>
<jsp:useBean id="dataManager" scope="application"
  class="mantenimientoNoticias.model.DataManager"/>
<%
	
	System.out.println(session.getAttribute("usr"));
	System.out.println(session.getAttribute("pwd"));
    System.out.println("IdSesion" + session.getId());

  String base = (String)application.getAttribute("base");
  String imageURL = (String)application.getAttribute("imageURL");
  
  String action = request.getParameter("action");
 
  if (action != null && action.equals("anadirItem")) {
    try {
      String bookId = request.getParameter("agendaId");
    	response.sendRedirect("alta.jsp?agendaId="+bookId);
    	
        }
      
    catch (Exception e) {
      out.println("Error adding the selected book to the shopping cart!");
      }
    }
 
  if (action != null && action.equals("modificarItem")) {
    try {
      String bookId = request.getParameter("agendaId");
      response.sendRedirect("modificacion.jsp?agendaId="+bookId);
      }
    catch (Exception e) {
      out.println("Error updating shopping cart!");
      }
    }
 
  if (action != null && action.equals("borrarItem")) {
    try {
      String bookId = request.getParameter("agendaId");
      response.sendRedirect("baja.jsp?agendaId="+bookId);
      }
    catch (Exception e) {
      out.println("Error deleting the selected item from the shopping cart!");
      }
  }
  
  
	int pagena=0;
    
    try{
	pagena = Integer.parseInt(request.getParameter("pagina"));
	} catch (NumberFormatException e) {
	      //out.println("Error deleting the selected item from the database!");
	      }
    
	System.out.println(pagena);
	int min=pagena*7;
	System.out.println(min);
	
	
	
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
<title>Detalles agenda</title>


  <script type="text/javascript">

	function ir(valor){
		var tipo=document.getElementsByName("noticias");
		
		for(var i=0; i<tipo.length; i++) {
					if(tipo[i].checked){
							var tipo2=tipo[i].value;
							//var cabeza=document.getElementById("cab"+tipo2).innerText;
						} 					 
		}
		
		//alert(tipo2);	
		//alert(cabeza);
		if(valor=="agregar"){
			document.location.href="alta.jsp?&pagina=<%=pagena%>";
			
		}else{
			
			if(tipo2==undefined){
			
			alert("No has seleccinado ninguna noticia");
			}else{
				
				switch(valor)
			{
			case "ver":
			 // alert("ver a");
			  document.location.href="ver.jsp?agendaId="+tipo2+"&pagina=<%=pagena%>";
			  break;
			case "borrar":
			 // alert("borrar a");
			  document.location.href="baja.jsp?agendaId="+tipo2+"&pagina=<%=pagena%>";
			  break;
			case "editar":
			//  alert("editar a");
			  document.location.href="modificacion.jsp?agendaId="+tipo2+"&pagina=<%=pagena%>";
			  break;
			}
			}
		}
	}
	


</script>
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
                  <a class="navbar-brand" href="#">Java</a>
                </div>
               <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <ul class="nav navbar-nav">
                <li class="active"><a href="#">Administrar</a></li>
                <li><a href="cerrarSesion.jsp">Salir</a></li>
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
 		 <div class="panel-heading text-center"><h2>Administrar noticias</h2></div>     
   

<%
//public double redondear (double numero, int decimales){
//	   return Math.round(numero*Math.pow(10,decimales))/Math.pow(10,decimales);
//	  }




Hashtable<String, String> secciones = dataManager.getAgenda();
Hashtable<String, String> seccionesLimit = dataManager.getAgenda(min, 7);
Enumeration<String> seccionesIds = seccionesLimit.keys();
//System.out.println(secciones.size());


int maximo =secciones.size();
//Paginas = Math.ceil( double(TotalRegistros) / double(RegistrosPorPagina) );


float pag=maximo/7;
int paginas=(int)Math.ceil(pag);
	System.out.println(paginas);

%>

  <div class="row">
         <div class="col-md-4">
         </div>
           <div class="col-md-4">
<ul class="pagination">
      <li><a href="admin.jsp?pagina=0">&laquo;</a></li>
<%      
for(int i=0;i<=paginas;i++){
	if(i==pagena){
%>

	
 <li class="active"><a href="admin.jsp?pagina=<%=i%>"><%= (i+1) %></a></li>
 

<%
	}else{
%>
	<li><a href="admin.jsp?pagina=<%=i%>"><%= (i+1) %></a></li>
<%

	}
}	
%>
   <li><a href="admin.jsp?pagina=<%= paginas%>">&raquo;</a></li>
  </ul></div>
    <div class="col-md-4">
    </div>
    </div>

<form class="form-signin" role="form" action="">
   <table class="table table-hover table-bordered table-striped">

<%

for(int i=0;i<7;i++) {
	try{
  Object seccionId = seccionesIds.nextElement();

 %>
 
    <tr>
  	   <td><input type="radio" name="noticias" value="<%=(seccionId.toString()) %>" id="<%=(seccionId.toString()) %>"></input>
  	   <label for="<%=(seccionId.toString()) %>"><%=(seccionesLimit.get(seccionId)) %></label></td>
	</tr>
  

 <%
	}catch(java.util.NoSuchElementException e){
		
		
	}
	}
 
 %>
 </table>
  </form>
  
 
  
    </div>   
      <table class="table table-hover table-bordered table-striped text-center">
    <tr>
  	   <td><a class="btn btn-primary" href="#" id="ver" onClick="javascript:ir(this.id)" value="ver">ver</a></td>
	   <td><a class="btn btn-primary" href="#" id="editar" onClick="javascript:ir(this.id)" value="editar">editar</a></td>
	   <td><a class="btn btn-primary" href="#" id="borrar" onClick="javascript:ir(this.id)" value="borrar">borrar</a></td>
	   <td><a class="btn btn-primary" href="#" id="agregar" onClick="javascript:ir(this.id)" value="agregar">agregar</a></td>
	</tr>
  </table>
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



