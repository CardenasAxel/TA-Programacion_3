/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pucp.modelo.publicaciones;

import com.pucp.modelo.categorias.Curso;
import com.pucp.modelo.categorias.Especialidad;
import com.pucp.modelo.categorias.Facultad;
import com.pucp.modelo.notificaciones.Notificacion;
import com.pucp.modelo.reportes.Denuncia;

import java.util.ArrayList;

//----------IMAGEN----------
import java.awt.Image;
import java.io.File;
import java.io.IOException;
import java.sql.Date;
import javax.imageio.ImageIO;

/**
 *
 * @author Axel
 */
public class Publicacion {
    //ATRIBUTOS
    private int idPublicacion;
    private String titulo;
    private String descripcion;
    private EstadoPublicacion estado;
    private ArrayList<Comentario> comentarios;
    private ArrayList<Curso> publicacionesCursos;
    private ArrayList<Especialidad> publicacionesEspecialidades;
    private ArrayList<Facultad> publicacionesFacultades;
    private ArrayList<Notificacion> notificaciones;
    private ArrayList<Denuncia> publicacionDenuncias;
    private Date fechaPublicacion;
    //Nuevo
    private Image imagen;
    private String rutaImagen;

    //CONSTRUCTORES
    public Publicacion() {
        this.publicacionesCursos = new ArrayList<>();
        this.publicacionesEspecialidades = new ArrayList<>();
        this.publicacionesFacultades = new ArrayList<>();
        this.notificaciones = new ArrayList<>();
        this.publicacionDenuncias = new ArrayList<>();
    }
    
    
    public Publicacion(int idPublicacion, String titulo, String descripcion, 
            EstadoPublicacion estado, Date fechaPublicacion, String rutaImagen) {
        
        this.idPublicacion = idPublicacion;
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.estado = estado;
        this.comentarios = new ArrayList<>();
        this.publicacionesCursos = new ArrayList<>();
        this.publicacionesEspecialidades = new ArrayList<>();
        this.publicacionesFacultades = new ArrayList<>();
        this.notificaciones = new ArrayList<>();
        this.publicacionDenuncias = new ArrayList<>();
        this.fechaPublicacion = fechaPublicacion;
        
        //Nuevo
        this.rutaImagen = rutaImagen;
        this.imagen = cargarImagen(this.rutaImagen);
    }

    //FUNCIONES EXTRA
    private Image cargarImagen(String rutaImagen){
        try{
            File file = new File(rutaImagen);
            if (file.exists() && !file.isDirectory()) {
                return ImageIO.read(file);
            } else {
                System.out.println("La ruta de la imagen no es válida: " + rutaImagen);
                return null;
            }
        } catch (IOException e) {
            System.out.println("Error al cargar la imagen: " + 
                    e.getMessage());
            return null;
        }
    }
    
    //FUNCIONES DE LOS ARRAY LIST
    public void agregarComentario(Comentario comentario) {
        this.comentarios.add(comentario);
    }
    
    public void eliminarComentario(Comentario comentario) {
        this.comentarios.remove(comentario);
    } 
    
    public void agregarCurso(Curso curso) {
        this.publicacionesCursos.add(curso);
    }
    
    public void eliminarCurso(Curso curso) {
        this.publicacionesCursos.remove(curso);
    } 
    
    public void agregarEspecialidad(Especialidad especialidad) {
        this.publicacionesEspecialidades.add(especialidad);
    }
    
    public void eliminarEspecialidad(Especialidad especialidad) {
        this.publicacionesEspecialidades.remove(especialidad);
    } 
    
    public void agregarFacultad(Facultad facultad) {
        this.publicacionesFacultades.add(facultad);
    }
    
    public void eliminarFacultad(Facultad facultad) {
        this.publicacionesFacultades.remove(facultad);
    } 
    
    public void agregarNotificacion(Notificacion notificacion) {
        this.notificaciones.add(notificacion);
    }
    
    public void eliminarNotificacion(Notificacion notificacion) {
        this.notificaciones.remove(notificacion);
    }
    
    public void agregarPublicacion(Denuncia denuncia) {
        this.publicacionDenuncias.add(denuncia);
    }
    
    public void eliminarPublicacion(Denuncia denuncia) {
        this.publicacionDenuncias.remove(denuncia);
    } 
    
    //GETTERS & SETTERS
    public int getIdPublicacion() {
        return idPublicacion;
    }

    public void setIdPublicacion(int idPublicacion) {
        this.idPublicacion = idPublicacion;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public EstadoPublicacion getEstado() {
        return estado;
    }

    public void setEstado(EstadoPublicacion estado) {
        this.estado = estado;
    }

    public ArrayList<Comentario> getComentarios() {
        return comentarios;
    }

    public void setComentarios(ArrayList<Comentario> comentarios) {
        this.comentarios = comentarios;
    }

    public ArrayList<Curso> getPublicacionesCursos() {
        return publicacionesCursos;
    }

    public void setPublicacionesCursos(ArrayList<Curso> publicacionesCursos) {
        this.publicacionesCursos = publicacionesCursos;
    }

    public ArrayList<Especialidad> getPublicacionesEspecialidades() {
        return publicacionesEspecialidades;
    }

    public void setPublicacionesEspecialidades(ArrayList<Especialidad> publicacionesEspecialidades) {
        this.publicacionesEspecialidades = publicacionesEspecialidades;
    }

    public ArrayList<Facultad> getPublicacionesFacultades() {
        return publicacionesFacultades;
    }

    public void setPublicacionesFacultades(ArrayList<Facultad> publicacionesFacultades) {
        this.publicacionesFacultades = publicacionesFacultades;
    }

    public ArrayList<Notificacion> getNotificaciones() {
        return notificaciones;
    }

    public void setNotificaciones(ArrayList<Notificacion> notificaciones) {
        this.notificaciones = notificaciones;
    }

    public ArrayList<Denuncia> getPublicacionDenuncias() {
        return publicacionDenuncias;
    }

    public void setPublicacionDenuncias(ArrayList<Denuncia> publicacionDenuncias) {
        this.publicacionDenuncias = publicacionDenuncias;
    }

    public Date getFechaPublicacion() {
        return fechaPublicacion;
    }

    public void setFechaPublicacion(Date fechaPublicacion) {
        this.fechaPublicacion = fechaPublicacion;
    }

    public Image getImagen() {
        return imagen;
    }
    
    public void setImagen(Image imagen) {
        this.imagen = imagen;
    }

    public String getRutaImagen() {
        return rutaImagen;
    }

    public void setRutaImagen(String rutaImagen) {
        this.rutaImagen = rutaImagen;
    }
    
    
}
