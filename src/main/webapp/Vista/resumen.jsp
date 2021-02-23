<%-- 
    Document   : resumen
    Created on : 23-feb-2021, 18:09:11
    Author     : David Rebato
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Alumno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
        <script>tinymce.init({selector:'textarea});</script>
    </head>
    <body>
        <h1>Mensaje a alumnos</h1>
        <%
            String claseSeleccionada = (String) request.getAttribute("grupo");
            ArrayList<Alumno> alumnosSeleccionados = (ArrayList<Alumno>) request.getAttribute("alumnosSeleccionados");
        %>
        <div class="container">
            <div class="row">
                <div class="col-mb">
                    <h3>Grupo seleccionado <%= claseSeleccionada %></h3>
                    <form action="servletGrupos" method="post">
                        <table class="table">
                            <tr>
                                <th>Nombre</th>
                                <th>Apellidos</th>
                                <th>Email</th>
                            </tr>
                            <%
                                for(Alumno al: alumnosSeleccionados) {
                            %>
                            <tr>
                                <td><%= al.getNombre() %></td>
                                <td><%= al.getApellidos() %></td>
                                <td><%= al.getEmail() %></td>
                            </tr>
                            <%
                                }
                            %>
                        </table>
                        <br>
                        <p>Mensaje: <textarea class="form-control" name="mensaje"></textarea></p>
                        <input class="btn btn-primary" type="submit" value="enviar">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
