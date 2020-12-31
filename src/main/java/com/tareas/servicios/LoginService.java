
package com.tareas.servicios;

import com.tareas.model.DB;
import com.tareas.excepciones.LoginException;
import com.tareas.model.Usuario;
import java.util.Collection;
import javax.servlet.http.HttpSession;

public class LoginService {
    
    public void Login(String email,String clave, HttpSession sesion) throws LoginException{
       Collection<Usuario> usuarios=DB.getUsuarios();
       Usuario usuEnc = null;
        for (Usuario usu : usuarios) {
            if (usu.getEmail().equals(email)) {
                usuEnc=usu;
                break;
            }
        }
        //si no existe lanzo excepcion 
        if (usuEnc == null) {
            throw new LoginException("El usuario no existe. Debe registrarse.");
        }else{
            //ver si clave ok
            if(usuEnc.getClave().equals(clave)){
                //añadir a sesion
                sesion.setAttribute("usuario", usuEnc);
            }else{
                throw new LoginException("Clave no válida");
            }
        }
    }
    
    public void logout(HttpSession sesion){
        sesion.invalidate();
    }
}
