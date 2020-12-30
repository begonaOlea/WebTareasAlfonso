/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tareas.model;

import com.tareas.excepciones.DBException;

/**
 *
 * @author Admin
 */
public class Prueba {
    public static void main(String[] args) throws DBException {
        System.out.println("Tareas: "+DB.getTareas());
        DB.cambioEstadoTarea(1, "DONE");
        System.out.println("Tareas Estado: "+DB.getTareasPorEstado(Estados.DONE));
        
        
    }
}
