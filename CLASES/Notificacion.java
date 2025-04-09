
public class Notificacion{
	
	private int idNotificacion;
	private String mensaje;
	private TipoNotificacion tipoNot;
	private int cantidad;
	
	//Constructores
	public Notificacion(){}

    public Notificacion(int idNotificacion, String mensaje, TipoNotificacion tipoNot, int cantidad) {
        this.idNotificacion = idNotificacion;
        this.mensaje = mensaje;
        this.tipoNot = tipoNot;
        this.cantidad = cantidad;
    }
	
	//Getters & Setters
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

	public TipoNotificacion getTipoNot() {
		return tipoNot;
	}

	public void setTipoNot(TipoNotificacion tipoNot) {
		this.tipoNot = tipoNot;
	}

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

}