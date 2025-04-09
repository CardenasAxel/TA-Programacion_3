import java.util.ArrayList;

public class Administrador extends Usuario{
	private String claveMaestra;
	private int idAdministrador;
	private ArrayList<Reporte> adminReportes;
	
	// Constructor sin parámetros
    public Administrador() {
        super(); 
        this.adminReportes = new ArrayList<>(); 
    }

    public Administrador(String claveMaestra, int idAdministrador) {
        super(); 
        this.claveMaestra = claveMaestra;
        this.idAdministrador = idAdministrador;
        this.adminReportes = new ArrayList<>();
    }

    public Administrador(int idUsuario, int codigoPUCP, String nombreUsuario, String contrasena, 
		String nombre, String correo, 
                        String claveMaestra, int idAdministrador) {
        super(idUsuario, codigoPUCP, nombreUsuario, contrasena, nombre, correo); 
        this.claveMaestra = claveMaestra;
        this.idAdministrador = idAdministrador;
        this.adminReportes = new ArrayList<>();
    }

    // Getters y setters
    public String getClaveMaestra() {
        return claveMaestra;
    }

    public void setClaveMaestra(String claveMaestra) {
        this.claveMaestra = claveMaestra;
    }

    public int getIdAdministrador() {
        return idAdministrador;
    }

    public void setIdAdministrador(int idAdministrador) {
        this.idAdministrador = idAdministrador;
    }

}