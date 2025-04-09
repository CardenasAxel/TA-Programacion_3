import java.util.ArrayList;
import java.util.Date;

public class Publicacion {
    private int idPublicacion;
    private String titulo;
    private String descripcion;
    private EstadoPublicacion estado;
    private ArrayList<Comentario> comentarios;
    private ArrayList<Curso> publicacionesCursos;
    private ArrayList<Especialidad> publicacionesEspecialidades;
    private ArrayList<Facultad> publicacionesFacultades;
	private ArrayList<Notificacion> notificaciones;
	private ArrayList<Reporte> publicacionReportes;
	private Date fechaPublicacion;
	
	public Publicacion(){
		this.comentarios=new ArrayList<>();
		this.publicacionesCursos=new ArrayList<>();
		this.publicacionesEspecialidades=new ArrayList<>();
		this.publicacionesFacultades=new ArrayList<>();
		this.notificaciones=new ArrayList<>();
		this.publicacionReportes=new ArrayList<>();
		this.fechaPublicacion=new Date();
	}
	
    public Publicacion(int idPublicacion, String titulo, String descripcion, EstadoPublicacion estado, 
                        Date fechaPublicacion){
        this.idPublicacion=idPublicacion;
        this.titulo=titulo;
        this.descripcion=descripcion;
        this.estado=estado;
        this.fechaPublicacion=fechaPublicacion;
        this.comentarios=new ArrayList<>();
		this.publicacionesCursos=new ArrayList<>();
		this.publicacionesEspecialidades=new ArrayList<>();
		this.publicacionesFacultades=new ArrayList<>();
		this.notificaciones=new ArrayList<>();
		this.publicacionReportes=new ArrayList<>();
    }

    public int getIdPublicacion(){
        return idPublicacion;
    }

    public void setIdPublicacion(int idPublicacion){
        this.idPublicacion = idPublicacion;
    }

    public String getTitulo(){
        return titulo;
    }

    public void setTitulo(String titulo){
        this.titulo = titulo;
    }

    public String getDescripcion(){
        return descripcion;
    }

    public void setDescripcion(String descripcion){
        this.descripcion = descripcion;
    }

    public EstadoPublicacion getEstado(){
        return estado;
    }

    public void setEstado(EstadoPublicacion estado){
        this.estado = estado;
    }

    public Date getFechaPublicacion() {
        return fechaPublicacion;
    }

    public void setFechaPublicacion(Date fechaPublicacion){
        this.fechaPublicacion = fechaPublicacion;
    }
}