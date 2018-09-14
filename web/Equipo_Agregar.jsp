
<%-- 
    Document   : Equipo_Agregar
    Created on : 11-09-2018, 18:46:13
    Author     : Artiko1
--%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="js/FormularioSuperUsuario/EstiloFormulario.css" rel="stylesheet" type="text/css" />
        <link href="js/jsMenus/Menus.css" rel="stylesheet" type="text/css" />
        <title>JSP Page</title>
    </head>
    <body>
        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
                           url = "jdbc:mysql://localhost:3306/liga_nos_vamos?zeroDateTimeBehavior=convertToNull"
                           user = "root"  password = ""/>

        <sql:query dataSource = "${snapshot}" var = "result">
            SELECT id_liga, descripcion_liga FROM liga;
        </sql:query>
        <sql:query dataSource = "${snapshot}" var = "sesion">
            SELECT id_usuario FROM usuario WHERE nombre_usuario="${usuario}";
        </sql:query>
        <c:choose>  
            <c:when test="${usuario == null }">
                <div class="background"></div>
                <div class="content">               
                    <h1>Tiene que iniciar sesión primero</h1>
                    <h3><a href="login.jsp">(Iniciar Sesión)</a></h3>              
                </div>
            </c:when>
            <c:when test="${tipo != 2 && tipo !=1 && tipo !=3}">
                <div class="background"></div>
                <div class="content">               
                    <h1>No tiene acceso de ingresar a otra sesión por medio de url</h1>
                    <h3><a href="login.jsp">(Volver al Login)</a></h3>              
                </div>
            </c:when>
            <c:when test="${tipo == 1 && usuario!=null}">
                <jsp:include page="Vistas/Menu/menuSuperUsuario.jsp"></jsp:include>
                    <div class="row centered-form">
                        <div class="col-xs-12 col-sm-8 col-md-5 col-sm-offset-2 col-md-offset-4">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <center>
                                        <h3 class="panel-title"><strong>Agregar Administrador </strong> <small>Para SuperAdministrador</small></h3>
                                    </center>
                                </div>
                                <div class="panel-body">
                                    <form action="procesoEquipo" method="GET">
                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-4 ">
                                                <div class="form-group">
                                                    <label>Nombre Equipo:</label>
                                                    <input type="text" name="txtNombreEquipo" class="form-control input-sm" required="" placeholder="Nombre equipo">
                                                </div>
                                            </div>                               
                                        </div>

                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-4 ">
                                                <div class="form-group">
                                                    <label>Nombre Liga:</label>
                                                    <select name="cboLiga" >
                                                    <c:forEach var = "row" items = "${result.rows}">
                                                        <option value="${row.id_liga}">${row.descripcion_liga}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>                               
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-6 col-sm-6 col-md-4 ">
                                            <div class="form-group">
                                                <label>Logo:</label>
                                                <input type="text" name="fileLogo" class="form-control input-sm" required="" >
                                            </div>
                                        </div>                               
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-6 col-sm-6 col-md-4 ">
                                            <div class="form-group">
                                                <c:forEach var = "row" items = "${sesion.rows}">
                                                    <input type="text" name="txtIdEquipo" readonly="" class="form-control input-sm" value="${row.id_usuario}">

                                                </c:forEach>
                                            </div>
                                        </div>                               
                                    </div>
                                    <input type="submit" name="btnAccion" id="btnAccion" value="Agregar" class="boton">
                                </form>
                                ${msjOK}
                                ${msjNO}
                            </div>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:when test="${tipo == 2 && usuario!=null}">
                <jsp:include page="Vistas/Menu/menuAdministrador.jsp"></jsp:include>
                    <div class="row centered-form">
                        <div class="col-xs-12 col-sm-8 col-md-5 col-sm-offset-2 col-md-offset-4">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <center>
                                        <h3 class="panel-title"><strong>Agregar Administrador </strong> <small>Para SuperAdministrador</small></h3>
                                    </center>
                                </div>
                                <div class="panel-body">
                                    <form action="procesoEquipo" method="GET">
                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-4 ">
                                                <div class="form-group">
                                                    <input type="text" name="txtNombreEquipo" class="form-control input-sm" required="" placeholder="Nombre equipo">
                                                </div>
                                            </div>                               
                                        </div>

                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-4 ">
                                                <div class="form-group">
                                                    <select name="cboLiga" >
                                                    <c:forEach var = "row" items = "${result.rows}">
                                                        <option value="${row.id_liga}">${row.descripcion_liga}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>                               
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-6 col-sm-6 col-md-4 ">
                                            <div class="form-group">
                                                <input type="text" name="fileLogo" class="form-control input-sm" required="" >
                                            </div>
                                        </div>                               
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-6 col-sm-6 col-md-4 ">
                                            <div class="form-group">
                                                <c:forEach var = "row" items = "${sesion.rows}">
                                                    <input type="text" name="txtIdEquipo" class="form-control input-sm" required="" value="${row.id_usuario}">

                                                </c:forEach>
                                            </div>
                                        </div>                               
                                    </div>
                                    <input type="submit" name="btnAccion" id="btnAccion" value="Agregar" class="boton">
                                </form>
                                ${msjOK}
                                ${msjNO}
                            </div>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:when test="${tipo == 2 && usuario!=null}">
                <jsp:include page="Vistas/Menu/menuUsuario.jsp"></jsp:include>
                    <div class="row centered-form">
                        <div class="col-xs-12 col-sm-8 col-md-5 col-sm-offset-2 col-md-offset-4">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <center>
                                        <h3 class="panel-title"><strong>Agregar Administrador </strong> <small>Para SuperAdministrador</small></h3>
                                    </center>
                                </div>
                                <div class="panel-body">
                                    <form action="procesoEquipo" method="GET">
                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-4 ">
                                                <div class="form-group">
                                                    <input type="text" name="txtNombreEquipo" class="form-control input-sm" required="" placeholder="Nombre equipo">
                                                </div>
                                            </div>                               
                                        </div>

                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-4 ">
                                                <div class="form-group">
                                                    <select name="cboLiga" >
                                                    <c:forEach var = "row" items = "${result.rows}">
                                                        <option value="${row.id_liga}">${row.descripcion_liga}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>                               
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-6 col-sm-6 col-md-4 ">
                                            <div class="form-group">
                                                <input type="text" name="fileLogo" class="form-control input-sm" required="" >
                                            </div>
                                        </div>                               
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-6 col-sm-6 col-md-4 ">
                                            <div class="form-group">
                                                <c:forEach var = "row" items = "${sesion.rows}">
                                                    <input type="text" name="txtIdEquipo" class="form-control input-sm" required="" value="${row.id_usuario}">

                                                </c:forEach>
                                            </div>
                                        </div>                               
                                    </div>
                                    <input type="submit" name="btnAccion" id="btnAccion" value="Agregar" class="boton">
                                </form>
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

