/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tareas.web;

import com.tareas.excepciones.DBException;
import com.tareas.model.DB;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CambioEstadoTareaServlet3", urlPatterns = {"/cambio-estado-tarea23"})
public class CambioEstadoTareaServlet3 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        //leer param id
        //validar 
        //cambiar estado
        //despachar la peticion a jsp mtto-tareas
        //
        String sId=req.getParameter("id");
        String mensaje = null;
        int id = 0;
        
        if (sId == null && sId.trim().length()==0) {
            mensaje="Indicar id de tarea para cambiar estado";
        }else{
            try {
                id=Integer.parseInt(sId);
            } catch (NumberFormatException e) {

                mensaje="Indicar id de Tarea en formato correcto " + e.getMessage();
            }
        }
        
        if (mensaje==null) {
            try {
                DB.cambioEstadoTarea(id, "DONE");
            } catch (DBException ex) {
                mensaje = ex.getMessage();
            }
           mensaje="Tarea Id: "+id+". Cambio estado Ok";
        }
        
        RequestDispatcher rd = req.getRequestDispatcher("/mtto-tareas.jsp");
        //
        req.setAttribute("mensaje", mensaje);
        rd.forward(req, resp);

    }

    
}
