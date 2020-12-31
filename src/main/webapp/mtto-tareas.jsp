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
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                <div class="col-lg-8">
                    <h1>Pantalla de Mtto. Tareas!!!</h1>
                </div>
                <div class="col-lg-4>
                    <c:if test="${not empty requestScope.mensaje}">
                        <div class="alert alert sucess" role="alert" style="color: chocolate;">
                            ${requestScope.mensaje}    
                        </div>
                    </c:if>
                </div>
            </div>
            <!--Para Cookies -->
            <div class="row">
                <div class="col-lg-4">
                    <label>Tareas -TO-DO-</label>
                    <!--nueva forma con librerias-->
                    <%
                        Collection<Tarea> lista1 = DB.getTareasPorEstado(Estados.TODO);
                    %>
                    <table class="table">
                        <thead>
                            <th>Id</th>
                            <th>Descripción</th>
                            <th>Estado</th>
                            <th>Archivada</th>
                            <th>...</th>
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
                                <a href="cambio-estado-tarea12?id=<%= t.getIdTarea()%>"><b>></b></a>
                                <%}%>
                                </td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                </div>
                <!--<div class="col-sm-1"></div>-->           
                <div class="col-lg-4">
                    <label>Tareas -IN-PROGRESS-</label>
                    <%
                        Collection<Tarea> lista2 = DB.getTareasPorEstado(Estados.INPROGRESS);
                    %>
                    <table class="table">
                        <thead>
                            <th>...</th>
                            <th>Id</th>
                            <th>Descripción</th>
                            <th>Estado</th>
                            <th>Archivada</th>
                            <th>...</th>
                        </thead>
                        <tbody>
                            <%  for (Tarea t : lista2) {%>
                            <tr>
                                <td>
                                <% if (!t.isArchivado()) {%>
                                    <a href="cambio-estado-tarea21?id=<%= t.getIdTarea()%>"><b><</b></a>
                                <%}%>
                                </td>
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
                                    <a href="cambio-estado-tarea23?id=<%= t.getIdTarea()%>"><b>></b></a>
                                <%}%>
                                </td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                </div>
                <!--<div class="col-sm-1"></div>-->             
                <div class="col-lg-4">
                    <label>Tareas -DONE-</label>
                    <%
                        Collection<Tarea> lista3 = DB.getTareasPorEstado(Estados.DONE);
                    %>
                    <table class="table">
                        <thead>
                            <th>...</th>
                            <th>Id</th>
                            <th>Descripción</th>
                            <th>Estado</th>
                            <th>Archivada</th>
                        </thead>
                        <tbody>
                            <%  for (Tarea t : lista3) {%>
                            <tr>
                                <td>
                                <% if (!t.isArchivado()) {%>
                                    <a href="cambio-estado-tarea12?id=<%= t.getIdTarea()%>"><b><</b></a>
                                <%}%>
                                </td>
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
