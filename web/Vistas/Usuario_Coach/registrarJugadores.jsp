<%-- 
    Document   : login
    Created on : 04-sep-2018, 13:23:49
    Author     : Duoc
--%>

<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
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
        <jsp:include page="menu.jsp"></jsp:include>


            <div class="row centered-form">
                <form action="procesoUsuario" method="GET">
                    <div class="col-xs-12 col-sm-8 col-md-5 col-sm-offset-2 col-md-offset-4">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <center>
                                    <h3 class="panel-title"><strong>Agregar jugador al equipo</strong> <small>Para usuario(coach)</small></h3>
                                </center>
                            </div>
                            <div class="panel-body">

                                <div class="row">
                                    <div class="col-xs-6 col-sm-6 col-md-4 ">
                                        <div class="form-group">
                                            <input type="text" name="txtRutJugador"  class="form-control input-sm" required="" placeholder="Rut del jugador">
                                        </div>
                                    </div>                               
                                </div>
                                <div class="row">
                                    <div class="col-xs-6 col-sm-6 col-md-5">
                                        <div class="form-group">
                                              <input type="text" name="txtNombreJugador"  class="form-control input-sm" required="" placeholder="Nombre del jugador">
                                        </div>
                                    </div>

                                </div>
                                 <div class="row">
                                    <div class="col-xs-6 col-sm-6 col-md-5">
                                        <div class="form-group">
                                              <input type="text" name="txtApellidoJugador"  class="form-control input-sm" required="" placeholder="Apellido del jugador">
                                        </div>
                                    </div>

                                </div>
                                     <div class="row">
                                    <div class="col-xs-6 col-sm-6 col-md-5">
                                        <div class="form-group">
                                              <input type="text" name="txtIdEquipo"  class="form-control input-sm" required="" >
                                        </div>
                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col-xs-6 col-sm-6 col-md-5">
                                        <div class="form-group">
                                            <select name="">
                                                <option>Titular</option>
                                                <option>No Titular</option>
                                            </select> 
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

