<%-- 
    Document   : Menu
    Created on : 10-09-2018, 17:39:49
    Author     : Berni
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
        <meta charset="utf-8" />
        <meta name="author" content="Script Tutorials" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../js/jsMenus/Menus.css" rel="stylesheet" type="text/css" />
        <title>Menu SuperUsuario</title>
    </head>
    <body>
        <div class="container">
            <ul id="nav">    
                <li><a href="#s1">Menu para Administrador</a>
                    <span id="s1"></span>
                    <ul class="subs">
                        <li><a href="#">Gestion de Usuarios</a>
                            <ul>
                                <li><a href="Coach_registrar.jsp">Agregar Coach</a></li>   
                                <li><a href="Equipo_Listar.jsp">Listar Equipo</a></li>               
                                <li><a href="Jugador_registrar.jsp">Agregar Jugador</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
     
                <li><a href="#s1">Menu para Usuarios</a>
                    <span id="s1"></span>
                    <ul class="subs">
                        <li><a href="#">Gestion de Equipos</a>
                            <ul>
                                <li><a href="Equipo_Agregar.jsp">Agregar Equipo</a></li>
                                <li><a href="Jugador_registrar.jsp">Agregar Jugador</a>
                            </ul>
                        </li>
                    </ul>
                </li>

            </ul>
        </div>
    </body>
</html>
