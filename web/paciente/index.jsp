<%-- 
    Document   : index
    Created on : Nov 20, 2019, 4:59:05 PM
    Author     : DARWINFLORES
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Paciente"%>
<title>Mantenimiento de Datos del Paciente</title>
<%@include file="../principal/encabezado.jsp" %>

<%
    Paciente consultar = new Paciente();
    ArrayList<Paciente> registros = new ArrayList();

    registros = consultar.consultarRegistros();

%>

<section class="container-fluid">
    <div class="container-fluid">

        <!-- Basic Examples -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <table>
                            <tr>
                                <td align="left" width="10%"> <a type="button" class="btn btn-success waves-effect" data-toggle="modal" data-target="#modal"><i class="fa fa-plus-square"></i>&nbsp; Nuevo</a></td>
                                <td align="center"  width="80%"><b>PACIENTES</b> <span class="fa fa-user"></span></td>
                                <td  width="30%"><a href="javascript:imprimirSeleccion('Comprobante','detalles_')"  class="btn btn-info waves-effect"><span class="fa fa-print"></span> Imprimir Reporte</a></td>
                            </tr>
                        </table>


                    </div>

                    <div class="body">
                        <div id="add-brand-messages">

                        </div>

                        <div class="table-responsive">
                            <table id="tb_radiografia" class="table table-bordered table-striped table-hover js-basic-example dataTable">
                                <thead class="bg-green">
                                    <tr>
                                        <th>ID</th>
                                        <th>Código</th>
                                        <th>Nombre Completo</th>
                                        <th>Género</th>
                                        <th>Fecha</th>
                                        <th>Referencia</th>
                                        <th>Precio</th>
                                        <th>Desc.</th>
                                        <th>Total</th>
                                        <th width="13%" >Acciones</th>
                                    </tr>
                                </thead>

                                <tbody>

                                    <%                                        for (Paciente c : registros) {

                                    %>
                                    <tr>
                                        <td><%=  c.getId()%></td>
                                        <td><%=  c.getCodigo()%></td>
                                        <td><%=  c.getNombre() + " " + c.getApellido()%></td>

                                        <td><%=  c.getGenero()%></td>

                                        <td><%=  c.getFecha()%></td>
                                        <td><%=  c.getReferencia()%></td>
                                        <td>$ <%=  c.getPrecioActual_rad()%></td>
                                        <td>$ <%=  c.getDescuento()%></td>
                                        <td>$ <%=  c.getTotal()%></td>

                                        <td>
                                            <a type="button" class="btn btn-info waves-effect" onclick="cargar_detalle(<%= c.getId()%>,<%= c.getRadiologo_id()%>,<%= c.getRadiografia_id()%>);" data-toggle="modal" data-target="#modaldetalle"><i class="fa fa-eye"></i></a>
                                            <a href="../eliminar.do?id=" onclick="return confirm('¿Está seguro de eliminar este registro?');" class="btn btn-primary waves-effect"><i class="fa fa-edit"></i></a>
                                            <a href="../eliminar.do?id=" onclick="return confirm('¿Está seguro de eliminar este registro?');" class="btn btn-danger waves-effect"><i class="fa fa-trash-o"></i></a>
                                        </td>
                                    </tr>

                                    <%
                                        }

                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- #END# Basic Examples -->

    </div>
</section>

<script type="text/javascript">

    function cargar_detalle(id_paciente, id_radiologo, id_radiologia) {


        $("#loader").fadeIn('slow');
        $.ajax({
            type: 'GET',
            url: 'detalles.jsp?id_paciente=' + id_paciente + "&id_radiologo=" + id_radiologo + "&id_radiografia=" + id_radiologia,
            beforeSend: function (objeto) {
                $('#loader').html('<img src="../imagenes/cargando.gif"> Cargando...');
            },
            success: function (data) {
                $(".vertabla").html(data).fadeIn('slow');
                $('#loader').html('');

            }
        });


    }
    ;


    function calcular_descuento() {
        var TotalSuma = 0, descuento = 0;
        var idradiografia = document.getElementById('tipo_radiografia').value;
        var referencia = document.getElementById('referencia').value;
        if (idradiografia != null && referencia != null) {
            var precio = document.getElementById('precio').value; // Convertir a numero entero (número).

            if (referencia == "Hospital Nacional") {
                descuento = precio * 0.20;
            }
           
            /* Variable genrando la suma. */
            TotalSuma = (parseFloat(precio) - parseFloat(descuento));
             document.getElementById('descuento').value = descuento;
            document.getElementById('totalpago').value = TotalSuma;
            document.getElementById('total').value = precio;

        }

    }



//Usando libreria datatable para ordenar y buscar los datos en paginacion
    $(document).ready(function () {

        //datatables
        table = $('#tb_radiografia').DataTable({
            "pageLength": 5,
            "order": [[0, "desc"]]
        });
    });


</script>

<script>
    function cargar_select(id_radiografia) {
        $("#cargando").fadeIn('slow');
        $.ajax({
            type: 'GET',
            url: 'select.jsp?id_radiografia=' + id_radiografia,
            beforeSend: function (objeto) {
                $('#cargando').html('<img src="../imagenes/cargando.gif"> Cargando...');
            },
            success: function (data) {
                $(".cargarselect").html(data).fadeIn('slow');
                $('#cargando').html('');
                calcular_descuento()

            }
        });

    }
    ;
</script>

<%     if (request.getParameter("g") != null) { //Verificar que el parametro venga lleno
        if (request.getParameter("g").equals("exito")) {//parametro para mostrar el mensaje correspondiente

%>
<script>
    $(document).ready(function () {
        $('#add-brand-messages').html('<div class="alert alert-success">' +
                '<button type="button" class="close" data-dismiss="alert">&times;</button>' +
                '<strong><i class="fa fa-check"></i></strong> Datos Almacenados Correctamente</div>');

        window.setTimeout(function () {
            $(".alert-success").fadeTo(500, 0).slideUp(500, function () {
                $(this).remove();
            });
        }, 4000); // /.alert
    });
</script>


<%} else if (request.getParameter("g").equals("vacio")) {
%>
<script>
    $(document).ready(function () {
        $('#add-brand-messages').html('<div class="alert alert-warning">' +
                '<button type="button" class="close" data-dismiss="alert">&times;</button>' +
                '<strong><i class="fa fa-check"></i></strong> Datos Vacios. Complete</div>');

        window.setTimeout(function () {
            $(".alert-success").fadeTo(500, 0).slideUp(500, function () {
                $(this).remove();
            });
        }, 4000); // /.alert
    });
</script>

<% } else {%>
<script>
    $(document).ready(function () {
        $('#add-brand-messages').html('<div class="alert alert-danger">' +
                '<button type="button" class="close" data-dismiss="alert">&times;</button>' +
                '<strong><i class="fa fa-check"></i></strong> Ha ocurrido un error, si este persiste comuniquese con los desarrolladores</div>');

        window.setTimeout(function () {
            $(".alert-danger").fadeTo(500, 0).slideUp(500, function () {
                $(this).remove();
            });
        }, 4000); // /.alert
    });
</script>

<%
        }
    }
%>

<%@include file="./modales.jsp" %>
<%@include file="../principal/pie.jsp" %>


