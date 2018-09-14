<%-- 
    Document   : Jugador_Modificar
    Created on : 12-09-2018, 13:39:32
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
            ps = con.prepareStatement("select * from jugador where rut_jugador=" + id);
            rs = ps.executeQuery();

            PreparedStatement pre;
            ResultSet rset;
            pre = con.prepareStatement("select * from titular");
            rset = pre.executeQuery();
            while (rs.next()) {
        %>
        <c:choose>  
            <c:when test="${usuario == null }">
                <div class="background"></div>
                <div class="content">               
                    <h1>Tiene que iniciar sesión primero</h1>
                    <h3><a href="login.jsp">(Iniciar Sesión)</a></h3>              
                </div>
            </c:when>
            <c:when test="${tipo != 2 && tipo !=1}">
                <div class="background"></div>
                <div class="content">               
                    <h1>No tiene acceso de ingresar a otra sesión por medio de url</h1>
                    <h3><a href="login.jsp">(Volver al Login)</a></h3>              
                </div>
            </c:when>
            <c:when test="${tipo == 1 && usuario!=null}">
                <jsp:include page="Vistas/Menu/menuSuperUsuario.jsp"></jsp:include>
                <div class="container">
                <h1>Modificar Jugador <strong><%= rs.getString("nombre_jugador")%></strong> </h1>
                <hr>
                <form action="procesoJugador" method="GET" class="form-control" style="width: 500px; height: 400px">
                    RUT:
                    <input type="text" readonly="" name="txtRut" class="form-control" value="<%= rs.getString("rut_jugador")%>"/>
                    Nombre:
                    <input type="text" name="txtNombreJugador" class="form-control" value="<%= rs.getString("nombre_jugador")%>"/>

                    Apellido:
                    <input type="text" name="txtApellidoJugador" class="form-control" value="<%= rs.getString("apellido_jugador")%>"/>

                    Equipo:
                    <input type="text" name="txtEquipo" readonly="" class="form-control" value="<%= rs.getInt("id_equipo")%>"/>
                    <br>
                    Titular:
                    <select name="cboTitular" >
                        <%
                                    while (rset.next()) {%>
                        <option value="<%= rset.getInt("id_titular")%>"><%= rset.getString("descripcion_titular")%></option>
                        <%}
                        %>
                    </select>

                    <br>
                    <br>
                    <input type="submit" value="Modificar" name="btnAccion" class="btn btn-primary"/>

                    <a href="Equipo_Listar.jsp" class="btn btn-success">Regresar</a>
                </form>

            </div>
            </c:when>
            <c:when test="${tipo == 2 && usuario!=null && estado !=1}">
                <jsp:include page="Vistas/Menu/menuAdministrador.jsp"></jsp:include>
                <div class="container">
                <h1>Modificar Jugador <strong><%= rs.getString("nombre_jugador")%></strong> </h1>
                <hr>
                <form action="procesoJugador" method="GET" class="form-control" style="width: 500px; height: 400px">
                    RUT:
                    <input type="text" readonly="" name="txtRut" class="form-control" value="<%= rs.getString("rut_jugador")%>"/>
                    Nombre:
                    <input type="text" name="txtNombreJugador" class="form-control" value="<%= rs.getString("nombre_jugador")%>"/>

                    Apellido:
                    <input type="text" name="txtApellidoJugador" class="form-control" value="<%= rs.getString("apellido_jugador")%>"/>

                    Equipo:
                    <input type="text" name="txtEquipo" readonly="" class="form-control" value="<%= rs.getInt("id_equipo")%>"/>
                    <br>
                    Titular:
                    <select name="cboTitular" >
                        <%
                                    while (rset.next()) {%>
                        <option value="<%= rset.getInt("id_titular")%>"><%= rset.getString("descripcion_titular")%></option>
                        <%}
                        %>
                    </select>

                    <br>
                    <br>
                    <input type="submit" value="Modificar" name="btnAccion" class="btn btn-primary"/>

                    <a href="Equipo_Listar.jsp" class="btn btn-success">Regresar</a>
                </form>

            </div>
            </c:when>
            
            <c:otherwise>
            </c:otherwise>
        </c:choose>
        <%}%>
    </body>
</html>
