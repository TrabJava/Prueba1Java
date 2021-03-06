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

        <link href="login/css/style.css" rel="stylesheet" type="text/css" media="all" />
    </head>

    <body>
        <div class="padding-all">
            <div class="header">
                <h1><img src="login/images/5.png" alt=" "> Login de usuario</h1>
            </div>

            <div class="design-w3l">
                <div class="mail-form-agile">
                    <form action="procesoAcceso" method="GET">
                        <input type="text" name="txtNombreUsuario" placeholder="ingrese su nombre de usuario" required=""/>
                        <input type="password"  name="txtPassword" class="padding" placeholder="ingrese su contraseña" required=""/>
                        <input type="submit" name="btnAccion" value="ingresar">
                    </form>
                    ${msjOK}
                    ${msjNO}
                </div>
                <div class="clear"> </div>
            </div>
            <div class="footer">
                <p>© 2017 Gaming Login form. All Rights Reserved | Design by  <a href="https://w3layouts.com/" >  w3layouts </a></p>
            </div>
        </div>
    </body>
</html>
