/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

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
public class Radiografia extends Conexion {

    //Declaracion de variables
    private int _id;
    private String _nombre;
    private double _precio;

      Statement state;
    ResultSet result;
    //Constructores

    public Radiografia() {
    }

    public Radiografia(int _id, String _nombre, double _precio) {
        this._id = _id;
        this._nombre = _nombre;
        this._precio = _precio;
    }

//Metodos get and setter
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

    public double getPrecio() {
        return _precio;
    }

    public void setPrecio(double _precio) {
        this._precio = _precio;
    }

    //Metodos de la clase guardar, mostrar, eliminar y modificar
    public boolean insertardatos() {

        try {
            String sql = "insert into tb_tipo_radiografia(tipo_nombre,tipo_precio)  values(?,?);";
            PreparedStatement statement = getConexion().prepareStatement(sql);

           
            statement.setString(1, getNombre());
            statement.setDouble(2, getPrecio());

            boolean estado = statement.executeUpdate() > 0;
            statement.close();
            getConexion().close();
            return estado;

        } catch (SQLException ex) {
            Logger.getLogger(Radiografia.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }
    
     public ArrayList<Radiografia> consultarRegistros() {
        ArrayList<Radiografia> registros = new ArrayList();

        try {

            String miQuery = "select * from tb_tipo_radiografia order by tipo_id desc";
            state = getConexion().createStatement();
            result = state.executeQuery(miQuery);
            while (result.next()) {
                
                
                registros.add(new Radiografia(result.getInt("tipo_id"),result.getString("tipo_nombre"), result.getDouble("tipo_precio")));

            }

        } catch (SQLException ex) {
            Logger.getLogger(Radiografia.class.getName()).log(Level.SEVERE, null, ex);
        }

        return registros;
    }
     public ArrayList<Radiografia> consultarRegistrosPorId(int id_) {
        ArrayList<Radiografia> registros = new ArrayList();

        try {

            String miQuery = "select * from tb_tipo_radiografia where tipo_id="+id_;
            state = getConexion().createStatement();
            result = state.executeQuery(miQuery);
            while (result.next()) {
                
                
                registros.add(new Radiografia(result.getInt("tipo_id"),result.getString("tipo_nombre"), result.getDouble("tipo_precio")));

            }

        } catch (SQLException ex) {
            Logger.getLogger(Radiografia.class.getName()).log(Level.SEVERE, null, ex);
        }

        return registros;
    }
}
