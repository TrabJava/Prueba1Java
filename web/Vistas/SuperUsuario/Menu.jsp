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
                <li><a href="index.jsp">Inicio</a></li>
                <li><a href="Agregar_Administrador.jsp">Agregar</a>        
                </li>
                <li class="active"><a href="#s2">Menu 2</a>
                    <span id="s2"></span>
                    <ul class="subs">
                        <li><a href="#">Header c</a>
                            <ul>
                                <li><a href="#">Submenu x</a></li>
                                <li><a href="#">Submenu y</a></li>
                                <li><a href="#">Submenu z</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Header d</a>
                            <ul>
                                <li><a href="#">Submenu x</a></li>
                                <li><a href="#">Submenu y</a></li>
                                <li><a href="#">Submenu z</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li><a href="#">Menu 3</a></li>
                <li><a href="#">Menu 4</a></li>
                <li><a href="#">Menu 5</a></li>
            </ul>
        </div>
    </body>
</html>
