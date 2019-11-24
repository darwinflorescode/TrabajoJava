<%-- 
    Document   : modales
    Created on : Nov 20, 2019, 2:22:28 PM
    Author     : DARWINFLORES
--%>


<div id="modal" class="modal fade" style="display: none;">
    <div class="modal-dialog  modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-green">
                <button type="button" class="close" data-dismiss="modal">×</button>
                <h5 class="modal-title"><i class="fa fa-plus"></i> Agrega Datos de Radiólogo</h5>
                <br>
            </div>
            <div class="modal-body">
                <form class="formNormal" id="formulario" autocomplete="off" method="POST" action="../GuardarRadiologo" >

                    <h4>Nuevo <span class="fa fa-users"></span></h4>
                    <hr>
                    <fieldset>
                        <br>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="input-group">
                                    <div class="form-line">
                                        <label class="control-label">Nombres: <span style="color:red">*</span></label>
                                        <input autofocus="" type="text" name="nombres" minlength="3" maxlength="50"  class="form-control" required="">
                                    </div>
                                </div>
                            </div>
                            
                              <div class="col-md-6">
                                <div class="input-group">
                                    <div class="form-line">
                                        <label class="control-label">Apellidos: <span style="color:red">*</span></label>
                                        <input type="text"  name="apellidos" minlength="3" maxlength="50" class="form-control precios" required="">
                                    </div>
                                </div>
                            </div>                         

                        </div>

                        <hr>
                    </fieldset>


                    <div class="modal-footer">
                        <button type="button" class="btn btn-default waves-effect" data-dismiss="modal"><span class="fa fa-close"></span> Cerrar</button>
                        <button type="submit" class="btn btn-success waves-effect"><span class="fa fa-save"></span> Guardar</button>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>




