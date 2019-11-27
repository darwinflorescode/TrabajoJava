<%-- 
    Document   : index
    Created on : Nov 19, 2019, 4:07:36 PM
    Author     : DARWINFLORES
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Radiografia"%>
<title>Mantenimiento Radiografías</title>
<%@include file="../principal/encabezado.jsp" %>

<%  Radiografia consultar = new Radiografia();
    ArrayList<Radiografia> registros = new ArrayList();

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
                                <td align="center"  width="80%"><b>RADIOGRAFÍAS</b> <span class="fa fa-bed"></span></td>
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
                                        <th>Nombre Radiografía</th>
                                        <th>Precio</th>
                                        <th width="8%" >Acciones</th>
                                    </tr>
                                </thead>

                                <tbody>

                                    <% 
                                        for (Radiografia c : registros) {

                                    %>
                                    <tr>
                                        <td><%=  c.getId()%></td>
                                        <td><%=  c.getNombre()%></td>
                                        <td><label class="badge label-warning">$ <%=  c.getPrecio()%></label></td>

                                        <td>
                                            
                                            <a href="../GuardarRadiografia?id=<%=  c.getId()%>" onclick="return confirm('¿Está seguro de eliminar este registro?');" class="btn btn-danger waves-effect"><i class="fa fa-trash-o"></i>&nbsp; Eliminar</a>

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


<%@include file="./modales.jsp" %>
<%@include file="../principal/pie.jsp" %>

