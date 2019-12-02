<%-- 
    Document   : index
    Created on : Nov 19, 2019, 1:27:07 PM
    Author     : DARWINFLORES
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .button {
  display: inline-block;
  border-radius: 4px;
  background-color: #f4511e;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 28px;
  padding: 20px;
  width: 800px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
}
.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}
.button span:after {
content: '\00bb';  /* Entidades CSS. Para usar entidades HTML, use &#8594;*/
position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}
.button:hover span {
  padding-right: 25px;
}
.button:hover span:after {
  opacity: 1;
  right: 0;
}
        </style>
    </head>
    <body bgcolor="#E2F5F8 ">
         <font color= "#A065F7 "
        <font  SIZE=7 FACE="roman">BIENVENIDOS</font>
         </font><br><br>
         <button class="button" onclick="window.location = 'principal/'">Menu Principal</button><br>
          <font color= "#CF4118 "
                <font SIZE=6 FACE="roman">Estudiantes de ingeniería en sistemas informáticos  Grupo#16</font><br>
          <font color= "#872C11 "
         <font SIZE=6 FACE="roman">Materia: Programacíon III </font>
         
         </font>
        <div id="coordinador">
          <img src="imagenes/darwin.png"/>
           <font color= "#5D2B19"
           <font SIZE=5 FACE="roman">Darwin Alfonso Flores Colindres - FC17048 (Coordinador)</font>
            
            </font>
          </div>
         <div id="compañero">
          <img src="imagenes/antonio.jpg"/>
           <font color= "#5D2B19 "
           <font  SIZE=5 FACE="roman">Pedro Antonio Rivas Castillo RC17068</font>
           </font>
          </div>
         
    </body>
</html>
