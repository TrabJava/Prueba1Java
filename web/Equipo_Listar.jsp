<%-- 
    Document   : Equipo_Listar
    Created on : 12-09-2018, 16:42:09
    Author     : Artiko1
--%>



<%@page import="modelo.dto.Equipo"%>
<%@page import="modelo.dao.equipoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
                        HttpSession sesion = request.getSession();
                        if ( sesion.getAttribute("usuario") == null ) {
                            out.println("No Existen Datos");
                        } else {
                           equipoDAO dao = new equipoDAO();
                    %>
         <table class="table table-bordered table-striped">
                        <tr>
                            <th>Rut Jugador</th>
                            <th>Nombre Jugador</th>
                            <th>Apellido Jugador</th>
                            <th>Nombre del Equipo</th>
                            <th>Titular</th>
                        </tr>
                        <% 
                        for (Equipo aux: dao.listarTodo()) {
                        %>
                        <tr>
                        <form action="procesoEquipo" method="GET">
                            <td><input type="text" name="txtIdEquipo" readonly="" value="<%= aux.getIdEquipo()%>"></td>
                            <td><input type="text" name="txtNombreEquipo" readonly="" value="<%= aux.getNombreEquipo()%>"></td>
                            <td><input type="text" name="txtNombreLiga" readonly=""  value="<%= aux.getLiga().getDescripcionLiga()%>"></td>
                            <td><input type="text" name="txtNombreUsuario" readonly=""  value="<%= aux.getUsuario().getNombreUsuario()%>"></td>
                            <td><a href="Equipo_Modificar.jsp?id=<%= aux.getIdEquipo()%>">Modificar Equipo</a></td>
                             <td><a href="Jugador_Listar.jsp?id=<%= aux.getIdEquipo()%>" id="url">Ver Jugadores</a></td>
                             <td><input type="submit" name="btnAccion" value="Eliminar"></td>
                        </form>
                            
                        </tr>
                        <% } %>
                    </table>
                    <% } %>
    </body>
</html>
