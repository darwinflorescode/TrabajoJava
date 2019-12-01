<%-- 
    Document   : index
    Created on : Nov 19, 2019, 1:29:53 PM
    Author     : DARWINFLORES
--%>

<%@include file="encabezado.jsp" %>

<section class="container-fluid">
    <!-- Basic Example -->
    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
        <div class="card">
            <div class="header">
                <h2>
                    Carrusel de imagenes   
                </h2>
            </div>
            <div class="body">
                <div class="carousel slide" data-ride="carousel" id="carousel-example-generic">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li class="active" data-slide-to="0" data-target="#carousel-example-generic">
                        </li>
                        <li data-slide-to="1" data-target="#carousel-example-generic">
                        </li>
                        <li data-slide-to="2" data-target="#carousel-example-generic">
                        </li>
                    </ol>
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                        <div class="item active">
                            <img src="../imagenes/4.jpg" style="width: 750px; height: 380px;" />
                        </div>
                        <div class="item">
                            <img src="../imagenes/2.jpg" style="width: 750px; height: 380px;" />
                        </div>
                        <div class="item">
                            <img src="../imagenes/3.jpg" style="width: 750px; height: 380px;" />
                        </div>
                        
                    </div>
                    <!-- Controls -->
                    <a class="left carousel-control" data-slide="prev" href="#carousel-example-generic" role="button">
                        <span aria-hidden="true" class="glyphicon glyphicon-chevron-left">
                        </span>
                        <span class="sr-only">
                            Previous
                        </span>
                    </a>
                    <a class="right carousel-control" data-slide="next" href="#carousel-example-generic" role="button">
                        <span aria-hidden="true" class="glyphicon glyphicon-chevron-right">
                        </span>
                        <span class="sr-only">
                            Next
                        </span>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!-- #END# Basic Example -->
    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
        <div class="card">
            <div class="header">
                <h2>
                   Buena Atención al Paciente
                </h2>
            </div>
            <div class="body">
                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="../imagenes/5.jpg" style="width: 750px; height: 380px;" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
    <%@include file="pie.jsp" %>
