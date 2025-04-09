import java.util.Date;

public class Reporte{
	private int idReporte;
	private Publicacion autor;
	private Usuario reportante;
	private String motivo;
	private Date fechaReporte;
	
	// Constructor sin parámetros
    public Reporte() {
		autor = new Publicacion();
		reportante = new Usuario();
    }

    // Constructor con todos los parámetros
    public Reporte(int idReporte, String motivo, Date fechaReporte) {
        this.idReporte = idReporte;
        autor = new Publicacion();
		reportante = new Usuario();
        this.motivo = motivo;
        this.fechaReporte = fechaReporte;
    }

    // Getters y setters
    public int getIdReporte() {
        return idReporte;
    }

    public void setIdReporte(int idReporte) {
        this.idReporte = idReporte;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public Date getFechaReporte() {
        return fechaReporte;
    }

    public void setFechaReporte(Date fechaReporte) {
        this.fechaReporte = fechaReporte;
    }
	
}