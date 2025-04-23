/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.pucp.principal;
import com.pucp.da.usuarios.*;
import com.pucp.modelo.usuarios.*;
import java.util.ArrayList;
/**
 *
 * @author Axel
 */
public class Principal {

    public static void main(String[] args) {
        try{
            //Pruebas de Usuario
            Usuario user1= new Usuario();
            //Setear datos del usuario
            user1.setCodigoPUCP(20201941);
            user1.setNombreUsuario("ExcelPremium");
            user1.setContrasena("123456789");
            user1.setNombre("Axel Cardenas");
            user1.setCorreo("axel@gmail.com");
            user1.setEstado(EstadoUsuario.HABILITADO);
            user1.setActivo(true);
            
            //Insertar a la bd
            UsuarioCRUD usuarioCRUD = new UsuarioCRUD();
            usuarioCRUD.insertar(user1);

            //Obtener usuario
            Usuario user2 = usuarioCRUD.obtenerPorId(user1.getIdUsuario());
            System.out.println("Usuario insertado recientemente: ");
            System.out.println(user2);
            System.out.println();
            
            //Actualizar datos
            user2.setCorreo("IloveDogs@gmail.com");
            user2.setNombreUsuario("IloveDogs");
            usuarioCRUD.actualizar(user2);
            
            ArrayList<Usuario> usuarios = usuarioCRUD.listarTodos();
            for(Usuario user : usuarios){
                System.out.println(user);
            }  
            
            //-----------------------------------
            //Pruebas de Usuario
            Administrador admin1 = new Administrador();
            //Setear datos del usuario
            admin1.setCodigoPUCP(20201942);
            admin1.setNombreUsuario("ExcelAdmin");
            admin1.setContrasena("123456789");
            admin1.setNombre("Axel Cardenas");
            admin1.setCorreo("axel.cardenas@gmail.com");
            admin1.setEstado(EstadoUsuario.HABILITADO);
            admin1.setActivo(true);
            admin1.setClaveMaestra("0000");
            //Insertar a la bd
            AdministradorCRUD adminCRUD = new AdministradorCRUD();
            adminCRUD.insertar(admin1);

            //Obtener usuario
            Administrador admin2 = adminCRUD.obtenerPorId(admin1.getIdUsuario());
            System.out.println("Administrador insertado recientemente: ");
            System.out.println(admin2);
            System.out.println();
            
            //Actualizar datos
            admin2.setCorreo("IloveCats@gmail.com");
            admin2.setNombreUsuario("IloveCats");
            adminCRUD.actualizar(admin2);
            
            ArrayList<Administrador> administradores = adminCRUD.listarTodos();
            for(Administrador admin : administradores){
                System.out.println(admin);
            }  
            
            
        } catch(Exception ex){
            ex.printStackTrace();
        }
        
    }
}
