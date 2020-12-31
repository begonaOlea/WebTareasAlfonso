<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login</title>
        <%@include file="WEB-INF/vista/estilos.jspf" %>
    </head>
    <body>
        <div class="container">

            <%@include file="WEB-INF/vista/cabecera.jspf" %>
            <%@include file="WEB-INF/vista/navegacion.jspf" %>

            <div class="row">
                <div class="col">
                    <h1>Introduce los datos de Acceso</h1>
                </div>
            </div>
            <form action= "login" method="post">
                <div class="form-group">
                    <label for="email">Email address</label>
                    <input type="email" class="form-control" name="email"
                           id="email" placeholder="Introduce  email">
                    <div class="col" role="alert"> ${requestScope.msgErrorEmail}</div>
                <div class="form-group">
                    <label for="pwd">Password</label>
                    <input type="password" class="form-control" name="clave"
                           id="clave" placeholder="Contraseña">
                    <div class="col" role="alert"> ${requestScope.msgErrorClave}</div>
                </div>
                <div class="btn-group" role="group">
                    <a href="alta-usuario.jsp" class="btn btn-primary">Registrarse</a>&nbsp;&nbsp;&nbsp;&nbsp;  
                    <button type="submit" class="btn btn-primary">Login</button>
                </div>
            </form>
            <!-- mensaje error login -->
            <c:if test="${not empty requestScope.msgErrorLogin}" >
                <div class="alert alert-success" role="alert">
                    ${requestScope.msgErrorLogin}
                </div>
            </c:if>
        </div>
    </body>
</html>
