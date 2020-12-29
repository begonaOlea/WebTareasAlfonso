/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tareas.web;

import com.tareas.excepciones.DBException;
import com.tareas.model.DB;
import com.tareas.model.Tarea;
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
@WebServlet(name = "AltaTareaServlet", urlPatterns = {"/alta-tarea"})
public class AltaTareaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         //leer param
        String sId = req.getParameter("id");
        String descrip = req.getParameter("descrip");
        String estado = req.getParameter("estado");
        
        //
        boolean valido = true;
        int id = 0;
        
        Tarea tarea;
        
        String msgErrorId=null; 
        String msgErrorDescrip=null; 
        String msgErrorEstado=null; 
        String msgErrorAlta=null; 
        String sJSPAMostrar=null; 
        
        if (sId==null || sId.trim().length()==0 ) {
            valido = false;
            msgErrorId="Introduzca un Id. válido";
        }else{
            try{
                id = Integer.parseInt(sId);
            }catch(NumberFormatException e){
                valido = false;
                msgErrorId="Formato de Id. inválido";
            }
        }
        
        if (descrip==null || descrip.trim().length()==0 ) {
            valido = false;
            msgErrorDescrip="Introduce Descripción Tarea";
        }
        
        if (estado==null || estado.trim().length()==0 ) {
            valido = false;
            msgErrorEstado="Introduce Estado Tarea";
        }
        
        //crear obj Tarea
        if (valido) {
             tarea = new Tarea(id,descrip,estado,false);
            try {
                DB.addTarea(tarea);
            } catch (DBException ex) {
                msgErrorAlta = ex.getMessage();
                valido=false;
            }
        }
        
        //DESPACHA LA RESPUESTA
        if (valido) {
            //sJSPAMostrar = "/mtto-tareas.jsp";
            sJSPAMostrar = "/lista-tareas.jsp";
        }else{
            sJSPAMostrar="/alta-tarea.jsp";
            req.setAttribute("msgErrorId", msgErrorId);
            req.setAttribute("msgErrorDescrip", msgErrorDescrip);
            req.setAttribute("msgErrorEstado", msgErrorEstado);
            req.setAttribute("msgErrorAlta", msgErrorAlta);
        }
        RequestDispatcher rd = req.getRequestDispatcher(sJSPAMostrar);
        rd.forward(req, resp);
    }

   
}
