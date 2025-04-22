/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.pucp.principal;
import com.pucp.modelo.usuarios.Usuario;
import com.pucp.modelo.usuarios.Administrator;
/**
 *
 * @author Axel
 */
public class Principal {

    public static void main(String[] args) {
        Usuario usuario1= new Usuario();
        Administrator admin1= new Admin();

        UsuarioCRUD usuarioCRUD = new UsuarioCRUD();
        AdministratorCRUD adminCRUD = new AdministratorCRUD();
        
        System.out.println("Hola davmos!");
    }
}
