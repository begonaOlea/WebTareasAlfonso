<%@page import="com.tareas.model.Tarea"%>
<%@page import="com.tareas.model.DB"%>
<%@page import="com.tareas.model.Tarea"%>
<%@page import="java.util.Collection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Lista Tareas</title>
        <%@include file="/WEB-INF/vista/estilos.jspf" %>
    </head>
    <body>
        <div class="container">
            <p>
                <%@include file="/WEB-INF/vista/cabecera.jspf" %>
                <%@include file="/WEB-INF/vista/navegacion.jspf" %>
            </p>
            <h1>Lista de Tareas</h1>
            <!--nueva forma EL-->
            Ejemplo EL (Expresion Language)*${requestScope.mensaje}*
            <br />
            <!--nueva forma con librerias-->
            <c:if test="${not empty requestScope.mensaje}">
                <div class="alert alert sucess" role="alert">
                    ${requestScope.mensaje}    
                </div>
            </c:if>

            <!--anterior forma -->
            <%
                if (request.getAttribute("mensaje") != null) {
                    String mensaje = (String) request.getAttribute("mensaje");
                    out.print("Mensaje respuesta: " + mensaje);
                }
            %>

            Fecha: <%= java.time.LocalDate.now()%>
            <%
                Collection<Tarea> lista = DB.getAllTareas();
            %>
            <table class="table">
                <thead>
                    <th>Id</th>
                    <th>Descripción</th>
                    <th>Estado</th>
                    <th>Archivada</th>
                </thead>
                <tbody>
                    <%  for (Tarea t : lista) {%>
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
                                <a href="archivar-tarea?id=<%= t.getIdTarea()%>" >Archivar Tarea</a>
                            <%}%>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>
