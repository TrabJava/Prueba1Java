<%-- 
    Document   : Administrador_Modificar
    Created on : 11-09-2018, 18:38:54
    Author     : Berni
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
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="js/jsMenus/Menus.css" rel="stylesheet" type="text/css" />
        <link href="js/FormularioSuperUsuario/EstiloFormulario.css" rel="stylesheet" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>JSP Page</title>
    </head>
    <body>
        
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
            ps = con.prepareStatement("select * from usuario where id_usuario=" + id);
            rs = ps.executeQuery();

            PreparedStatement pre;
            ResultSet rset;
            pre = con.prepareStatement("select * from tipo_usuario");
            rset = pre.executeQuery();

            PreparedStatement pree;
            ResultSet rseet;
            pree = con.prepareStatement("select * from estado_usuario");
            rseet = pree.executeQuery();
            while (rs.next()) {
        %>
                <jsp:include page="Vistas/Menu/menuSuperUsuario.jsp"></jsp:include>
                    <div class="row centered-form">
                        <div class="col-xs-12 col-sm-8 col-md-5 col-sm-offset-2 col-md-offset-4">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <center>
                                        <h3 class="panel-title"><strong>Modificar Administrador</strong> <small>Para SuperAdministrador</small></h3>
                                    </center>
                                </div>
                                <div class="panel-body">
                                    <form action="procesoUsuario" method="GET">
                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-4 ">
                                                <div class="form-group">
                                                    <input type="text" readonly="" name="txtId" class="form-control" value="<%= rs.getInt("id_usuario")%>"/>
                                            </div>
                                        </div>                               
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-6 col-sm-6 col-md-4 ">
                                            <div class="form-group">
                                                <input type="text" name="txtNombreUsuario" class="form-control" value="<%= rs.getString("nombre_usuario")%>"/>
                                            </div>
                                        </div>                               
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-6 col-sm-6 col-md-4 ">
                                            <div class="form-group">
                                                <input type="text" name="txtPassword" class="form-control" value="<%= rs.getString("contrasenia")%>"/>
                                            </div>
                                        </div>                               
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-6 col-sm-6 col-md-5">
                                            <div class="form-group">
                                                <select name="cboTipoUsuario" >
                                                    <%
                                                while (rset.next()) {%>
                                                    <option value="<%= rset.getInt("id_tipo_usuario")%>"><%= rset.getString("descripcion_tipo_usuario")%></option>
                                                    <%}
                                                    %>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-6 col-sm-6 col-md-5">
                                            <div class="form-group">
                                                <select name="cboEstadoUsuario" >
                                                    <%
                                                while (rseet.next()) {%>
                                                    <option value="<%= rseet.getInt("id_estado_usuario")%>"><%= rseet.getString("descripcion_estado_usuario")%></option>
                                                    <%}
                                                    %>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <input type="submit" name="btnAccion" value="Modificar" class="boton">
                                </form>
                                <%}%>
                                ${msjOK}
                                ${msjNO}
                            </div>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
            </c:otherwise>
        </c:choose>
    </body>
</html>
