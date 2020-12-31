<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alta Usuario</title>
        <%@include file="/WEB-INF/vista/estilos.jspf" %>
    </head>
    <body>
        <div class="container">

            <%@include file="WEB-INF/vista/cabecera.jspf" %>
            <%@include file="WEB-INF/vista/navegacion.jspf" %>

            <div class="row">
                <div class="col">
                    <h1>Alta Nuevo Usuario</h1>
                </div>
            </div>

            <!-- mensaje error alta -->
            <c:if test="${not empty requestScope.msgErrorAlta }" >
                <div class="alert alert-success" role="alert">
                    ${requestScope.msgErrorAlta}
                </div>
            </c:if>

            <!--  formulario  -->

            <div class="row">
                <div class="col">

                    <form action="alta-usuario" method="post">
                        <div class="row">
                            <div class="col">
                                <input type="email" class="form-control" id="email" 
                                       placeholder="Introduce el Email" name="email">
                            </div>
                            <div class="col">${ requestScope.msgErrorEmail }</div>
                        </div><br/>
                        <div class="row">
                            <div class="col">
                                <input type="text" class="form-control" id="nombre" 
                                       placeholder="Introduce el Nombre" name="nombre">
                            </div>
                            <div class="col">${ requestScope.msgErrorNombre }</div>
                        </div><br/>
                        <div class="row">
                            <div class="col">
                                <input type="text" class="form-control" id="apellidos" 
                                       placeholder="Introduce los Apellidos" name="apellidos">
                            </div>
                            <div class="col">${ requestScope.msgErrorApellidos }</div>
                        </div><br/>
                         <div class="row">
                            <div class="col">
                                <input type="password" class="form-control" id="clave" 
                                       placeholder="Introduce la Contraseña" name="clave">
                            </div>
                            <div class="col">${ requestScope.msgErrorClave }</div>
                        </div><br/>
                        <div class="row">
                            <div class="col">
                                <input type="text" class="form-control" id="localidad" 
                                       placeholder="Introduce la Localidad" name="localidad">
                            </div>
                            <div class="col">${ requestScope.msgErrorLocalidad }</div>
                        </div><br/>
                        <button type="submit" class="btn btn-primary">Grabar</button>
                    </form> 

                </div>
            </div>
        </div>
    </body>
</html>
