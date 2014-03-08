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
    <link href="../bootstrap/css/bootstrap.css" rel="stylesheet">

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
<title>Miniaturas de cuadros</title>

<script type="text/javascript">

	var ventana;
	var ventanaAbierta = false;	
	
	
	function abrirVentana(nombre, direccion){
		
    			opener.document.getElementById("nombreFoto").value = nombre;
				opener.document.getElementById("fotito").src = direccion;
	}
	
	
	function tamañoVentana(ancho, alto){
		
		ventana.resizeTo(ancho + 12, alto + 28);
		
		}
</script>
		
</head>
<body>
   <header>
        
   </header>    
   
 
	<div class="container">	
      	
   		
        <div class="row text-center">
  <div class="col-md-12">
      <img class="img-thumbnail" name="Damaso1.gif" src="../images/Damaso1.gif" alt="Damaso"  onclick="abrirVentana(this.name, this.src);return false" />

      <img class="img-thumbnail" name="Felo1.gif"  src="../images/Felo1.gif" alt="Felo 1"  onclick="abrirVentana(this.name, this.src);return false" />

      <img class="img-thumbnail" name="Padron1.gif"  src="../images/Padron1.gif" alt="Padron"  onclick="abrirVentana(this.name, this.src);return false" />

      <img class="img-thumbnail" name="Nestor1.gif" src="../images/Nestor1.gif" alt="Nestor" onclick="abrirVentana(this.name, this.src);return false"  />

      <img class="img-thumbnail" name="Nestor2.gif" src="../images/Nestor2.gif" alt="Nestor2"  onclick="abrirVentana(this.name, this.src);return false" />
  </div>
  <div class="col-md-12">
      <img  class="img-thumbnail" name="lujan1.gif" src="../images/lujan1.gif" alt="Lujan"  onclick="abrirVentana(this.name, this.src);return false" />
 
      <img class="img-thumbnail" name="Felo2.gif" src="../images/Felo2.gif" alt="Felo 2"  onclick="abrirVentana(this.name, this.src);return false" />
 
      <img class="img-thumbnail" name="Padron2.gif" src="../images/Padron2.gif" alt="Padron2"  onclick="abrirVentana(this.name, this.src);return false" />
  
      <img class="img-thumbnail" name="Nestor3.gif" src="../images/Nestor3.gif" alt="Nestor3"  onclick="abrirVentana(this.name, this.src);return false" />
 
      <img class="img-thumbnail" name="Nestor4.gif" src="../images/Nestor4.gif" alt="Nestor4"  onclick="abrirVentana(this.name, this.src);return false" />
  </div>
	</div>       
		  <hr>

      <footer>
        <p>&copy; Moises Medina Monroy 2014</p>
      </footer>
                
	</div>   
    
    </div> 
 <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="../bootstrap/js/jquery.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script> 
</body>
</html>
