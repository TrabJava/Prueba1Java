<%-- 
    Document   : Equipo_Listar
    Created on : 12-09-2018, 16:42:09
    Author     : Artiko1
--%>



<%@page import="modelo.dto.Equipo"%>
<%@page import="modelo.dao.equipoDAO"%>
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
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.2.0.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="js/jsMenus/Menus.css" rel="stylesheet" type="text/css" />
        <title>JSP Page</title>
    </head>
    <body>
        

        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("usuario") == null) {
                out.println("No Existen Datos");
            } else {
                equipoDAO dao = new equipoDAO();
        %>
    <c:choose>  
        <c:when test="${usuario == null }">
            <div class="background"></div>
            <div class="content">               
                <h1>Tiene que iniciar sesión primero</h1>
                <h3><a href="login.jsp">(Iniciar Sesión)</a></h3>              
            </div>
        </c:when>
        <c:when test="${tipo != 2 && tipo !=1 && estado !=1}">
            <div class="background"></div>
            <div class="content">               
                <h1>No tiene acceso de ingresar a otra sesión por medio de url</h1>
                <h3><a href="login.jsp">(Volver al Login)</a></h3>              
            </div>
        </c:when>
        <c:when test="${tipo == 1 && usuario!=null}">
            <jsp:include page="Vistas/Menu/menuSuperUsuario.jsp"></jsp:include>
                <form action="procesoEquipo" method="GET">    
                    <table class="table table-bordered table-striped">
                        <tr>
                            <th>Rut Jugador</th>
                            <th>Nombre Jugador</th>
                            <th>Apellido Jugador</th>
                            <th>Nombre del Equipo</th>
                            <th>Titular</th>
                        </tr>
                    <%
                        for (Equipo aux : dao.listarTodo()) {
                    %>
                    <tr class="info">

                        <td><input type="text" name="txtIdEquipo" readonly="" class="form-control" value="<%= aux.getIdEquipo()%>"></td>
                        <td><input type="text" name="txtNombreEquipo" readonly="" class="form-control" value="<%= aux.getNombreEquipo()%>"></td>
                        <td><input type="text" name="txtNombreLiga" readonly="" class="form-control"  value="<%= aux.getLiga().getDescripcionLiga()%>"></td>
                        <td><input type="text" name="txtNombreUsuario" readonly="" class="form-control"  value="<%= aux.getUsuario().getNombreUsuario()%>"></td>
                        <td><a href="Equipo_Modificar.jsp?id=<%= aux.getIdEquipo()%>" class="btn btn-info">Modificar Equipo</a></td>
                        <td><a href="Jugador_Listar.jsp?id=<%= aux.getIdEquipo()%>" id="url" class="btn btn-success">Ver Jugadores</a></td>
                        <td><input type="submit" name="btnAccion" value="Eliminar" class="btn btn-danger"></td>


                    </tr>
                   
                </table>
                         <% } %>
            </form>
        </c:when>
        <c:when test="${tipo == 2 && usuario!=null && estado ==1}">
            <jsp:include page="Vistas/Menu/menuAdministrador.jsp"></jsp:include>
                <form action="procesoEquipo" method="GET">
                    <table class="table table-bordered table-striped">
                        <tr>
                            <th>Rut Jugador</th>
                            <th>Nombre Jugador</th>
                            <th>Apellido Jugador</th>
                            <th>Nombre del Equipo</th>
                            <th>Titular</th>
                        </tr>
                    <%
                        for (Equipo aux : dao.listarTodo()) {
                    %>
                    <tr class="info">

                        <td><input type="text" name="txtIdEquipo" readonly="" class="form-control" value="<%= aux.getIdEquipo()%>"></td>
                        <td><input type="text" name="txtNombreEquipo" readonly="" class="form-control" value="<%= aux.getNombreEquipo()%>"></td>
                        <td><input type="text" name="txtNombreLiga" readonly="" class="form-control"  value="<%= aux.getLiga().getDescripcionLiga()%>"></td>
                        <td><input type="text" name="txtNombreUsuario" readonly="" class="form-control"  value="<%= aux.getUsuario().getNombreUsuario()%>"></td>
                        <td><a href="Equipo_Modificar.jsp?id=<%= aux.getIdEquipo()%>" class="btn btn-info">Modificar Equipo</a></td>
                        <td><a href="Jugador_Listar.jsp?id=<%= aux.getIdEquipo()%>" id="url" class="btn btn-success">Ver Jugadores</a></td>
                        <td><input type="submit" name="btnAccion" value="Eliminar" class="btn btn-danger"></td>


                    </tr>
                   
                </table>
                         <% } %>
            </form>
            
        </c:when>
        <c:otherwise>
        </c:otherwise>
    </c:choose>
<% }%>
</body>
</html>
