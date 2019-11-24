/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author DARWINFLORES
 */


public class Conexion {
       
    private String username = "postgres";
    private String password = "12345/-";
    private String host = "localhost";
    private String port = "5432";
    private String database = "db_radiografia";
    private String classname = "org.postgresql.Driver";
    private String url = "jdbc:postgresql://" + host + ":" + port + "/" + database;
    private Connection conn;

    public Conexion() {
        try {
            Class.forName(classname);
            conn = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException e) {
            System.out.println("Error " + e);
        } catch (SQLException e) {
            System.out.println("Error " + e);
        }

    }
    
    public Connection getConexion()
    {
        return conn;
    }
}
