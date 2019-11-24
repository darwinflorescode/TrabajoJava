<%-- 
    Document   : index
    Created on : Nov 20, 2019, 2:30:14 PM
    Author     : DARWINFLORES
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Radiologo"%>
<title>Mantenimiento Datos del Radiólogo</title>
<%@include file="../principal/encabezado.jsp" %>

<%  Radiologo consultar = new Radiologo();
    ArrayList<Radiologo> registros = new ArrayList();

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
                                <td align="center"  width="80%"><b>RADIÓLOGOS</b> <span class="fa fa-users"></span></td>
                                <td  width="30%"><a href="javascript:imprSelec('tb_radiografia')"  class="btn btn-info waves-effect"><span class="fa fa-print"></span> Imprimir Reporte</a></td>
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
                                        <th>Nombres</th>
                                        <th>Apellidos</th>
                                        <th width="18%" >Acciones</th>
                                    </tr>
                                </thead>

                                <tbody>

                                    <%
                                        for (Radiologo c : registros) {

                                    %>
                                    <tr>
                                        <td><%=  c.getId()%></td>
                                        <td><%=  c.getNombre()%></td>
                                        <td><%=  c.getApellido()%></td>

                                        <td>
                                            <a type="button" class="btn btn-info waves-effect" onclick="" data-toggle="modal" data-target="#modalm"><i class="fa fa-edit"></i>&nbsp; Modificar</a>
                                            <a href="../eliminar.do?id=" onclick="return confirm('¿Está seguro de eliminar este registro?');" class="btn btn-danger waves-effect"><i class="fa fa-trash-o"></i>&nbsp; Eliminar</a>

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
//Usando libreria datatable para ordenar y buscar los datos en paginacion
    $(document).ready(function () {

        //datatables
        table = $('#tb_radiografia').DataTable({
            "pageLength": 5,
            "order": [[0, "desc"]]
        });
    });


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


<%}else if (request.getParameter("g").equals("vacio")) {
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

   <% }else {%>
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

