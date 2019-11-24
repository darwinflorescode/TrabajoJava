<%-- 
    Document   : modales
    Created on : Nov 20, 2019, 4:59:14 PM
    Author     : DARWINFLORES
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Radiografia"%>
<%@page import="modelo.Radiologo"%>

<%
    //instancia para radiografía

    Radiografia radiogra_ = new Radiografia();
    ArrayList<Radiografia> registros_r = new ArrayList();

    registros_r = radiogra_.consultarRegistros();

    //instancia para radiologo
    Radiologo radio_ = new Radiologo();
    ArrayList<Radiologo> registros_radio = new ArrayList();

    registros_radio = radio_.consultarRegistros();

    Date dNow = new Date();
    SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
    String currentDate = ft.format(dNow);
%>
<div id="modaldetalle" class="modal fade" style="display: none;">
    <div class="modal-dialog  modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-deep-purple">
                <button type="button" class="close" data-dismiss="modal">×</button>
                <h5 class="modal-title"><i class="fa fa-credit-card-alt"></i>&nbsp;Comprobante de Pago</h5>
                <br>
            </div>

            <div class="modal-body">


                <div id="loader" style="position: absolute; text-align: center; top: 80px;  width: 100%;display:none;"></div>
                <div class="vertabla"></div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default waves-effect" data-dismiss="modal"><span class="fa fa-close"></span> Cerrar</button>
                    <a href="javascript:imprimirSeleccion('Comprobante','detalles_')"  class="btn btn-info waves-effect"><span class="fa fa-print"></span> Imprimir</a>
                </div>


            </div>
        </div>
    </div>
</div>

