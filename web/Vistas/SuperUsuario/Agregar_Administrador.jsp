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
            <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <center>
                            <h3 class="panel-title"><strong>Agregar Administrador</strong> <small>Para SuperAdministrador</small></h3>
                        </center>
                    </div>
                    
                    <div class="panel-body">
                        <form role="form">
                            <div class="row">
                                <div class="col-xs-6 col-sm-6 col-md-4 ">
                                    <div class="form-group">
                                        <input type="text" name="txtNombreUsuario" id="first_name" class="form-control input-sm" placeholder="Nombre de Usuario">
                                    </div>
                                </div>                               
                            </div>
                            <div class="row">
                                <div class="col-xs-6 col-sm-6 col-md-5">
                                    <div class="form-group">
                                        <input type="password" name="txtPassword" id="password" class="form-control input-sm" placeholder="Contraseña">
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-xs-6 col-sm-6 col-md-5">
                                    <div class="form-group">
                                        <input type="password" name="password_confirmation" id="password_confirmation" class="form-control input-sm" placeholder="Confirmar Contraseña">
                                    </div>
                                </div>
                            </div>
                            <input type="submit" name="btnAccion" value="Agregar" class="boton">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
