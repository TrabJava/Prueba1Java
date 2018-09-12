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
                        <form action="procesoJugador" method="GET">
                            <td><input type="text" name="txtRut" readonly="" value="<%= aux.getNombreEquipo()%>"></td>
                            <td><input type="text" name="txtNombreJugador" readonly=""  value="<%= aux.getLiga().getDescripcionLiga()%>"></td>
                            
                           
                             <td><a href="Jugador_Listar.jsp?id=<%= aux.getIdEquipo()%>" id="url">Ver Jugadores</a></td>
                              
                        </form>
                            
                        </tr>
                        <% } %>
                    </table>
                    <% } %>
    </body>
</html>
