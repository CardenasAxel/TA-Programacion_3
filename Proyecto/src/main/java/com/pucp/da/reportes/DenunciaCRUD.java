/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pucp.da.reportes;

import com.pucp.config.DBManager;
import com.pucp.interfacesDAO.DenunciaDAO;
import com.pucp.modelo.denuncias.Denuncia;
import com.pucp.modelo.publicaciones.Publicacion;
import com.pucp.modelo.usuarios.Administrador;
import com.pucp.modelo.usuarios.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
/**
 *
 * @author Axel
 */
public class DenunciaCRUD implements DenunciaDAO{

    @Override
    public void insertar(Denuncia denuncia) {

    }

    @Override
    public ArrayList<Denuncia> listarTodos() {

    }

    @Override
    public Denuncia obtenerPorId(int id) {

    }

    @Override
    public void actualizar(Denuncia denuncia) {

    }

    @Override
    public void eliminar(int id) {

    }
    
    private void setParametrosDenuncia(PreparedStatement ps, Denuncia denun) throws SQLException{
        ps.setInt(1, denun.getIdDenuncia());
        ps.setInt(2, denun.getAutor().getIdPublicacion());
        ps.setInt(3, denun.getDenunciante().getIdUsuario());
        ps.setString(4, denun.getMotivo());
        ps.setDate(5, denun.getFechaDenuncia());
        ps.setInt(6,denun.getAdmin().getIdAdministrador());
        ps.setBoolean(7, denun.isActivo());
    }
    
    private Denuncia mapaDenuncia(ResultSet rs) throws SQLException{
        Denuncia denun = new Denuncia();
        Publicacion autor = new Publicacion();
        Usuario usu = new Usuario();
        Administrador admin = new Administrador();
        
        denun.setIdDenuncia(rs.getInt("id_reporte"));
        autor.setIdPublicacion(rs.getInt("autor"));
        denun.setAutor(autor);
        usu.setIdUsuario(rs.getInt("reportante"));
        denun.setDenunciante(usu);
        denun.setMotivo(rs.getString("motivo"));
        denun.setFechaDenuncia(rs.getDate("fecha_reporte"));
        admin.setIdAdministrador(rs.getInt("id_administrador"));
        denun.setActivo(rs.getBoolean("activo"));
        return denun;
    }
}
