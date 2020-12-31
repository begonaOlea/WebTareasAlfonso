/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tareas.web;

import com.tareas.excepciones.DBException;
import com.tareas.model.DB;
import com.tareas.model.Usuario;
import java.io.IOException;
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
@WebServlet(name = "AltaUsuarioServlet", urlPatterns = {"/alta-usuario"})
public class AltaUsuarioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

         //leer param
        String email = request.getParameter("email");
        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos");
        String clave = request.getParameter("clave");
        String localidad = request.getParameter("localidad");
        //
        
        boolean valido = true;
        Usuario usuario;
        
         //Validarlos null o vacio
         
         String msgErrorEmail=null; 
         String msgErrorNombre=null; 
         String msgErrorApellidos=null; 
         String msgErrorClave=null; 
         String msgErrorLocalidad=null; 
         //
         String msgErrorAlta = null;
         String sJSPAMostrar=null; 
         
        System.out.println("<h1>Servlet Alta de Usuario</h1>");   
         
        if (email==null || email.trim().length()==0 ) {
            valido = false;
            msgErrorEmail="Introduzca un Email. válido";
        }
        
        if (nombre==null || nombre.trim().length()==0 ) {
            valido = false;
            msgErrorNombre="Introduce Nombre Usuario";
        }
        
        if (apellidos==null || apellidos.trim().length()==0 ) {
            valido = false;
            msgErrorApellidos="Introduce Apellidos del Usuario";
        }
        
        if (clave==null || clave.trim().length()==0 ) {
            valido = false;
            msgErrorClave="Introduce la contraseña del Uusario";
        }
        
        if (localidad==null || localidad.trim().length()==0 ) {
            valido = false;
            msgErrorClave="Introduce localidad Usuario";
        }
       
        //crear obj libro
        if (valido) {
             usuario = new Usuario(email,nombre,apellidos, clave,localidad);
            try {
                DB.addUsuario(usuario);
                //añadimos Usuario ATRIBUTO DE SESION
                //El usuario na manda la JSession. crea una sesion
                //sino devuelve la sesion existente para el id
                HttpSession sesion = request.getSession();
                sesion.setAttribute("usuario", usuario);
                
            } catch (DBException ex) {
                msgErrorAlta = ex.getMessage();
                valido=false;
            }
        }
                
        //DESPACHA LA RESPUESTA
        if (valido) {
            sJSPAMostrar = "/lista-usuarios.jsp";
        }else{
            sJSPAMostrar="/alta-usuario.jsp";
            request.setAttribute("msgErrorEmail", msgErrorEmail);
            request.setAttribute("msgErrorNombre", msgErrorNombre);
            request.setAttribute("msgErrorApellidos", msgErrorApellidos);
            request.setAttribute("msgErrorClave", msgErrorClave);
            request.setAttribute("msgErrorLocalidad", msgErrorLocalidad);
            //
            request.setAttribute("msgErrorAlta", msgErrorAlta);
        }
        RequestDispatcher rd = request.getRequestDispatcher(sJSPAMostrar);
        rd.forward(request, response);

    }

  
}
