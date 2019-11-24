<%-- 
    Document   : pie
    Created on : Nov 19, 2019, 1:29:44 PM
    Author     : DARWINFLORES
--%>

<script>
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

