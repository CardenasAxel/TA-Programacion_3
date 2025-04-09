import java.util.Date;

public class Comentario{
	private int idComentario;
	private String contenido;
	private int valoracion;
	private Date fecha;
	
	// Constructores
    public Comentario(){}
	
    public Comentario(int idComentario, String contenido, int valoracion, Date fecha) {
        this.idComentario = idComentario;
        this.contenido = contenido;
        this.valoracion = valoracion;
        this.fecha = fecha;
    }

    // Getters y setters
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
}