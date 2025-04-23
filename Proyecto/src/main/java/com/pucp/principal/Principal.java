/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.pucp.principal;
import com.pucp.da.usuarios.UsuarioCRUD;
import com.pucp.da.usuarios.AdministradorCRUD;
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
            
            //Actualizar datos
            user2.setCorreo("IloveDogs@gmail.com");
            user2.setNombreUsuario("IloveDogs");
            usuarioCRUD.actualizar(user2);
            
            ArrayList<Usuario> usuarios = usuarioCRUD.listarTodos();
            for(Usuario user : usuarios){
                System.out.println(user);
            }  
            
        } catch(Exception ex){
            ex.printStackTrace();
        }
        
    }
}
