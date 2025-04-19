/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pucp.modelo.usuarios;

import com.pucp.modelo.denuncias.Denuncia;
import java.util.ArrayList;

/**
 *
 * @author Axel
 */
public class Administrador {
    //ATRIBUTOS
    private String claveMaestra;
    private int idAdministrador;
    private ArrayList<Denuncia> adminDenuncias;
	
    //CONSTRUCTORES
    public Administrador() {
        this.adminDenuncias = new ArrayList<>();
    }
    
    public Administrador(String claveMaestra, int idAdministrador, ArrayList<Denuncia> adminDenuncias) {
        this.claveMaestra = claveMaestra;
        this.idAdministrador = idAdministrador;
        this.adminDenuncias = new ArrayList<>();
    }

    //FUNCIONES PARA LOS ARRAY LIST
    public void agregarPublicacion(Denuncia denuncia) {
        this.adminDenuncias.add(denuncia);
    }
    
    public void eliminarPublicacion(Denuncia denuncia) {
        this.adminDenuncias.remove(denuncia);
    } 
    
    //GETTERS & SETTERS
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

    public ArrayList<Denuncia> getAdminDenuncias() {
        return new ArrayList<>(adminDenuncias);
    }
}
