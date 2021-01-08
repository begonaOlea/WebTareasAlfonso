<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <%@include file="WEB-INF/vista/estilos.jspf" %>
    </head>
    <body>
        <div class="container" style="background: ${cookie.color.value}">

            <%@include file="WEB-INF/vista/cabecera.jspf" %>
            <%@include file="WEB-INF/vista/navegacion.jspf" %>

            <div class="row">
                <div class="col">
                    <h1>Pantalla Inicio de Tareas !!!</h1>
                </div>
            </div>
            <!--Para Cookies -->
            <div class="row">
                <div class="col-3">
                    <form action="preferencias" method="get">
                        <label> Seleccione un color preferente</label>
                        <select name ="colorPref"> 
                            <option value="#ff333f">Red</option>
                            <option value="#b2ff33">Green</option>
                            <option value="#fff633">Yelow</option>
                        </select>
                        <input type="submit" value="Enviar"></input>
                    </form>
                </div>
            </div>

        </div>
    </body>
</html>