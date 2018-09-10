<%-- 
    Document   : loginUsuario
    Created on : 10-09-2018, 16:51:18
    Author     : Artiko1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="procesoUsuario" method="GET">
            <input type="text" name="txtNombreUsuario" value="" placeholder="nombre usuario"/>
            <input type="password" name="txtPassword" value="" placeholder="contraseña"/>
            <input type="submit" value="ingresar" name="btnAccion" />
        </form>
    </body>
</html>
