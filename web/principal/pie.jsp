<%-- 
    Document   : pie
    Created on : Nov 19, 2019, 1:29:44 PM
    Author     : DARWINFLORES
--%>




<%     if (request.getParameter("g") != null && !request.getParameter("g").isEmpty()) { //Verificar que el parametro venga lleno
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



  



<%}else if (request.getParameter("g").equals("eliminado")) {
        %>
<script>
    $(document).ready(function () {
        $('#add-brand-messages').html('<div class="alert alert-danger">' +
                '<button type="button" class="close" data-dismiss="alert">&times;</button>' +
                '<strong><i class="fa fa-check"></i></strong> Datos Eliminados Correctamente</div>');
        

        window.setTimeout(function () {
            $(".alert-danger").fadeTo(500, 0).slideUp(500, function () {
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

<script>
       function soloLetras(e) {
    tecla = (document.all) ? e.keyCode : e.which;
    if (tecla == 8)
        return true; // backspace
    if (tecla == 32)
        return true; // espacio
    if (e.ctrlKey && tecla == 86) {
        return true;
    } //Ctrl v
    if (e.ctrlKey && tecla == 67) {
        return true;
    } //Ctrl c
    if (e.ctrlKey && tecla == 88) {
        return true;
    } //Ctrl x
    if (tecla >= 96 && tecla <= 105) {
        return true;
    } //numpad
    
    patron = /^[a-zA-z\s\ñ\Ñ\Á\É\Í\Ó\Ú\á\é\í\ó\ú]+$/; //patron

    te = String.fromCharCode(tecla);
    return patron.test(te); // prueba de patron
}

       $(document).ready(function(){
        $(".precios").inputmask();
      });
      
 
    </script>
   
<div class="footer-wrap">
    <div class="footer-bar">
        <p>
            <span class="copyright">

                <a href="#">
                    <img src="../imagenes/ues.png" style="width: 35px;"  >
                </a>
            </span>
            <span class="powered-by">

                <a href="#">
                    <b><span class="fa fa-copyright"></span> UNIVERSIDAD DE EL SALVADOR - <% java.util.Calendar fecha = java.util.Calendar.getInstance();
                        out.println(fecha.get(java.util.Calendar.YEAR));%>  - Desarrolladores</b>
                </a>
             
            
            </span>
        </p>
    </div>
</div>

</body>
</html>
