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
                        <form action="procesoJugador" method="GET">
                            <td><input type="text" name="txtRut" readonly="" value="<%= aux.getRutJugador()%>"></td>
                            <td><input type="text" name="txtNombreJugador" readonly=""  value="<%= aux.getNombreJugador()%>"></td>
                            <td><input type="text" name="txtApellidoJugador" readonly=""  value="<%= aux.getApellidoJugador()%>"></td>
                            <td><input type="text" name="txtNombreEquipo" readonly=""  value="<%= aux.getEquipo().getNombreEquipo() %>"></td>
                            <td><input type="text" name="txtNombreTitular" readonly=""  value="<%= aux.getTitular().getDescripcionTitular()%>"></td>
                            <td><a href="Jugador_Modificar.jsp?id=<%= aux.getRutJugador()%>" id="url">Modificar</a></td>
                            <td><input type="submit" name="btnAccion" value="Eliminar"></td>
                        </form>
                            
                        </tr>
                        <% } %>
                    </table>
                    <% } %>
    </body>
</html>
