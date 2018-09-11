<%-- 
    Document   : Listar_Administrar
    Created on : 10-09-2018, 19:56:23
    Author     : Berni
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>

            <div class="container">
                <div class="row">
                    <div class="col-sm-3">

                    </div>
                    <div class="col-sm-6">
                        <h1>Mantenedor de Administradores</h1>
                        
                        
                       
                   
                        <form action="" method="GET">
                            <div class="form-group text-center">
                                <input type="submit" name="btnAccion" value="Listar" class="btn btn-info"/>
                            </div>
                        </form>
                        
                    ${msjOK}
                    ${msjNO}
                    <br>
                    <%
                        HttpSession sesion = request.getSession();
                        if (sesion.getAttribute("alumnos") == null) {
                            out.println("No Existen Datos");
                        } else {
                          //AlumnoDAO dao = new AlumnoDAO();
                    %>
                    <table class="table table-bordered table-striped">
                        <tr>
                            <th>ID</th>
                            <th>NOMBRE</th>
                            <th>APELLIDO</th>
                            <th>EDAD</th>
                        </tr>
                        <%
                         //   for (Alumno aux : dao.listarTodo()) {
                        %>
                        <tr>
                            <td><%= aux.getId()%></td>
                            <td><%= aux.getNombre()%></td>
                            <td><%= aux.getApellido()%></td>
                            <td><%= aux.getEdad()%></td>
                        </tr>
                        <% } %>
                    </table>
                    <% }%>
                </div>
                <div class="col-sm-3">

                </div>
            </div>
        </div>

    </body>
</html>
