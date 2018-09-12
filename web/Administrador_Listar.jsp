<%-- 
    Document   : Administrador_Listar
    Created on : 11-09-2018, 18:38:16
    Author     : Berni
--%>

<%@page import="modelo.dto.Usuario"%>
<%@page import="modelo.dao.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
        <meta charset="utf-8" />
        <meta name="author" content="Script Tutorials" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="js/jsMenus/Menus.css" rel="stylesheet" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.2.0.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="Vistas/Menu/menuSuperUsuario.jsp"></jsp:include>

            <div class="container">
                <div class="row">
                    <form action="procesoUsuario" method="GET">
                        <div class="col-lg-1">         

                            <div class="form-group text-center">
                                <input type="submit" name="btnAccion" value="Listar" class="btn btn-info"/>
                            </div>

                        </div>
                        <div class="col-lg-4">

                            <br>
                        <%
                            HttpSession sesion = request.getSession();
                            if (sesion.getAttribute("usuario") == null) {
                                out.println("No Existen Datos");
                            } else {
                                UsuarioDAO dao = new UsuarioDAO();
                        %>
                        <table class="table table-bordered table-striped ">
                            <tr>
                                <th>ID USUARIO</th>
                                <th>NOMBRE USUARIO</th>
                                <th>CONTRASEÑA</th>
                                <th>ID TIPO USUARIO</th>
                                <th>ID ESTADO USUARIO</th>
                            </tr>
                            <%
                                for (Usuario aux : dao.listarTodo(dao)) {
                            %>
                            <tr>
                                <td><imput type="text" value="txtId"></imput><%= aux.getIdUsuario()%></td>
                            <td><%= aux.getNombreUsuario()%></td>
                            <td><%= aux.getContrasenia()%></td>
                            <td><%= aux.getTipoUsuario()%></td>
                            <td><%= aux.getEstadoUsuario()%></td>
                            <td><input type="submit" name="btnAccion" value="Modificar" class="btn btn-primary" /></td>
                            <td><input type="submit" name="btnAccion" value="Desactivar" class="btn btn-primary" /></td>

                            </tr>
                            <% } %>
                        </table>
                        <% }%>
                    </div>
                    <div class="col-lg-3">

                    </div>
                </form>
                ${msjOK}
                ${msjNO}
            </div>

        </div>



    </body>
</html>
