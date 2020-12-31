/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tareas.web;

import com.tareas.excepciones.LoginException;
import com.tareas.servicios.LoginService;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        //leer param
        String paramEmail = req.getParameter("email");
        String paramClave = req.getParameter("clave");
        
        String msgErrorEmail = null;
        String msgErrorClave = null;
        String msgErrorLogin = null;
        boolean valido = true;
        
        //validar
        
        if (paramEmail==null || paramEmail.length()==0) {
            paramEmail="Introduzca Email correcto";
            valido = false;
        }
        
        if (paramClave==null || paramClave.length()==0) {
            paramClave="Introduzca Clave correcta";
            valido = false;
        }
        
        //si Ok
         if(valido){
            try {
                //SI TODO OK
                HttpSession sesion = req.getSession();
                LoginService servicio = new LoginService();
                servicio.Login(paramEmail, paramClave, sesion);
            } catch (LoginException ex) {
                msgErrorLogin = ex.getMessage();
                valido = false;
            }
        }
        
        //si error ir a  login.jsp y mostrar mensajes de error        
        //si ok  index.jsp
        String jspAMostrar = "";
        if (valido) {
            jspAMostrar = "index.jsp";
        } else {
            jspAMostrar = "login.jsp";
            req.setAttribute("msgErrorEmail", msgErrorEmail);
            req.setAttribute("msgErrorClave", msgErrorClave);
            req.setAttribute("msgErrorLogin", msgErrorLogin);
        }
        
        RequestDispatcher rd = req.getRequestDispatcher(jspAMostrar);
        rd.forward(req, resp);
         

    }

    
}
