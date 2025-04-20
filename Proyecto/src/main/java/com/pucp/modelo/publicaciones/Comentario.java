/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pucp.modelo.publicaciones;

import java.sql.Date;

/**
 *
 * @author Axel
 */
public class Comentario {
    //ATRIBUTOS
    private int idComentario;
    private String contenido;
    private int valoracion;
    private Date fecha;
    private boolean activo;

    //CONSTRUCTORES
    public Comentario() {
    }
    
    public Comentario(int idComentario, String contenido, int valoracion, Date fecha) {
        this.idComentario = idComentario;
        this.contenido = contenido;
        this.valoracion = valoracion;
        this.fecha = fecha;
    }

    //GETTERS & SETTERS
    public int getIdComentario() {
        return idComentario;
    }

    public void setIdComentario(int idComentario) {
        this.idComentario = idComentario;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public int getValoracion() {
        return valoracion;
    }

    public void setValoracion(int valoracion) {
        this.valoracion = valoracion;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public boolean isActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }
}
