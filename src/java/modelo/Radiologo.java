/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DARWINFLORES
 */
public class Radiologo{
    //Declaracion de variables
    private int _id;
    private String _nombre;
    private String _apellido;

      Statement state;
    ResultSet result;
    //Constructores

    public Radiologo() {
    }

    public Radiologo(int _id, String _nombre, String _apellido) {
        this._id = _id;
        this._nombre = _nombre;
        this._apellido = _apellido;
    
    }
    
    //Metodos gett and setter

    public int getId() {
        return _id;
    }

    public void setId(int _id) {
        this._id = _id;
    }

    public String getNombre() {
        return _nombre;
    }

    public void setNombre(String _nombre) {
        this._nombre = _nombre;
    }

    public String getApellido() {
        return _apellido;
    }

    public void setApellido(String _apellido) {
        this._apellido = _apellido;
    }


//Metodos de la clase guardar, mostrar, eliminar y modificar
    public boolean insertardatos() {
Conexion conectar = new Conexion();
        Connection cone = conectar.getConexion();
        try {
            String sql = "insert into tb_radiologo(radiologo_nombre,radiologo_apellido)  values(?,?);";
            PreparedStatement statement = cone.prepareStatement(sql);

           
            statement.setString(1, getNombre());
            statement.setString(2, getApellido());

            boolean estado = statement.executeUpdate() > 0;
            statement.close();
            cone.close();
            return estado;

        } catch (SQLException ex) {
            Logger.getLogger(Radiografia.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }
    
     public ArrayList<Radiologo> consultarRegistros() { //Mostrar todos los datos
        ArrayList<Radiologo> registros = new ArrayList();
Conexion conectar = new Conexion();
        Connection cone = conectar.getConexion();
        try {

            String miQuery = "select * from tb_radiologo order by radiologo_id desc";
            state = cone.createStatement();
            result = state.executeQuery(miQuery);
            while (result.next()) {
                
                
                registros.add(new Radiologo(result.getInt("radiologo_id"),result.getString("radiologo_nombre"), result.getString("radiologo_apellido")));

            }
 state.close();
            cone.close();
        } catch (SQLException ex) {
            Logger.getLogger(Radiografia.class.getName()).log(Level.SEVERE, null, ex);
        }

        return registros;
    }

         public ArrayList<Radiologo> consultarRegistrosPorId(int id_) { //Mostrar todos los datos pero por busqueda Id
        ArrayList<Radiologo> registros = new ArrayList();
Conexion conectar = new Conexion();
        Connection cone = conectar.getConexion();
        try {

            String miQuery = "select * from tb_radiologo where radiologo_id="+id_;
            state = cone.createStatement();
            result = state.executeQuery(miQuery);
            while (result.next()) {
                
                
                registros.add(new Radiologo(result.getInt("radiologo_id"),result.getString("radiologo_nombre"), result.getString("radiologo_apellido")));

            }

        } catch (SQLException ex) {
            Logger.getLogger(Radiografia.class.getName()).log(Level.SEVERE, null, ex);
        }

        return registros;
    }
     public boolean eliminarDatos() {
Conexion conectar = new Conexion();
        Connection cone = conectar.getConexion();
        try {
            String miQuery = "delete from tb_radiologo where radiologo_id='" + getId() + "'";
            int estado = 0;
            state = cone.createStatement();
            estado = state.executeUpdate(miQuery);
            if (estado == 1) {
                return true;
            }
 state.close();
            cone.close();
        } catch (SQLException ex) {
            Logger.getLogger(Radiografia.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }
    
    
}
