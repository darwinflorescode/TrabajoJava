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
     
        Conexion con = new Conexion();
        
if (con.getConexion()==null) {
    
    %>
    
    <script>
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
                            <table id="tb_paciente" class="table table-bordered table-striped table-hover js-basic-example dataTable">
                                <thead class="bg-green">
                                    <tr>
                                        <th>ID</th>
                                        <th>Código</th>
                                        <th>Nombre Completo</th>
                                        <th>Género</th>
                                        <th>Fecha</th>
                                        <th>Referencia</th>
                                        <th>Precio</th>
                                        <th>Desc. (20%)</th>
                                        <th>Total</th>
                                        <th width="8%" >Acciones</th>
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
                                            <a href="../GuardarPaciente?id=<%=  c.getId()%>" onclick="return confirm('¿Está seguro de eliminar este registro?');" class="btn btn-danger waves-effect"><i class="fa fa-trash-o"></i></a>
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
               // $('#loader').html('<img src="../imagenes/cargando.gif"> Cargando...');
                $('#ocultar, #espere').show();
            },
            success: function (data) {
                $(".vertabla").html(data).fadeIn('slow');
                $('#loader').html('');
                 $('#ocultar, #espere').hide();

            }
        });


    }
    ;


    function calcular_descuento() {
        var TotalSuma = 0.0, descuento = 0.0;
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
<script>
    //Usando libreria datatable para ordenar y buscar los datos en paginacion
    $(document).ready(function () {

        //datatables
        table = $('#tb_paciente').DataTable({
            "pageLength": 5,
            "order": [[0, "desc"]]
        });
    });
</script>




<%@include file="./modales.jsp" %>
<%@include file="../principal/pie.jsp" %>

<% } %>

