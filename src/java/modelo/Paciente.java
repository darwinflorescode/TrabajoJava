/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Date;
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
public class Paciente extends Conexion {

    //Variables abstraidas de los pacienctes
    private int _id;
    private String _codigo;
    private String _nombre;
    private String _apellido;
    private String _genero;
    private String _direccion;
    private String _fecha;
    private String _referencia;
    private double _total;
    private double _descuento;
    private int _radiografia_id;
    private int _radiologo_id;
    private double _precioActual_rad;

    Statement state;
    ResultSet result;

    //Cnstructores
    public Paciente() {
    }

    public Paciente(int _id, String _codigo, String _nombre, String _apellido, String _genero, String _direccion, String _fecha, String _referencia, double _total, double _descuento, int _radiografia_id, int _radiologo_id, double _precioActual_rad) {
        this._id = _id;
        this._codigo = _codigo;
        this._nombre = _nombre;
        this._apellido = _apellido;
        this._genero = _genero;
        this._direccion = _direccion;
        this._fecha = _fecha;
        this._referencia = _referencia;
        this._total = _total;
        this._descuento = _descuento;
        this._radiografia_id = _radiografia_id;
        this._radiologo_id = _radiologo_id;
        this._precioActual_rad = _precioActual_rad;
    }
    //Metodos getter and setter

    public int getId() {
        return _id;
    }

    public void setId(int _id) {
        this._id = _id;
    }

    public String getCodigo() {
        return _codigo;
    }

    public void setCodigo(String _codigo) {
        this._codigo = _codigo;
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

    public String getGenero() {
        return _genero;
    }

    public void setGenero(String _genero) {
        this._genero = _genero;
    }

    public String getDireccion() {
        return _direccion;
    }

    public void setDireccion(String _direccion) {
        this._direccion = _direccion;
    }

    public String getFecha() {
        return _fecha;
    }

    public void setFecha(String _fecha) {
        this._fecha = _fecha;
    }

    public String getReferencia() {
        return _referencia;
    }

    public void setReferencia(String _referencia) {
        this._referencia = _referencia;
    }

    public double getTotal() {
        return _total;
    }

    public void setTotal(double _total) {
        this._total = _total;
    }

    public double getDescuento() {
        return _descuento;
    }

    public void setDescuento(double _descuento) {
        this._descuento = _descuento;
    }

    public int getRadiografia_id() {
        return _radiografia_id;
    }

    public void setRadiografia_id(int _radiografia_id) {
        this._radiografia_id = _radiografia_id;
    }

    public int getRadiologo_id() {
        return _radiologo_id;
    }

    public void setRadiologo_id(int _radiologo_id) {
        this._radiologo_id = _radiologo_id;
    }

    public double getPrecioActual_rad() {
        return _precioActual_rad;
    }

    public void setPrecioActual_rad(double _precioActual_rad) {
        this._precioActual_rad = _precioActual_rad;
    }

    public ArrayList<Paciente> consultarRegistros() { // Metodo para mostrar todos los registros
        ArrayList<Paciente> registros = new ArrayList();

        try {

            String miQuery = "select tb_paciente.*,tb_radiologo.*,tb_tipo_radiografia.* from tb_paciente inner join tb_radiologo on tb_paciente.radiologo_id=tb_radiologo.radiologo_id inner join tb_tipo_radiografia on tb_paciente.radiografia_id=tb_tipo_radiografia.tipo_id";
            state = getConexion().createStatement();
            result = state.executeQuery(miQuery);
            while (result.next()) {

                registros.add(new Paciente(result.getInt("pac_id"), result.getString("pac_codigo"), result.getString("pac_nombre"), result.getString("pac_apellido"), result.getString("pac_genero"), result.getString("pac_direccion"), result.getString("pac_fecha"), result.getString("pac_referencia"), result.getDouble("pac_total_pago"), result.getDouble("pac_descuento"), result.getInt("radiografia_id"), result.getInt("radiologo_id"), result.getDouble("precio_rad")));

            }

        } catch (SQLException ex) {
            Logger.getLogger(Radiografia.class.getName()).log(Level.SEVERE, null, ex);
        }

        return registros;
    }

    public ArrayList<Paciente> consultarRegistrosPorId(int id_) {
        ArrayList<Paciente> registros = new ArrayList();

        try {

            String miQuery = "select tb_paciente.*,tb_radiologo.*,tb_tipo_radiografia.* from tb_paciente inner join tb_radiologo on tb_paciente.radiologo_id=tb_radiologo.radiologo_id inner join tb_tipo_radiografia on tb_paciente.radiografia_id=tb_tipo_radiografia.tipo_id where pac_id=" + id_;
            state = getConexion().createStatement();
            result = state.executeQuery(miQuery);
            while (result.next()) {

                registros.add(new Paciente(result.getInt("pac_id"), result.getString("pac_codigo"), result.getString("pac_nombre"), result.getString("pac_apellido"), result.getString("pac_genero"), result.getString("pac_direccion"), result.getString("pac_fecha"), result.getString("pac_referencia"), result.getDouble("pac_total_pago"), result.getDouble("pac_descuento"), result.getInt("radiografia_id"), result.getInt("radiologo_id"), result.getDouble("precio_rad")));

            }

        } catch (SQLException ex) {
            Logger.getLogger(Radiografia.class.getName()).log(Level.SEVERE, null, ex);
        }

        return registros;
    }

    //Metodos de la clase guardar, mostrar, eliminar y modificar
    public boolean insertardatos() {

        try {
            String sql = "insert into tb_paciente(pac_codigo,pac_nombre,pac_apellido,pac_genero,pac_direccion,pac_fecha,pac_referencia,pac_total_pago,pac_descuento,radiografia_id,radiologo_id,precio_rad)  values(?,?,?,?,?,?,?,?,?,?,?,?);";
            PreparedStatement statement = getConexion().prepareStatement(sql);

            statement.setString(1, getCodigo());
            statement.setString(2, getNombre());
            statement.setString(3, getApellido());
            statement.setString(4, getGenero());
            statement.setString(5, getDireccion());
            statement.setDate(6, Date.valueOf(getFecha()));
            statement.setString(7, getReferencia());
            statement.setDouble(8, getTotal());
            statement.setDouble(9, getDescuento());
            statement.setInt(10, getRadiografia_id());
            statement.setInt(11, getRadiologo_id());
            statement.setDouble(12, getPrecioActual_rad());

            boolean estado = statement.executeUpdate() > 0;
            statement.close();
            getConexion().close();
            return estado;

        } catch (SQLException ex) {
            Logger.getLogger(Paciente.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }
    
     public boolean eliminarDatos() {

        try {
            String miQuery = "delete from tb_paciente where pac_id='" + getId() + "'";
            int estado = 0;
            state = getConexion().createStatement();
            estado = state.executeUpdate(miQuery);
            if (estado == 1) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(Radiografia.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }
    
}
