<%-- 
    Document   : Administrador_Listar
    Created on : 11-09-2018, 18:38:16
    Author     : Berni
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="modelo.dto.Usuario"%>
<%@page import="modelo.dao.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <title>Listar Administradores</title>
    </head>
    <body>
        <c:choose>  
            <c:when test="${usuario == null}">
                <div class="background"></div>
                <div class="content">               
                    <h1>Tiene que iniciar sesión primero</h1>
                    <h3><a href="login.jsp">(Iniciar Sesión)</a></h3>              
                </div>
            </c:when>
            <c:when test="${tipo != 1}">
                <div class="background"></div>
                <div class="content">               
                    <h1>No tiene acceso de ingresar a otra sesión por medio de url</h1>
                    <h3><a href="login.jsp">(Volver al Login)</a></h3>              
                </div>
            </c:when>
            <c:when test="${usuario != null}">
                <jsp:include page="Vistas/Menu/menuSuperUsuario.jsp"></jsp:include>

                    <div class="container">
                        <div class="row">

                            <div class="col-lg-1">         
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
                            <form action="../procesoUsuario" method="GET">
                               
                                    <table class="table table-bordered table-striped ">
                                        <tr>

                                            <th>ID USUARIO</th>
                                            <th>NOMBRE USUARIO</th>
                                            <th>CONTRASEÑA</th>
                                            <th>ID TIPO USUARIO</th>
                                            <th>ID ESTADO USUARIO</th>
                                        </tr>
                                        <%
                                            for (Usuario aux : dao.listarTodo()) {
                                        %>
                                       
                                            <tr class="info">     
                                                <td><input name="txtId" type="text" readonly="" value="<%= aux.getIdUsuario()%>"></td>
                                                <td><input name="txtNombreUsuario" type="text" readonly="" value="<%= aux.getNombreUsuario()%>"></td>
                                                <td><input name="txtPassword" type="text" readonly="" value="<%= aux.getContrasenia()%>"></td>
                                                <td><input name="txtDescripcionTipoUsuario" type="text" readonly="" value="<%= aux.getTipoUsuario().getDescripcionTipoUsuario()%>"></td>
                                                <td><input name="txtDescripcionEstadoUsuario" type="text" readonly="" value="<%= aux.getEstadoUsuario().getDescripcionEstadoUsuario()%>"></td>
                                                <td><a href="Administrador_Modificar.jsp?id=<%= aux.getIdUsuario()%>"class="btn btn-primary" id="url"/>Modificar</td>
                                                <td><a href="Administrador_Listar.jsp?id=<%= aux.getIdUsuario()%>"class="btn btn-primary" id="url"/>Desactivar</td>

                                            </tr>
                                        <% } %>
                                    </table>

                            </form> 
                            <% }%>

                        </div>
                        <div class="col-lg-3">

                        </div>
                        </form>

                    </div>

                </div>
            </c:when>
            <c:otherwise>
            </c:otherwise>
        </c:choose>
    </body>
</html>
