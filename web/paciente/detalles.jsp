<%-- 
    Document   : detalles
    Created on : Nov 20, 2019, 5:47:46 PM
    Author     : DARWINFLORES
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Paciente"%>
<%@page import="modelo.Radiografia"%>
<%@page import="modelo.Radiologo"%>
<% 
    //Instanciar para paciente
    int id_ = Integer.parseInt(request.getParameter("id_paciente"));
    Paciente consultar = new Paciente();
    ArrayList<Paciente> registros = new ArrayList();

    registros = consultar.consultarRegistrosPorId(id_);

    //instancia para radiografía
     int id_r = Integer.parseInt(request.getParameter("id_radiografia"));
    Radiografia radiogra_ = new Radiografia();
    ArrayList<Radiografia> registros_r = new ArrayList();

    registros_r = radiogra_.consultarRegistrosPorId(id_r);


  //instancia para radiologo
     int id_ra = Integer.parseInt(request.getParameter("id_radiologo"));
    Radiologo radio_ = new Radiologo();
    ArrayList<Radiologo> registros_radio = new ArrayList();

    registros_radio = radio_.consultarRegistrosPorId(id_ra);
%>

<div id="detalles_">

<table style="width: 100%; height: 250px; border: 1px solid;">
<tbody>
<tr style="height: 12px;" class="bg-info">
<td style="width: 746px; height: 12px; text-align: center; border: 1px solid;" colspan="2"><strong>Datos del Paciente</strong></td>
</tr>
<tr style="height: 12px;">
<td style="width: 137.95px; height: 12px; text-align: right;"><strong>ID Paciente:</strong></td>
<td style="width: 605.05px; height: 12px;">&nbsp;&nbsp; <%=  registros.get(0).getId() %></td>
</tr>
<tr style="height: 12px;">
<td style="width: 137.95px; height: 12px; text-align: right;"><strong>Código:</strong></td>
<td style="width: 605.05px; height: 12px;">&nbsp;&nbsp; <%=  registros.get(0).getCodigo()%></td>
</tr>
<tr style="height: 12px;">
<td style="width: 137.95px; height: 12px; text-align: right;"><strong>Nombres:</strong></td>
<td style="width: 605.05px; height: 12px;">&nbsp;&nbsp; <%=  registros.get(0).getNombre()%></td>
</tr>
<tr style="height: 12px;">
<td style="width: 137.95px; height: 12px; text-align: right;"><strong>Apellidos:</strong></td>
<td style="width: 605.05px; height: 12px;">&nbsp;&nbsp; <%=  registros.get(0).getApellido()%></td>
</tr>
<tr style="height: 12px;">
<td style="width: 137.95px; height: 12px; text-align: right;"><strong>Género</strong></td>
<td style="width: 605.05px; height: 12px;">&nbsp;&nbsp; <%=  registros.get(0).getGenero()%></td>
</tr>
<tr style="height: 12px;">
<td style="width: 137.95px; height: 12px; text-align: right;"><strong>Referencia:</strong></td>
<td style="width: 605.05px; height: 12px;">&nbsp;&nbsp; <%=  registros.get(0).getReferencia()%></td>
</tr>
<tr style="height: 12px;">
    <td style="width: 137.95px; height: 12px; text-align: right;"><strong>Direcci&oacute;n:</strong></td>
<td style="width: 605.05px; height: 12px;">&nbsp;&nbsp; <%=  registros.get(0).getDireccion()%></td>
</tr>
</tbody>
</table>
<br>


<table style="width: 100%; height: 250px; border: 1px solid;">
<tbody>
<tr style="height: 12px;" class="bg-info">
<td style="width: 746px; height: 12px; text-align: center; border: 1px solid;" colspan="2"><strong>Detalles de Factura</strong></td>
</tr>
<tr style="height: 12px;">
    <td style="width: 137.95px; height: 12px; text-align: right;"><strong>ID Radiograf&iacute;a:</strong></td>
<td style="width: 605.05px; height: 12px;">&nbsp;&nbsp; <%=  registros_r.get(0).getId() %></td>
</tr>
<tr style="height: 12px;">
    <td style="width: 137.95px; height: 12px; text-align: right;"><strong>Tipo Radiograf&iacute;a:</strong></td>
<td style="width: 605.05px; height: 12px;">&nbsp;&nbsp; <%=  registros_r.get(0).getNombre()%></td>
</tr>
<tr style="height: 12px;">
<td style="width: 137.95px; height: 12px; text-align: right;"><strong>Fecha Elaboración:</strong></td>
<td style="width: 605.05px; height: 12px;">&nbsp;&nbsp; <%=  registros.get(0).getFecha()%></td>
</tr>
<tr style="height: 12px;">
<td style="width: 137.95px; height: 12px; text-align: right;"><strong>Precio:</strong></td>
<td style="width: 605.05px; height: 12px;">&nbsp;&nbsp; $ <%=  registros.get(0).getPrecioActual_rad()%></td>
</tr>

<tr style="height: 12px;">
<td style="width: 137.95px; height: 12px; text-align: right;"><strong>Descuento (20%):</strong></td>
<td style="width: 605.05px; height: 12px;">&nbsp;&nbsp; $ <%=  registros.get(0).getDescuento()%></td>
</tr>
<tr style="height: 12px;">
<td style="width: 137.95px; height: 12px; text-align: right;"><strong>Total a Pagar:</strong></td>
<td style="width: 605.05px; height: 12px; color: red; font-size: 20px;">&nbsp;&nbsp; $ <%=  registros.get(0).getTotal()%></td>
</tr>
<tr style="height: 12px;">
    <td style="width: 137.95px; height: 12px; text-align: right;"><strong>Radiólogo que atendió:</strong></td>
    <td style="width: 605.05px; height: 12px; color: green;">&nbsp;&nbsp; <b><%=  registros_radio.get(0).getId() + " - "+ registros_radio.get(0).getNombre()+ " "+registros_radio.get(0).getApellido()%></b></td>
</tr>
</tbody>
</table>
</di>