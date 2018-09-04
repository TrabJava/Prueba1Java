<%-- 
    Document   : login
    Created on : 04-sep-2018, 13:23:49
    Author     : Duoc
--%>

<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>

    <head>
        <title>Gaming Login Form Responsive Widget Template  :: w3layouts</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Gaming Login Form Widget Tab Form,Login Forms,Sign up Forms,Registration Forms,News letter Forms,Elements"/>
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <link href="../../login/css/style.css" rel="stylesheet" type="text/css" media="all" />
    </head>
    <body>
        <div class="padding-all">
            <div class="header">
                <h1><img src="./images/5.png" alt=" "> Gaming Login Form</h1>
            </div>

            <div class="design-w3l">
                <div class="mail-form-agile">
                    <form action="#" method="post">
                        <input type="text" name="txtNombre" placeholder="Ingrese Nombre" required=""/>
                        <input type="text" name="txtContrasenia" placeholder="Ingrese Nombre" required=""/>
                        <%--Se debe agregar un tipo usuario en este caso un Administrador (con hidden)--%>
                        <select id ="idTipo_estado">
                            <option value = "1">Activo</option>
                            <option value = "2"> Desactivo </option>
                        </select>
                        <br>
                        <input type="submit" value="Registrar" id="btnAgregar" class="btnAgregar">
                    </form>
                </div>
                <div class="clear"> </div>
            </div>

            <div class="footer">
                <p>? 2017 Gaming Login form. All Rights Reserved | Design by  <a href="https://w3layouts.com/" >  w3layouts </a></p>
            </div>
        </div>
    </body>
</html>
