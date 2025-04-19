/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pucp.modelo.categorias;

/**
 *
 * @author Axel
 */
public class Especialidad {
    //ATRIBUTOS
    private int idEspecialidad;
    private String nombre;
	
    //CONSTRUCTORES
    public Especialidad(){

    }
	
    public Especialidad(int idEspecialidad, String nombre){
        this.idEspecialidad=idEspecialidad;
        this.nombre=nombre;
    }
	
    //GETTERS & SETTERS
    public int getIdEspecialidad(){
        return idEspecialidad;
    }

    public void setIdEspecialidad(int idEspecialidad){
        this.idEspecialidad=idEspecialidad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre){
        this.nombre=nombre;
    }
  
}
