/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pucp.modelo.denuncias;

import com.pucp.modelo.publicaciones.Publicacion;
import com.pucp.modelo.usuarios.Usuario;
import java.sql.Date;

/**
 *
 * @author Axel
 */
public class Denuncia {
    //ATRIBUTOS
    private int idDenuncia;
    private Publicacion autor;
    private Usuario denunciante;
    private String motivo;
    private Date fechaDenuncia;
    
    //CONSTRUCTORES
    public Denuncia() {
        this.autor = new Publicacion();
        this.denunciante = new Usuario();
    }
    
    //Falta implementar el constructor copia para PUBLICACION, USUARIO
    public Denuncia(int idDenuncia, Publicacion autor, Usuario reportante, String motivo, Date fechaDenuncia) {
        this.idDenuncia = idDenuncia;
        this.autor = autor;
        this.denunciante = reportante;
        this.motivo = motivo;
        this.fechaDenuncia = fechaDenuncia;
    }
    
    //GETTERS & SETTERS
    public int getIdDenuncia() {
        return idDenuncia;
    }

    public void setIdDenuncia(int idDenuncia) {
        this.idDenuncia = idDenuncia;
    }

    public Publicacion getAutor() {
        return autor;
    }

    public void setAutor(Publicacion autor) {
        this.autor = autor;
    }

    public Usuario getDenunciante() {
        return denunciante;
    }

    public void setDenunciante(Usuario denunciante) {
        this.denunciante = denunciante;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public Date getFechaDenuncia() {
        return fechaDenuncia;
    }

    public void setFechaDenuncia(Date fechaDenuncia) {
        this.fechaDenuncia = fechaDenuncia;
    }   

    @Override
    public String toString() {
        return "Denuncia{" + "idDenuncia=" + idDenuncia + ", autor=" + autor + ", denunciante=" + denunciante + ", motivo=" + motivo + ", fechaDenuncia=" + fechaDenuncia + '}';
    }

    
}
