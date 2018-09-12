<%-- 
    Document   : Equipo_Modificar
    Created on : 12-09-2018, 17:24:10
    Author     : Artiko1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
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
            ps = con.prepareStatement("select * from equipo where id_equipo=" + id);
            rs = ps.executeQuery();
            
            PreparedStatement pre;
            ResultSet rset;
            pre = con.prepareStatement("select * from liga");
            rset = pre.executeQuery();
            while (rs.next()) {
        %>
        <div class="container">
            <h1>Modificar Registro</h1>
            <hr>
            <form action="procesoJugador" method="GET" class="form-control" style="width: 500px; height: 400px">
                ID Equipo:
                <input type="text" readonly="" name="txtIdEquipo" class="form-control" value="<%= rs.getString("id_equipo")%>"/>
                Nombre Equipo:
                <input type="text" name="txtNombreEquipo" class="form-control" value="<%= rs.getString("nombre_equipo")%>"/><br>
 
                Liga:
                <select name="cboLiga" >
                                <%
                                   while (rset.next()) {%>
                                    <option value="<%= rset.getInt("id_liga")%>"><%= rset.getString("descripcion_liga")%></option>
                                            <%}
                                %>
                            </select>
               
                <br>
                <input type="submit" value="Modificar" name="btnAccion" class="btn btn-primary btn-lg"/>

                <a href="index.jsp">Regresar</a>
            </form>
            <%}%>
        </div>
    </body>
</html>

