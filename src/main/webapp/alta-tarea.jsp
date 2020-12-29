<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alta de Nueva Tarea</title>
        <%@include file="/WEB-INF/vista/estilos.jspf" %>
    </head>
    <body>
        <div class="container">

            <%@include file="/WEB-INF/vista/cabecera.jspf" %>
            <%@include file="/WEB-INF/vista/navegacion.jspf" %>
            <h1>Alta Tarea</h1>
            
             <!-- mensaje error alta -->
            <c:if test="${not empty requestScope.msgErrorAlta }" >
                <div class="alert alert-success" role="alert">
                    ${requestScope.msgErrorAlta}
                </div>
            </c:if>
            <form action="alta-tarea" method="post">
                <!--<input type="text" name="idProd" value="id Producto" /> -->
                <div class="row">
                    <div class="col">
                        <input type="number" class="form-control" id="id" placeholder="Introduce Id Tarea" name="id"/>
                    </div>
                    <div class="col">${requestScope.msgErrorId }</div>
                </div>
                <div class="row">
                    <div class="col">
                        <input type="text" class="form-control" id="descrip" placeholder="Introduce Descripción" name="descrip"/>
                    </div>
                     <div class="col">${requestScope.msgErrorDescrip }</div>
                </div><br />
                <div class="row">
                    <div class="col">
                        <label> Selecciona un Estado</label>
                        <select name ="estado" id="estado"> 
                            <option value="TO-DO">TO-DO</option>
                            <option value="IN-PROGRESS">IN-PROGRESS</option>
                            <option value="DONE">DONE</option>
                        </select>
                    </div>
                    <div class="col">${ requestScope.msgErrorEstado }</div>
                </div>  
                <br />
                <button type="submit" class="btn btn-primary">Grabar Nueva Tarea</button>             
            </form> 
        </div>
    </body>
</html>
