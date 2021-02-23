<%-- 
    Document   : alumnos.jsp
    Created on : 05-feb-2021, 12:24:27
    Author     : David Rebato
--%>

<%@page import="Modelo.Alumno"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Mensaje alumnos</h1>
        <%
            String claseSeleccionada = (String) request.getAttribute("clase");
            ArrayList<Alumno> alumnos = (ArrayList<Alumno>) request.getAttribute("alumnos");
            ArrayList<String> grupos = (ArrayList<String>) request.getAttribute("grupos");
            String texto="";
        %>
        <h2>Grupo Seleccionado: <%= claseSeleccionada %></h2>
        <div class="apartado1">
            <form action="servletGrupos" method="GET">
                Grupo: <select name="grupo">
                    <%
                        for(String gr: grupos){
                            if(gr.equals(claseSeleccionada)){
                                String textoSelected="selected";
                    %>
                    <option selected="selected" value="<%= gr %>"><%= gr %></option>
                    <%
                            } else {
                    %>
                    <option value="<%= gr %>"><%= gr %></option>
                    <%
                            }
                    %>
                </select>
                <button type="submit">Seleccionar</button>
            </form>
        </div>
        <div class="apartado2">
            Grupo seleccionado: <input type="text" id="grupoSeleccionado" name="grupoSeleccionado" value="<%= claseSeleccionada %>">
            <form action="servletMensaje" method="POST">
                <table>
                   <% for(Alumno al: alumnos){ %>
                   <tr>
                       <td><%= al.getNombre() %></td>
                       <td><%= al.getApellidos() %></td>
                       <td><%= al.getEmail() %></td>
                       <td><input type="checkbox" name="<%= al.getId() %>"</td>
                   </tr>
                   <% } %>
                </table>
                <input type="submit" value="Enviar">
            </form>
        </div>
    </body>
</html>
