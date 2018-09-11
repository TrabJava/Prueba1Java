<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : Equipo_Agregar
    Created on : 11-09-2018, 18:46:13
    Author     : Artiko1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../js/FormularioSuperUsuario/EstiloFormulario.css" rel="stylesheet" type="text/css" />
        <title>JSP Page</title>
    </head>
    <body>
        <sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/liga_nos_vamos?zeroDateTimeBehavior=convertToNull" user="root" password=""></sql:setDataSource>
         
        <sql:query var="ligas" dataSource="${dataSource}">
            SELECT id_liga, descripcion_liga FROM liga
        </sql:query>

        <div class="row centered-form">
                <div class="col-xs-12 col-sm-8 col-md-5 col-sm-offset-2 col-md-offset-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <center>
                                <h3 class="panel-title"><strong>Agregar Administrador</strong> <small>Para SuperAdministrador</small></h3>
                            </center>
                        </div>
                        <div class="panel-body">
                            <form action="procesoUsuario" method="GET">
                                <div class="row">
                                    <div class="col-xs-6 col-sm-6 col-md-4 ">
                                        <div class="form-group">
                                            <input type="text" name="txtNombreEquipo" class="form-control input-sm" required="" placeholder="Nombre equipo">
                                        </div>
                                    </div>                               
                                </div>
                                <div class="row">
                                    <div class="col-xs-6 col-sm-6 col-md-5">
                                        
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-6 col-sm-6 col-md-4 ">
                                        <div class="form-group">
                                          <select name="cboID" >
                                <c:forEach var="vari" items="${ligas.rows}">
                                    <option value="${vari.id_liga}">${vari.descripcion_liga}</option>
                                </c:forEach>
                            </select>
                                    </div>
                                    </div>                               
                                </div>
                                <div class="row">
                                    <div class="col-xs-6 col-sm-6 col-md-4 ">
                                        <div class="form-group">
                                            <input type="text" name="txtNombreEquipo" class="form-control input-sm" required="" placeholder="Nombre equipo">
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
    </body>
</html>

