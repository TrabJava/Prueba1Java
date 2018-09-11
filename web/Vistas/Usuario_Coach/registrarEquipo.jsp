<%-- 
    Document   : registrarEquipo
    Created on : 11-09-2018, 16:16:27
    Author     : Artiko1
--%>

<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
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
        <sql:query dataSource="${dataSource}" var="ligas">
            SELECT id_liga, descripcion_liga FROM liga
        </sql:query> 
        
        
        <jsp:include page="menu.jsp"></jsp:include>


            <div class="row centered-form">
                <form action="procesoUsuario" method="GET">
                    <div class="col-xs-12 col-sm-8 col-md-5 col-sm-offset-2 col-md-offset-4">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <center>
                                    <h3 class="panel-title"><strong>Agregar el equipo</strong> <small>Para usuario(coach)</small></h3>
                                </center>
                            </div>
                            <div class="panel-body">

                                <div class="row">
                                    <div class="col-xs-6 col-sm-6 col-md-4 ">
                                        <div class="form-group">
                                            <input type="text" name="txtNombreEquipo"  class="form-control input-sm" required="" placeholder="Nombre del equipo">
                                        </div>
                                    </div>                               
                                </div>
                                <div class="row">
                                    <div class="col-xs-6 col-sm-6 col-md-5">
                                        <div class="form-group">
                                            
                                            
                                 <select name="cboIdLiga" >
                                <c:forEach var="liga" items="${ligas.rows}">
                                    <option value="${liga.id_liga}">${liga.descripcion_liga}</option>
                                </c:forEach>
                            </select>
                                
                                
                                        </div>
                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col-xs-6 col-sm-6 col-md-5">
                                        <div class="form-group">
                                            <input type="file" name="fileLogo" class="form-control input-sm" required="">
                                        </div>
                                    </div>
                                    <div class="row">
                                    <div class="col-xs-6 col-sm-6 col-md-5">
                                        <div class="form-group">
                                            <input type="hidden" name="txtUsuario">
                                        </div>
                                    </div>

                                </div>

                                </div>
                                <input type="hidden" name="txtTipoUsuario" value="2" class="boton">
                                <input type="hidden" name="txtEstadoUsuario" value="1" class="boton">
                                <input type="submit" name="btnAccion" value="Agregar" class="boton">


                            </div>

                        </div>
                    </div>
                </form>
            ${msjOK}
            ${msjNO}
        </div>
    </body>
</html>
