<%-- 
    Document   : Jugador_Listar
    Created on : 12-09-2018, 13:16:58
    Author     : Artiko1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            //CONECTANOD A LA BASE DE DATOS:
            Connection con;
            String url = "jdbc:mysql://localhost:3306/liga_nos_vamos";
            String Driver = "com.mysql.jdbc.Driver";
            String user = "root";
            String clave = "";
            Class.forName(Driver);
            con = DriverManager.getConnection(url, user, clave);
            //Emnpezamos Listando los Datos de la Tabla Usuario pero de la fila seleccionada
            PreparedStatement ps;
            ResultSet rs;
            String id = request.getParameter("id");
            ps = con.prepareStatement("select * from jugador where id_equipo=" + id);
            rs = ps.executeQuery();
            while (rs.next()) {
        %>
        <div class="container">
            <h1>Jugadores del Equipo: <%= rs.getString("id_equipo")%></h1>
            <hr>
            <form action="procesoJugador" method="GET" class="form-control" style="width: 500px; height: 400px">
                RUT:
                <input type="text" readonly="" name="txtRut" class="form-control" value="<%= rs.getString("rut_jugador")%>"/>
                Nombre:
                <input type="text" name="txtNombreJugador" class="form-control" value="<%= rs.getString("nombre_jugador")%>"/><br>

                Apellido:
                <input type="text" name="txtApellidoJugador" class="form-control" value="<%= rs.getString("apellido_jugador")%>"/>
                 
                Equipo:
                <input type="text" name="txtEquipo" readonly="" class="form-control" value="<%= rs.getInt("id_equipo")%>"/>
                 
                <br>
                    <a href="Jugador_Modificar.jsp?id=<%= rs.getString("rut_jugador")%>" id="url">Modificar</a>
                    <input type="submit" name="btnAccion" value="Eliminar">

                <a href="Equipo_Listar.jsp">Regresar</a>
            </form>
            <%}%>
        </div>
    </body>
</html>