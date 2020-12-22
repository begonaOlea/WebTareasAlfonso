package com.tareas.model;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import com.tareas.excepciones.DBException;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/**
 *
 * @author user
 */
public class DB {
    private static Map<Integer,Tarea> tareas;
    private static Set<Usuario> usuarios;
    //private static int ultimoId = 0;
    static{
        tareas=new HashMap<Integer,Tarea>();
        tareas.put(1, new Tarea(1,"Instalación Sistema","TO-DO",false));
        tareas.put(2, new Tarea(2,"A la espera de recepción","TO-DO",false));
        tareas.put(3, new Tarea(3,"Compra de materiales","TO-DO",false));
        tareas.put(4, new Tarea(4,"Chequear la red","TO-DO",false));
        tareas.put(5, new Tarea(4,"Revisión sistema alimentación","TO-DO",false));
        
        //ultimoId = 4;
        usuarios = new HashSet<Usuario>();
        usuarios.add(new Usuario("juan@gmail.com", "Juan Sandoval"));
        usuarios.add(new Usuario("pedrosanto@gmail.com", "Pedro Santoveri"));
    }
    public DB() {
        
    }
    
    public static synchronized Tarea getTarea(Integer id){
        Tarea l = tareas.get(id);
        return l;
    }
    
    public static synchronized void addTarea(Tarea tarea) throws DBException{
        if(tareas.containsKey(tarea.getIdTarea())){
            throw new DBException("La tarea ya existe con el Id: "+tarea.getIdTarea());
        }
        
        tareas.put(tarea.getIdTarea(), tarea);
    }
    
    public static synchronized void cambioEstadoTarea(int id, String estado){
        //mejorar lanzar una exceopcion si id no existe id
        //sino 
        //tareas.get(id).setDisponible(false);
    }
    
    public static synchronized Collection<Tarea> getAllTareas(){
        return tareas.values();
    }
    
    public  static  Collection<Tarea> getTareasEstado(String estado){
        Set<Tarea> tareasEstado = new HashSet<Tarea>();
        for(Tarea t: tareas.values()){
            if(t.getEstado()==estado){
                tareasEstado.add(t);
            }
        }        
        return tareasEstado;
    }
    
    public  static  Collection<Tarea> getTareas(){
        Set<Tarea> tareasAll = new HashSet<Tarea>();
        for(Tarea t: tareas.values()){
            tareasAll.add(t);
        }        
        return tareasAll;
    }
    
    public synchronized static Collection<Usuario> getUsuarios() {
        return usuarios;
    }

    public synchronized static void addUsuario(Usuario u) throws DBException {
        boolean seAñade = usuarios.add(u);
        if (!seAñade) {
            throw new DBException("El Usuario no ha sido añadido. Ya existe");
        }
    }
    
}
