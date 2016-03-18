
package edu.uama.pos.carreras;

import edu.uama.pos.carreras.ipn.ConsultaOfertaIPN;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Genera la conexión a la base de datos y prueba las consultas.
 * @author Víctor M. Campuzano Pineda, e-mail: al210331497@alumnos.azc.uam.mx
 */
public class Main {
    
    public static Connection createOfertaIPNConneciton(){
        String direccion = "localhost/ofertaIPN";                       // <---- INFORMACION DE SU BASE DE DATOS
        String usuario = "servicios";
        String pass = "poserv";
        Connection conn= null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
             conn= DriverManager.getConnection( "jdbc:mysql://"+direccion,usuario,pass);
        }catch(Exception ex){}
        return conn;
    }

    public static Connection createOfertaUACMConneciton(){
        String direccion = "localhost/UACM";                       // <---- INFORMACION DE SU BASE DE DATOS
        String usuario = "servicios";
        String pass = "poserv";
        Connection conn= null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
             conn= DriverManager.getConnection( "jdbc:mysql://"+direccion,usuario,pass);
        }catch(Exception ex){}
        return conn;
    }

    public static void main(String[] args) {
        
    }

}
