<%-- 
    Document   : encabezado
    Created on : Nov 19, 2019, 1:29:37 PM
    Author     : DARWINFLORES
--%>

<%@page import="modelo.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>
            Menú Principal
        </title>
        <!-- Favicon-->
        <link rel="icon" href="../imagenes/logo.png" type="image/x-icon">

        <!-- Bootstrap Core Css -->
        <link href="../bootstrap/css/bootstrap.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="../css/dataTables.bootstrap.css">
        <link rel="stylesheet" type="text/css" href="../css/jquery.dataTables.min.css">

        <!-- Custom Css -->
        <link href="../css/stilos.css" rel="stylesheet">
        <!-- Jquery Core Js -->
       
        <script src="../bootstrap/js/jquery-1.11.2.min.js" type="text/javascript"></script>
        <!-- Waves Effect Plugin Js -->
        <script src="../js/waves.js">
        </script>
        <script src="../bootstrap/js/bootstrap.min.js">
        </script>
        <script src="../js/jquery.dataTables.min.js"></script>
        <!-- Validation Plugin Js -->
        <script src="../js/validate.js">
        </script>
        <!-- Custom Js -->
        <script src="../js/admin.js">
        </script>
        <script src="../js/formvalidate.js">
        </script>
 <script src="../js/fileinput.js">
        </script>
        <script src="../js/jquery.maskedinput.min.js">
        </script>
        <script src="../js/jquery.inputmask.bundle.min.js">
        </script>
        
        
    </head>
    <body style="background-color: #fff;">
    
        <nav class="navbar navbar-default navbar-fixed" role="navigation">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header ">
                    <button aria-expanded="false" class="navbar-toggle" data-target="#bs-example-navbar-collapse-1" data-toggle="collapse" type="button">

                    </button>

                    <a href="../principal/"> <img alt="" height="50" src="../imagenes/logo.png"/></a>

                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="">
                            <a href="../principal/">
                                <i class="fa fa-home">
                                </i>
                                Inicio
                            </a>
                        </li>



                        <li class="">
                            <a href="../paciente/">
                                <i class="fa fa-user">
                                </i>
                                Pacientes
                            </a>
                        </li>

                        <li class="">
                            <a href="../radiologo/">
                                <i class="fa fa-users">
                                </i>
                                Radiólogo
                                <span class="sr-only">
                                    (current)
                                </span>
                            </a>
                        </li>
                        <li class="">
                            <a href="../radiografia/">
                                <i class="fa fa-bed">
                                </i>
                                Radiografía
                            </a>
                        </li>






                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a  >Bienvenid@:  <b> </b></a></li>

                        <li>
                            <a href="../" onclick="return confirm('¿Está seguro de Salir?');">
                                <i class="glyphicon glyphicon-off">
                                </i>
                                Salir
                            </a>
                        </li>
                    </ul>



                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>
        <br>
        <br>
        <br>
        <br>
        
        <div id="ocultar"></div>
        <div id="espere">
    <h4>Espere, por favor.</h4>
    <p>Por favor, espere... ¡Es solo un momento!</p>
</div>
   
     