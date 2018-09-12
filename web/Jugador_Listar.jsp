<%-- 
    Document   : Jugador_Listar
    Created on : 12-09-2018, 13:16:58
    Author     : Artiko1
--%>

<%@page import="modelo.dao.JugadorDAO"%>
<%@page import="modelo.dto.Jugador"%>
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
                           JugadorDAO dao = new JugadorDAO();
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
                        for (Jugador aux: dao.listarTodo()) {
                        %>
                        <tr>
                            <td><%= aux.getRutJugador()%></td>
                            <td><%= aux.getNombreJugador()%></td>
                            <td><%= aux.getApellidoJugador()%></td>
                            <td><%= aux.getEquipo().getNombreEquipo() %></td>
                            <td><%= aux.getTitular().getDescripcionTitular()%></td>
                            
                        </tr>
                        <% } %>
                    </table>
                    <% } %>
    </body>
</html>
