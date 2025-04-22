/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.pucp.principal;
import com.pucp.da.usuarios.UsuarioCRUD;
import com.pucp.da.usuarios.AdministradorCRUD;
import com.pucp.modelo.usuarios.*;
/**
 *
 * @author Axel
 */
public class Principal {

    public static void main(String[] args) {
        Usuario usuario1= new Usuario(1, 20216287, "PedroGomez231", 
            "pedrito1298", "Pedro", "a20216287@pucp.edu.pe", EstadoUsuario.activo, 1);
        Usuario admin1 = new Administrador();

        UsuarioCRUD usuarioCRUD = new UsuarioCRUD();
        AdministradorCRUD adminCRUD = new AdministradorCRUD();
        
        System.out.println("Hola davmos!");
    }
}