<div id="modal" class="modal fade" style="display: none;">
    <div class="modal-dialog  modal-lg" >
        <div class="modal-content">
            <div class="modal-header bg-green">
                <button type="button" class="close" data-dismiss="modal">×</button>
                <h5 class="modal-title"><i class="fa fa-plus"></i> Agrega un Paciente</h5>
                <br>
            </div>
            <div class="modal-body">
                <form class="formNormal" id="formulario" autocomplete="off" method="POST" action="../guardar.do?paci" >
                    <div style="text-align: right; float: right">
                        <span style="color:red">*</span> Datos Obligatorios
                    </div>
                    <ul class="nav nav-tabs">
                        <li ><a data-toggle="tab" href="#datosinf"><b>Datos Personales del Paciente</b></a></li>

                    </ul><br>

                    <div class="row">
                        <div class="col-md-4">
                            <div class="input-group">
                                <div class="form-line">
                                    <label class="control-label">Código: <span style="color: red;">*</span></label>
                                    <input autofocus="" type="text" name="identiticacion"  class="form-control" required="">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="input-group">
                                <div class="form-line">
                                    <label class="control-label">Nombres:  <span style="color: red;">*</span></label>
                                    <input type="text" name="nombre" class="form-control" required="">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="input-group">
                                <div class="form-line">
                                    <label class="control-label">Apellidos:  <span style="color: red;">*</span></label>
                                    <input type="text" name="apellido" class="form-control" required="">
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="input-group">
                                

                                    <label class="control-label">Género: <span style="color: red;">*</span></label>
                                    <br>
                                    <input class="filled-in radio-col-green" value="Mascullino"  id="masc" name="genero" type="radio" required="">
                                    <label for="masc">
                                        Mascullino
                                    </label>

                                    <input class="filled-in radio-col-green" required=""  value="Femenino" id="feme" name="genero" type="radio">
                                    <label for="feme">
                                        Femenino
                                    </label>

                              
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="input-group">
                                <div class="form-line">
                                    <label class="control-label">Fecha de Elaboración:  <span style="color: red;">*</span></label>
                                    <input type="date" name="fechan" value="<%= currentDate%>" class="form-control" required="">

                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="input-group">
                                <div class="form-line">
                                    <label class="control-label">Referencia de:  <span style="color: red;">*</span></label>
                                    <select class="form-control show-tick" name="referencia" id="referencia" required="" onchange="calcular_descuento();">
                                        <option value="">Seleccione...</option>
                                        <option value="Doctor Privado">Doctor Privado</option>
                                        <option value="Hospital Nacional">Hospital Nacional</option>
                                    </select>

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="input-group">
                                <div class="form-line">
                                    <label class="control-label">Direcci&oacute;n: <span style="color: red;">*</span></label>
                                    <textarea name="direccion" class="form-control no-resize" required="" ></textarea>
                                </div>
                            </div>
                        </div>                   

                    </div>
                    <ul class="nav nav-tabs">
                        <li ><a data-toggle="tab" href="#"><b>Datos de la Radiograf&iacute;a</b></a></li>

                    </ul><br>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="input-group">
                                <div class="form-line">
                                    <label class="control-label">Tipo de Radiograf&iacute;a:  <span style="color: red;">*</span></label>
                                    <select onchange="cargar_select(this.value); calcular_descuento();" id="tipo_radiografia" class="form-control show-tick" name="tipo_radiografia" required="">
                                        <option value="">Seleccione...</option>
                                        <%  for (Radiografia rad : registros_r) {%>
                                        <option value="<%= rad.getId()%>"><%= rad.getNombre()%></option>
                                        <%}%>
                                    </select>

                                </div>
                            </div>
                        </div>
                        <div id="cargando" style="position: absolute; text-align: center; top: 300px;  width: 100%;display:none;"></div>
                        <div class="cargarselect"></div>
                        <div class="col-md-4">
                            <div class="input-group">
                                <div class="form-line">
                                    <label class="control-label">Radi&oacute;logo Atiende:  <span style="color: red;">*</span></label>
                                    <select  class="form-control show-tick" name="radiologo" required="">
                                        <option value="">Seleccione...</option>
                                        <%  for (Radiologo radio : registros_radio) {%>
                                        <option value="<%= radio.getId()%>"><%= radio.getNombre() + " " + radio.getApellido()%></option>
                                        <%}%>
                                    </select>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                         <div class="col-md-4">
                            <div class="input-group">
                                <div class="form-line">
                                    <label class="control-label">Descuento: $ <span style="color: red;">*</span></label>
                                    <input autofocus="" type="text" readonly="" name="descuento" id="descuento" value="0.0"  min="0" data-inputmask="'alias': 'numeric', 'autoGroup': true, 'digits': 2, 'digitsOptional': false, 'placeholder': '0'" placeholder="0.00"  class="form-control precios" required="">
                                </div>
                            </div>
                        </div>
                         <div class="col-md-4">
                            <div class="input-group">
                                <div class="form-line">
                                    <label class="control-label">Total Sin Descuento: $ <span style="color: red;">*</span></label>
                                    <input autofocus="" type="text" readonly="" name="total" id="total" value="0.0"  min="0" name="precio" data-inputmask="'alias': 'numeric', 'autoGroup': true, 'digits': 2, 'digitsOptional': false, 'placeholder': '0'" placeholder="0.00"  class="form-control precios" required="">
                                </div>
                            </div>
                        </div>
                           <div class="col-md-4">
                            <div class="input-group">
                                <div class="form-line">
                                    <label class="control-label">Total a Pagar: $ <span style="color: red;">*</span></label>
                                    <input autofocus="" type="text" readonly="" name="totalpago" id="totalpago" value="0.0"  min="0" name="precio" data-inputmask="'alias': 'numeric', 'autoGroup': true, 'digits': 2, 'digitsOptional': false, 'placeholder': '0'" placeholder="0.00"  class="form-control precios" required="">
                                </div>
                            </div>
                        </div>
                    </div>

                    <hr>



                    <div class="modal-footer">
                        <button type="button" class="btn btn-default waves-effect" data-dismiss="modal"><span class="fa fa-close"></span> Cerrar</button>
                        <button type="submit" class="btn btn-success waves-effect"><span class="fa fa-save"></span> Guardar</button>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>

<script>
    function imprimirSeleccion(titulo, nombre) {

        var w = 900;
        var h = 460;
        var left = (screen.width / 2) - (w / 2);
        var top = 130;
        var ficha = document.getElementById(nombre);
        var ventimp = window.open('', '', "status = 1, height = " + h + ", width = " + w + ", resizable = 0, top = " + top + ", left = " + left);
        ventimp.document.write("<title>" + titulo + "</title>");
        ventimp.document.write(ficha.innerHTML);
        ventimp.document.close();
        ventimp.print( );
        ventimp.close();
    }
</script>