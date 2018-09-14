<%-- 
    Document   : Jugador_Listar
    Created on : 12-09-2018, 13:16:58
    Author     : Artiko1
--%>

<%@page import="modelo.dao.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@page import="java.sql.*"%>
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
            ps = con.prepareStatement("select * from jugador j JOIN equipo e ON j.id_equipo=e.id_equipo JOIN titular t ON t.id_titular=j.id_titular where j.id_equipo=" + id);
            rs = ps.executeQuery();
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
            <c:when test="${tipo != 2 && tipo !=1 && estado !=1}">
                <div class="background"></div>
                <div class="content">               
                    <h1>No tiene acceso de ingresar a otra sesión por medio de url</h1>
                    <h3><a href="login.jsp">(Volver al Login)</a></h3>              
                </div>
            </c:when>
            <c:when test="${tipo == 1 && usuario!=null}">
                <jsp:include page="Vistas/Menu/menuSuperUsuario.jsp"></jsp:include>
                    <form action="procesoJugador" method="GET" >
                        <table class="table table-bordered table-striped ">

                            <tr>

                                <th>RUT JUGADOR</th>
                                <th>NOMBRE JUGADOR</th>
                                <th>APELLIDO JUGADOR</th>
                                <th>NOMBRE DEL EQUIPO</th>
                                <th>TITULAR</th>
                            </tr>

                            <h1>Jugadores del Equipo: <%= rs.getString("nombre_equipo")%></h1>

                        
                        <tr class="info">  
                            <td><input type="text" readonly="" name="txtRut" class="form-control" value="<%= rs.getString("rut_jugador")%>"/></td>
                            <td><input type="text" name="txtNombreJugador" class="form-control" value="<%= rs.getString("nombre_jugador")%>"/></td>
                            <td><input type="text" name="txtApellidoJugador" class="form-control" value="<%= rs.getString("apellido_jugador")%>"/></td>
                            <td><input type="text" name="txtEquipo" readonly="" class="form-control" value="<%= rs.getString("nombre_equipo")%>"/></td>
                            <td><input type="text" name="txtEquipo" readonly="" class="form-control" value="<%= rs.getString("descripcion_titular")%>"/></td>
                            <td><a href="Jugador_Modificar.jsp?id=<%= rs.getString("rut_jugador")%>" class="btn btn-info" id="url">Modificar</a></td>
                            <td><input type="submit" name="btnAccion" value="Eliminar" class="btn btn-danger"></td>
                            <td><a href="Equipo_Listar.jsp" class="btn btn-success">Regresar</a></td>
                        </tr>



                    </table>
                </form>


                <div class="col-lg-3">

                </div>
            </c:when>
            <c:when test="${tipo == 2 && usuario!=null && estado ==1}">
                <jsp:include page="Vistas/Menu/menuAdministrador.jsp"></jsp:include>
                    <form action="procesoJugador" method="GET" >
                        <table class="table table-bordered table-striped ">

                            <tr>

                                <th>RUT JUGADOR</th>
                                <th>NOMBRE JUGADOR</th>
                                <th>APELLIDO JUGADOR</th>
                                <th>NOMBRE DEL EQUIPO</th>
                                <th>TITULAR</th>
                            </tr>

                            <h1>Jugadores del Equipo: <%= rs.getString("nombre_equipo")%></h1>


                        <tr class="info">  
                            <td><input type="text" readonly="" name="txtRut" class="form-control" value="<%= rs.getString("rut_jugador")%>"/></td>
                            <td><input type="text" name="txtNombreJugador" class="form-control" value="<%= rs.getString("nombre_jugador")%>"/></td>
                            <td><input type="text" name="txtApellidoJugador" class="form-control" value="<%= rs.getString("apellido_jugador")%>"/></td>
                            <td><input type="text" name="txtEquipo" readonly="" class="form-control" value="<%= rs.getString("nombre_equipo")%>"/></td>
                            <td><input type="text" name="txtEquipo" readonly="" class="form-control" value="<%= rs.getString("descripcion_titular")%>"/></td>
                            <td><a href="Jugador_Modificar.jsp?id=<%= rs.getString("rut_jugador")%>" class="btn btn-info" id="url">Modificar</a></td>
                            <td><input type="submit" name="btnAccion" value="Eliminar" class="btn btn-danger"></td>
                            <td><a href="Equipo_Listar.jsp" class="btn btn-success">Regresar</a></td>
                        </tr>




                    </table>
                            
                </form>


                <div class="col-lg-3">

                </div>
            </c:when>
            <c:otherwise>
            </c:otherwise>
        </c:choose>
        <%}%>
    </body>
</html>