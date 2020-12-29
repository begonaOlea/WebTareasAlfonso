<%-- 
    Document   : mtto-tareas
    Created on : 29-dic-2020, 12:48:16
    Author     : Admin
--%>

<%@page import="com.tareas.model.Estados"%>
<%@page import="java.util.Collection"%>
<%@page import="com.tareas.model.Tarea"%>
<%@page import="com.tareas.model.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>Mantenimiento Tareas</title>
        <%@include file="WEB-INF/vista/estilos.jspf" %>
    </head>
    <body>
        <div class="container">

            <%@include file="WEB-INF/vista/cabecera.jspf" %>
            <%@include file="WEB-INF/vista/navegacion.jspf" %>
            <div class="row">
                <div class="col">
                    <h1>Pantalla de Mtto. Tareas !!!</h1>
                </div>
            </div>
            <!--Para Cookies -->
            <div class="row">
                <div class="col-3">
                        <label> Selecciona una tarea de la lista TO-DO</label>
                        <%
                            Collection<Tarea> lista1 = DB.getTareasEstado("TO-DO");
                        %>
                        <table class="table" id="tabla1_2">
                            <thead>
                                <th>Id</th>
                                <th>Descripción</th>
                                <th>Estado</th>
                                <th>Archivada</th>
                            </thead>
                            <tbody>
                                <% for (Tarea t : lista1) {%>
                                <tr>
                                    <td><%= t.getIdTarea()%></td>
                                    <td><%= t.getDescripcion()%></td>
                                    <td><%= t.getEstado()%></td>
                                    <% if (t.isArchivado()) {%>
                                            <td>Archivada</td>
                                    <%} else {%>
                                            <td>No Archivada</td>
                                    <%}%>
                                    <td>
                                    <% if (!t.isArchivado()) {%>
                                        <a href="cambio-estado-tarea?id=<%= t.getIdTarea()%>">></a>
                                    <%}%>
                                    </td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                </div>
                <div class="col-1"></div>           
                <div class="col-3">
                        <label> Selecciona una tarea de la lista IN-PROGRESS</label>
                        <%
                            Collection<Tarea> lista2 = DB.getTareasEstado("IN-PROGRESS");
                        %>
                        <table class="table">
                            <thead>
                                <th>Id</th>
                                <th>Descripción</th>
                                <th>Estado</th>
                                <th>Archivada</th>
                            </thead>
                            <tbody>
                                <%  for (Tarea t : lista2) {%>
                                <tr>
                                    <td><%= t.getIdTarea()%></td>
                                    <td><%= t.getDescripcion()%></td>
                                    <td><%= t.getEstado()%></td>
                                    <% if (t.isArchivado()) {%>
                                            <td>Archivada</td>
                                    <%} else {%>
                                            <td>No Archivada</td>
                                    <%}%>
                                    <td>
                                    <% if (!t.isArchivado()) {%>
                                        <a href="cambio-estado-tarea?id=<%= t.getIdTarea()%>">></a>
                                    <%}%>
                                    </td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                </div>
                <div class="col-1"></div>           
                <div class="col-3">
                        <label>Selecciona una tarea de la lista DONE</label>
                        <%
                            Collection<Tarea> lista3 = DB.getTareasEstado("DONE");
                        %>
                        <table class="table">
                            <thead>
                                <th>Id</th>
                                <th>Descripción</th>
                                <th>Estado</th>
                                <th>Archivada</th>
                            </thead>
                            <tbody>
                                <%  for (Tarea t : lista3) {%>
                                <tr>
                                    <td><%= t.getIdTarea()%></td>
                                    <td><%= t.getDescripcion()%></td>
                                    <td><%= t.getEstado()%></td>
                                    <% if (t.isArchivado()) {%>
                                            <td>Archivada</td>
                                    <%} else {%>
                                            <td>No Archivada</td>
                                    <%}%>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                </div>
            </div>
        </div>
    </body>
</html>
