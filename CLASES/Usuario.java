import java.util.ArrayList;

public class Usuario{
    private int idUsuario;
    private int codigoPUCP;
    private String nombreUsuario;
    private String contrasena;
    private String nombre;
    private String correo;
    private ArrayList<Publicacion> publicaciones;
    private ArrayList<Publicacion> favoritos;
    private ArrayList<Comentario> comentarios;
    private ArrayList<Notificacion> notificaciones;
	private ArrayList<Reporte> reportes;
	
	public Usuario(){
		this.publicaciones=new ArrayList<>();
		this.favoritos=new ArrayList<>();
		this.comentarios=new ArrayList<>();
		this.notificaciones=new ArrayList<>();
		this.reportes=new ArrayList<>();
	}
	
    public Usuario(int idUsuario, int codigoPUCP, String nombreUsuario, String contrasena, 
		String nombre, String correo){
        this.idUsuario=idUsuario;
        this.codigoPUCP=codigoPUCP;
        this.nombreUsuario=nombreUsuario;
        this.contrasena=contrasena;
        this.nombre=nombre;
        this.correo=correo;
        this.publicaciones=new ArrayList<>();
        this.favoritos=new ArrayList<>();
        this.comentarios=new ArrayList<>();
        this.notificaciones=new ArrayList<>();
		this.reportes=new ArrayList<>();
    }

    public int getIdUsuario(){
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario){
        this.idUsuario = idUsuario;
    }

    public int getCodigoPUCP(){
        return codigoPUCP;
    }

    public void setCodigoPUCP(int codigoPUCP){
        this.codigoPUCP = codigoPUCP;
    }

    public String getNombreUsuario(){
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario){
        this.nombreUsuario = nombreUsuario;
    }

    public String getContrasena(){
        return contrasena;
    }

    public void setContrasena(String contrasena){
        this.contrasena = contrasena;
    }

    public String getNombre(){
        return nombre;
    }

    public void setNombre(String nombre){
        this.nombre = nombre;
    }

    public String getCorreo(){
        return correo;
    }

    public void setCorreo(String correo){
        this.correo = correo;
    }

    public void agregarPublicacion(Publicacion pub){
        publicaciones.add(pub);
    }

    public void agregarFavorito(Publicacion pub){
        favoritos.add(pub);
    }

    public void agregarComentario(Comentario com){
        comentarios.add(com);
    }

    public void agregarNotificacion(Notificacion noti){
        notificaciones.add(noti);
    }
	
	public void agregarReporte(Reporte rep){
        reportes.add(rep);
    }
}
