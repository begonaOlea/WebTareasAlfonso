<%@page import="com.tareas.model.DB"%>
<%@page import="com.tareas.model.Usuario"%>
<%@page import="java.util.Collection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Usuarios</title>
        <%@include file="/WEB-INF/vista/estilos.jspf" %>
    </head>
    <body>
         <div class="container">
            <p>
                <%@include file="/WEB-INF/vista/cabecera.jspf" %>
                <%@include file="/WEB-INF/vista/navegacion.jspf" %>
            </p>
            <h1>Lista de Usuarios</h1>
            <!--nueva forma EL-->
            Ejemplo EL (Expresion Language)*${requestScope.mensaje}*
            <br />
            <!--nueva forma con librerias-->
            <c:if test="${not empty requestScope.msgErrorAlta}">
                <div class="alert alert sucess" role="alert">
                    ${requestScope.msgErrorAlta}    
                </div>
            </c:if>

            <!--anterior forma -->
            <%
                if (request.getAttribute("msgErrorAlta") != null) {
                    String mensaje = (String) request.getAttribute("msgErrorAlta");
                    out.print("Mensaje respuesta: " + mensaje);
                }
            %>

            Fecha: <%= java.time.LocalDate.now()%>
            <%
                Collection<Usuario> lista = DB.getUsuarios();
            %>
            <table class="table">
                <thead>
                <th>Email</th>
                <th>Nombre</th>
                <th>Clave</th>
                <th>Localidad</th>
                </thead>
                <tbody>
                    <%  for (Usuario l : lista) {%>
                    <tr>
                        <td><%= l.getEmail()%></td>
                        <td><%= l.getNombre()%></td>
                        <td><%= l.getClave()%></td>
                        <td><%= l.getLocalidad()%></td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>
