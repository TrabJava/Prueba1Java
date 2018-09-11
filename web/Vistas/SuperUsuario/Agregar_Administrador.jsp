<%-- 
    Document   : Agregar_Administrador
    Created on : 10-09-2018, 18:10:38
    Author     : Berni
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
        <jsp:include page="Menu.jsp"></jsp:include>


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
                                <input type="submit" name="btnAccion" value="Agregar" class="boton">
                            </form>
                        </div>

                    </div>
                </div>

            ${msjOK}
            ${msjNO}
        </div>
    </body>
</html>
