<%-- 
    Document   : select
    Created on : Nov 21, 2019, 9:25:53 PM
    Author     : DARWINFLORES
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Paciente"%>
<%@page import="modelo.Radiografia"%>
<%@page import="modelo.Radiologo"%>
<%
    if (request.getParameter("id_radiografia") != "") {

        //instancia para radiografía
        int id_r = Integer.parseInt(request.getParameter("id_radiografia"));
        Radiografia radiogra_ = new Radiografia();
        ArrayList<Radiografia> registros_r = new ArrayList();

        registros_r = radiogra_.consultarRegistrosPorId(id_r);
%>
<div class="col-md-4">
    <div class="input-group">
        <div class="form-line">
            <label class="control-label">Precio Unitario: $ <span style="color: red;">*</span></label>
            <input autofocus="" type="text" readonly="" min="0" name="precio" id="precio" data-inputmask="'alias': 'numeric', 'autoGroup': true, 'digits': 2, 'digitsOptional': false, 'placeholder': '0'" placeholder="0.00"  class="form-control precios"  value="<%=  registros_r.get(0).getPrecio()%>"  required="">
        </div>
    </div>
</div>
<%
    } else {
        System.out.println("Seleccione");
    }
%>
