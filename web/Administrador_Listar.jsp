<%-- 
    Document   : Administrador_Listar
    Created on : 11-09-2018, 18:38:16
    Author     : Berni
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="modelo.dto.Usuario"%>
<%@page import="modelo.dao.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
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
        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
                           url = "jdbc:mysql://localhost:3306/liga_nos_vamos?zeroDateTimeBehavior=convertToNull"
                           user = "root"  password = ""/>
        <sql:query dataSource = "${snapshot}" var = "admin">
            SELECT * FROM usuario JOIN tipo_usuario ON usuario.id_tipo_usuario=tipo_usuario.id_tipo_usuario JOIN estado_usuario ON usuario.id_estado_usuario = estado_usuario.id_estado_usuario  WHERE usuario.id_tipo_usuario=2  ;
        </sql:query>
       
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
                            

                                <table class="table table-bordered table-striped ">

                                    <tr>

                                        <th>ID USUARIO</th>
                                        <th>NOMBRE USUARIO</th>
                                        <th>CONTRASEÑA</th>
                                        <th>ID TIPO USUARIO</th>
                                        <th>ID ESTADO USUARIO</th>
                                    </tr>

                                       
                                    <c:forEach var = "row" items = "${admin.rows}">
                                        <form action="procesoUsuario" method="GET">
                                        <tr class="info">  
                                            <td><input name="txtId" type="text" readonly="" value="${row.id_usuario}"></td>
                                            <td><input name="txtNombreUsuario" type="text" readonly="" value="${row.nombre_usuario}"></td>
                                            <td><input name="txtPassword" type="text" readonly="" value="${row.contrasenia}"></td>
                                            <td><input name="txtDescripcionTipoUsuario" type="text" readonly="" value="${row.descripcion_tipo_usuario}"</td>
                                            <td><input name="txtDescripcionEstadoUsuario" type="text" readonly="" value="${row.descripcion_estado_usuario}"></td>
                                            <td><a href="Administrador_Modificar.jsp?id=${row.id_usuario}"class="btn btn-primary" id="url"/>Modificar</td>
                                            <td><input type="submit" name="btnAccion" value="Desactivar" class="btn btn-primary"></td>
                                            
                                        </tr>
                                        </form>
                                    </c:forEach>
                                    

                                </table>

                            
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
