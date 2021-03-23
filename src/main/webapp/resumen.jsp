<%-- 
    Document   : resumen
    Created on : 23-mar-2021, 11:54:40
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
    </head>
    <body>
        <h1>Mensaje a Alumnos</h1>
        <%
            String grupoSeleccionado = (String) request.getAttribute("grupo");
            ArrayList<Alumno> alumnosSeleccionados = (ArrayList<Alumno>) request.getAttribute("alumnosSeleccionados");
        %>
        <div class="container">
            <div class="row">
                <div class="col-mb">
                    <h3>Grupo seleccionado: <%= grupoSeleccionado %></h3>
                    <form action="servletGrupos" method="POST">
                        <table class="table">
                            <tr>
                                <th>Nombre</th>
                                <th>Apellidos</th>
                                <th>Email</th>
                            </tr>
                            <%
                                for (Alumno a: alumnosSeleccionados) {
                            %>
                            <tr>
                                <td><%= a.getNombre() %></td>
                                <td><%= a.getApellidos() %></td>
                                <td><%= a.getEmail() %></td>
                            </tr>
                            <%
                                }
                            %>
                        </table>
                        <br>
                        <b>Mensaje: </b>
                        <textarea class="form-control" name="mensaje"></textarea><br>
                        <input class="btn btn-primary" type="submit">
                    </form>
                </div> 
            </div>
        </div>
    </body>
</html>
