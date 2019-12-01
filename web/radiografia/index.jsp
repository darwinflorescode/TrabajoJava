<%-- 
    Document   : index
    Created on : Nov 19, 2019, 4:07:36 PM
    Author     : DARWINFLORES
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Radiografia"%>
<title>Mantenimiento Radiografías</title>
<%@include file="../principal/encabezado.jsp" %>

<%
     
        Conexion con = new Conexion();
        
if (con.getConexion()==null) {
    %>
 
     <script>;
        var pBar = document.getElementById("p");
         var updateProgress = function(value)
         {
            pBar.value = value;
            pBar.getElementByTagName("span")[0].innerHTML = Math.floor((100 / 70) * value);
         }
       </script>
    

    <hr>
       <br><center><h1 style="font-size:300%"><p><font color="red">¡No se puede conectar con la base de datos!</font></p></h1>;
       <embed src='../imagenes/base.png' heigth='80' width='80'></embed><br><br><progress id='p' max='70'> <span>0</span>%</progress><br>;
       <hr width='80%' color='black' size='8' /></center>;
       <p>Posibles causas:</p>
        <ol>
            <li>Ha perdido conexión con el servidor. </li>
            <li>Base de datos no encontrada. </li>
            <li>Conexión expirada. </li>
            <li>Clave o usuario incorrectos. </li>
            <li>La base de datos fue removida. </li>
        </ol>

       <center><h2 style='color:green'>Debes consultar a soporte t&eacute;cnico.</h2></center>
    
    <%
}else{
    
    Radiografia consult = new Radiografia();

    ArrayList<Radiografia> registros = new ArrayList();

    registros = consult.consultarRegistros();

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

<% } %>

