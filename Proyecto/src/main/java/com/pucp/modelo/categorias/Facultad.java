/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pucp.modelo.categorias;

/**
 *
 * @author Axel
 */
public class Facultad {
    //ATRIBUTOS
    private int idFacultad;
    private String nombre;

    //CONSTRUCTORES
    public Facultad() {
    }

    public Facultad(int idFacultad, String nombre) {
        this.idFacultad = idFacultad;
        this.nombre = nombre;
    }

    //GETTERS & SETTERS
    public int getIdFacultad() {
        return idFacultad;
    }

    public void setIdFacultad(int idFacultad) {
        this.idFacultad = idFacultad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
