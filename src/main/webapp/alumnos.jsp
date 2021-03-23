<%-- 
    Document   : alumnos
    Created on : 23-mar-2021, 12:03:50
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
        <h1>Mensaje a alumnos</h1>
        <%
            ArrayList<Alumno> alumnos = (ArrayList<Alumno>) request.getAttribute("alumnos");
            String grupoSeleccionado = (String) request.getAttribute("grupo");
            ArrayList<String> grupos = (ArrayList<String>) request.getAttribute("grupos");
            String texto = "";
        %>
        <h3>Grupo Seleccionado: <%=grupoSeleccionado%></h3>
        <form action="servletGestion" method="get">
            Grupo:<select name="grupo">
                <%
                    for(String gru: grupos){
                        if(grupoSeleccionado.equals(gru)){
                            texto="selected";
                %>
                            <option selected="selected" value="<%=gru%>"><%=gru%></option>
                <%
                        } else { 
                %>
                            <option value="<%=gru%>"><%=gru%></option>
                <%
                        }
                    }
                %>
            </select>
            <br>
            <input type="submit" value="Enviar">    
        </form><br>
        <form action="servletGestion" method="post">
            Grupo seleccionado<input type="text" name="grupo" value="<%=grupoSeleccionado%>">
                <table>           
            <%
                for(Alumno a: alumnos) {
            %>
                <tr>
                    <td><%= a.getNombre() %></td>
                    <td><%= a.getApellidos() %></td>
                    <td><%= a.getEmail() %></td>
                    <td><input type="checkbox" name="<%= a.getId() %>"></td>
                </tr>
            <%
                }
            %>
        </table> 
        <input type="submit" value="Enviar">
        </form>
    </body>
</html>
