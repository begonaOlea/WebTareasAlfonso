/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tareas.web;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "PreferenciasServlet", urlPatterns = {"/preferencias"})
public class PreferenciasServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String valorCookie = "#ec7063";
        String nombreCookie = "color";

        //leer param
        String paramColor = req.getParameter("colorPref");

        if (paramColor != null && paramColor.trim().length() > 0) {
            valorCookie = paramColor;
        }

        //crea la cookie  - SIEMPRE ANTES DE CREAR EL HTML DE SALIDA
        Cookie cookie = new Cookie(nombreCookie, valorCookie);
        cookie.setMaxAge(300); // dura 5 minutos // 300 sg

        resp.addCookie(cookie);
        
        //PrintWriter out = resp.getWriter();   // cierra las cabeceras
        //RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
        //rd.forward(req, resp);
        resp.sendRedirect("index.jsp");

    }
    
}
