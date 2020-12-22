package com.tareas.model;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import com.biblioteca.excepciones.DBException;
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
        tareas=new HashMap<Integer,Libro>();
        tareas.put(1, new Tarea(1,"Tocan las Campanas a Concejo","agustin lasai rodrigez",23.0,10,true));
        tareas.put(2, new Tarea(2,"Don Quijote de la Mancha","Miguel de Cervantes",19.0,15,false));
        tareas.put(3, new Tarea(3,"El Tamborilero","Pedro Luís Macías",13.0,32,true));
        tareas.put(4, new Tarea(4,"Campos de Castilla","Antonio Machado",12.0,22,true));
        //ultimoId = 4;
        usuarios = new HashSet<Usuario>();
        usuarios.add(new Usuario("Juan@gmail.com", "Juan Sandoval"));
        usuarios.add(new Usuario("Pedrosanto@gmail.com", "Pedro Altoveri"));
    }
    public DB() {
        
    }
    
    public static synchronized Libro getLibro(Integer id){
        Libro l = libros.get(id);
        return l;
    }
    
    public static synchronized void addLibro(Libro libro) throws DBException{
        if(libros.containsKey(libro.getId())){
            throw new DBException("El libro ya existe con el Id: "+libro.getId());
        }
        
        libros.put(libro.getId(), libro);
        
    }
    
    public static synchronized void alquilaLibro(int id){
        //mejorar lanzar una exceopcion si id no existe id
        //sino 
        libros.get(id).setDisponible(false);
    }
    
    public static synchronized Collection<Libro> getAllLibros(){
        return libros.values();
    }
    
    public  static  Collection<Libro> getLibrosPrestados(){
        Set<Libro> prestados = new HashSet<Libro>();
        for(Libro l: libros.values()){
            if(! l.isDisponible()){
                prestados.add(l);
            }
        }        
        return prestados;
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
