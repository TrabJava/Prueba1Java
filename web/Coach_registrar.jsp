<%-- 
    Document   : Agregar_Administrador
    Created on : 10-09-2018, 18:10:38
    Author     : Berni
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="js/jsMenus/Menus.css" rel="stylesheet" type="text/css" />
        <link href="js/FormularioSuperUsuario/EstiloFormulario.css" rel="stylesheet" type="text/css" />
        <title>JSP Page</title>
    </head>
    <body>
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
                <div class="row centered-form">
                <div class="col-xs-12 col-sm-8 col-md-5 col-sm-offset-2 ">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <center>
                                <h3 class="panel-title"><strong>Registrar Usuario</strong> <small>Para SuperAdministrador</small></h3>
                            </center>
                        </div>
                        <div class="panel-body">
                            <form action="procesoUsuario" method="GET">
                                <div class="row">
                                    <div class="col-xs-6 col-sm-6 col-md-4 ">
                                        <div class="form-group">
                                            <input type="text" name="txtNombreUsuario" class="form-control input-sm" required="" placeholder="Nombre de Usuario">
                                        </div>
                                    </div>                               
                                </div>
                                <div class="row">
                                    <div class="col-xs-6 col-sm-6 col-md-5">
                                        <div class="form-group">
                                            <input type="password" name="txtPassword" class="form-control input-sm" required="" placeholder="Contraseña">
                                        </div>
                                    </div>
                                </div>  
                                <input type="submit" name="btnAccion" value="AgregarCoach" class="boton">
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
                <div class="col-xs-12 col-sm-8 col-md-5 col-sm-offset-2 ">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <center>
                                <h3 class="panel-title"><strong>Registrar Usuario</strong> <small>Para SuperAdministrador</small></h3>
                            </center>
                        </div>
                        <div class="panel-body">
                            <form action="procesoUsuario" method="GET">
                                <div class="row">
                                    <div class="col-xs-6 col-sm-6 col-md-4 ">
                                        <div class="form-group">
                                            <input type="text" name="txtNombreUsuario" class="form-control input-sm" required="" placeholder="Nombre de Usuario">
                                        </div>
                                    </div>                               
                                </div>
                                <div class="row">
                                    <div class="col-xs-6 col-sm-6 col-md-5">
                                        <div class="form-group">
                                            <input type="password" name="txtPassword" class="form-control input-sm" required="" placeholder="Contraseña">
                                        </div>
                                    </div>
                                </div>  
                                <input type="submit" name="btnAccion" value="AgregarCoach" class="boton">
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