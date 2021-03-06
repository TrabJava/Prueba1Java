<%-- 
    Document   : login
    Created on : 04-sep-2018, 13:23:49
    Author     : Duoc
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

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
        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
                           url = "jdbc:mysql://localhost:3306/liga_nos_vamos?zeroDateTimeBehavior=convertToNull"
                           user = "root"  password = ""/>

        <sql:query dataSource = "${snapshot}" var = "result">
            SELECT id_titular, descripcion_titular FROM titular;
        </sql:query>
        <sql:query dataSource = "${snapshot}" var = "equipo">
            SELECT id_equipo,nombre_equipo FROM equipo;
        </sql:query>
          

        <c:choose>  
            <c:when test="${usuario == null }">
                <div class="background"></div>
                <div class="content">               
                    <h1>Tiene que iniciar sesión primero</h1>
                    <h3><a href="login.jsp">(Iniciar Sesión)</a></h3>              
                </div>
            </c:when>
            <c:when test="${tipo != 2 && tipo !=1 && tipo!=3 && estado !=1}">
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
                                        <h3 class="panel-title"><strong>Agregar Jugador</strong> <small>Para SuperAdministrador</small></h3>
                                    </center>
                                </div>
                                <div class="panel-body">
                                    <form action="procesoJugador" method="GET">
                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-4 ">
                                                <div class="form-group">
                                                    <input type="text" name="txtRutJugador" class="form-control input-sm" required="" placeholder="Rut Jugador">
                                                </div>
                                            </div>                               
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-4 ">
                                                <div class="form-group">
                                                    <input type="text" name="txtNombreJugador" class="form-control input-sm" required="" placeholder="Nombre Jugador">
                                                </div>
                                            </div>                               
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-4 ">
                                                <div class="form-group">
                                                    <input type="text" name="txtApellidoJugador" class="form-control input-sm" required="" placeholder="Apellido Jugador">
                                                </div>
                                            </div>                               
                                        </div>
                                                                      
                                    </div>
                                        <div class="row">
                                        <div class="col-xs-6 col-sm-6 col-md-4 ">
                                            <div class="form-group">
                                                <select name="cboEquipo" >
                                                    <c:forEach var = "row" items = "${equipo.rows}">
                                                        <option value="${row.id_equipo}">${row.nombre_equipo}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>                               
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-6 col-sm-6 col-md-4 ">
                                            <div class="form-group">
                                                <select name="cboTitular" >
                                                    <c:forEach var = "row" items = "${result.rows}">
                                                        <option value="${row.id_titular}">${row.descripcion_titular}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>                               
                                    </div>


                                    <input type="submit" name="btnAccion" value="Agregar" class="boton">
                                </form>
                                ${msjOK}
                                ${msjNO}
                            </div>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:when test="${tipo == 2 && usuario!=null && estado ==1}">
                <jsp:include page="Vistas/Menu/menuAdministrador.jsp"></jsp:include>
                    <div class="row centered-form">
                        <div class="col-xs-12 col-sm-8 col-md-5 col-sm-offset-2 col-md-offset-4">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <center>
                                        <h3 class="panel-title"><strong>Agregar Jugador</strong> <small>Para SuperAdministrador</small></h3>
                                    </center>
                                </div>
                                <div class="panel-body">
                                    <form action="procesoJugador" method="GET">
                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-4 ">
                                                <div class="form-group">
                                                    <input type="text" name="txtRutJugador" class="form-control input-sm" required="" placeholder="Rut Jugador">
                                                </div>
                                            </div>                               
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-4 ">
                                                <div class="form-group">
                                                    <input type="text" name="txtNombreJugador" class="form-control input-sm" required="" placeholder="Nombre Jugador">
                                                </div>
                                            </div>                               
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-4 ">
                                                <div class="form-group">
                                                    <input type="text" name="txtApellidoJugador" class="form-control input-sm" required="" placeholder="Apellido Jugador">
                                                </div>
                                            </div>                               
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-4 ">
                                            <c:forEach var = "row" items = "${equipo.rows}">
                                                <input type="text" name="txtIdEquipo" class="form-control input-sm" required="" value="${row.id_equipo}">

                                            </c:forEach>
                                        </div>                               
                                    </div>
                                        <div class="row">
                                        <div class="col-xs-6 col-sm-6 col-md-4 ">
                                            <div class="form-group">
                                                <select name="cboTitular" >
                                                    <c:forEach var = "row" items = "${result.rows}">
                                                        <option value="${row.id_titular}">${row.descripcion_titular}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>                               
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-6 col-sm-6 col-md-4 ">
                                            <div class="form-group">
                                                <select name="cboTitular" >
                                                    <c:forEach var = "row" items = "${result.rows}">
                                                        <option value="${row.id_titular}">${row.descripcion_titular}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>                               
                                    </div>


                                    <input type="submit" name="btnAccion" value="Agregar" class="boton">
                                </form>
                                ${msjOK}
                                ${msjNO}
                            </div>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:when test="${tipo == 3 && usuario!=null}">
                <jsp:include page="Vistas/Menu/menuUsuario.jsp"></jsp:include>
                    <div class="row centered-form">
                        <div class="col-xs-12 col-sm-8 col-md-5 col-sm-offset-2 col-md-offset-4">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <center>
                                        <h3 class="panel-title"><strong>Agregar Jugador</strong> <small>Para SuperAdministrador</small></h3>
                                    </center>
                                </div>
                                <div class="panel-body">
                                    <form action="controlador/procesoJugador" method="GET">
                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-4 ">
                                                <div class="form-group">
                                                    <input type="text" name="txtRutJugador" class="form-control input-sm" required="" placeholder="Rut Jugador">
                                                </div>
                                            </div>                               
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-4 ">
                                                <div class="form-group">
                                                    <input type="text" name="txtNombreJugador" class="form-control input-sm" required="" placeholder="Nombre Jugador">
                                                </div>
                                            </div>                               
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-4 ">
                                                <div class="form-group">
                                                    <input type="text" name="txtApellidoJugador" class="form-control input-sm" required="" placeholder="Apellido Jugador">
                                                </div>
                                            </div>                               
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-4 ">
                                            <c:forEach var = "row" items = "${equipo.rows}">
                                                <input type="text" name="txtIdEquipo" class="form-control input-sm" required="" value="${row.id_equipo}">

                                            </c:forEach>
                                        </div>                               
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-6 col-sm-6 col-md-4 ">
                                            <div class="form-group">
                                                <select name="cboTitular" >
                                                    <c:forEach var = "row" items = "${result.rows}">
                                                        <option value="${row.id_titular}">${row.descripcion_titular}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>                               
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-6 col-sm-6 col-md-4 ">
                                            <div class="form-group">
                                                <select name="cboTitular" >
                                                    <c:forEach var = "row" items = "${result.rows}">
                                                        <option value="${row.id_titular}">${row.descripcion_titular}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>                               
                                    </div>


                                    <input type="submit" name="btnAccion" value="Agregar" class="boton">
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
