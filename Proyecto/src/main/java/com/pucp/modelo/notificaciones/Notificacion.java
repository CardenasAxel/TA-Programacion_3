/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pucp.modelo.notificaciones;

import java.sql.Date;

/**
 *
 * @author Axel
 */
public class Notificacion {
    //ATRIBUTOS
    private int idNotificacion;
    private String mensaje;
    private TipoNotificacion tipoNotificacion;
    private int cantidad;
    private Date fecha;
    private boolean activo;

    //CONSTRUCTORES
    public Notificacion() {
    }
    
    public Notificacion(int idNotificacion, String mensaje, TipoNotificacion tipoNot, int cantidad, Date fecha, boolean activo) {
        this.idNotificacion = idNotificacion;
        this.mensaje = mensaje;
        this.tipoNotificacion = tipoNot;
        this.cantidad = cantidad;
        this.fecha = fecha;
        this.activo = activo;
    }
    
    //GETTERS & SETTERS

    public int getIdNotificacion() {
        return idNotificacion;
    }

    public void setIdNotificacion(int idNotificacion) {
        this.idNotificacion = idNotificacion;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public Date getFecha() {
        return fecha;
    }
    
    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public TipoNotificacion getTipoNotificacion() {
        return tipoNotificacion;
    }

    public void setTipoNotificacion(TipoNotificacion tipoNotificacion) {
        this.tipoNotificacion = tipoNotificacion;
    }

    public boolean isActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }
    
}
