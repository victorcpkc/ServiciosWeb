/*
 * Copyright (C) 2016 Víctor M. Campuzano Pineda
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

package edu.uama.pos.carreras.uaem;


import edu.uama.pos.carreras.ConsultaOferta;
import edu.uama.pos.carreras.Carrera;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

/**
 * Consulta concreta a la base de datos de carreras del IPN
 * @author Víctor M. Campuzano Pineda, e-mail: al210331497@alumnos.azc.uam.mx
 */
public class ConsultaOfertaUAEM extends ConsultaOferta{

    public ConsultaOfertaUAEM() {
        super("UAEM", "Universidad Autónoma del Estado de M");          // <----- CAMBIAR LOS DATOS DE SU INSTITUCIÓN
        conn = createConnection();
    }

    @Override
    protected final Connection createConnection(){
        String direccion = "localhost/ofertaUAEM";                       // <---- INFORMACION DE SU BASE DE DATOS
        String usuario = "servicios";
        String pass = "poserv";
        Connection conn= null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
             conn= DriverManager.getConnection( "jdbc:mysql://"+direccion,usuario,pass);
        }catch(Exception ex){}
        return conn;
    }

    @Override
    public int numeroCarrerasDisponibles() throws SQLException {
        verificarConexion();
        //Consulta a la base de datos que cuenta el número de carreras.
        String query="SELECT count(nombreCarrera) FROM carreras";                   // <----- SOLO TIENEN QUE REEMPLAZAR EL QUERY
        
        //Ejecuta la consulta a la base de datos.
        ResultSet result = conn.createStatement().executeQuery(query);
        //Si contine un resultado regresa el valor del resultado.
        if(result.first()){
            return result.getInt(1);
        } 
        return 0;
    }

    @Override
    public boolean nombreCarreraContiene(String palabra) throws SQLException {
        verificarConexion();
        //Consulta a la base de datos obtiene las carreras que contienen la palabra
        String query="SELECT idCarrera FROM carreras "
                + "WHERE instr(lower(nombreCarrera), lower('"+palabra+"'))>0";// <----- SOLO TIENEN QUE REEMPLAZAR EL QUERY
        
        //Ejecuta la consulta a la base de datos.
        ResultSet result = conn.createStatement().executeQuery(query);
        //Si contiene resultado regresa true, si está vacio false.
        return result.first();
    }

    @Override
    public List<Carrera> carreraMayorDuracion() throws SQLException {
        verificarConexion();
        List<Carrera> mayor = new LinkedList();
        
        //Consulta a la base de datos que obtiene las carreras con la mayor duración.
        String query="SELECT * FROM carreras WHERE duracion = "
                + "(SELECT max(duracion) FROM carreras)";             // <----- REEMPLAZAR EL QUERY
        
        //Ejecuta la consulta a la base de datos.
        ResultSet result = conn.createStatement().executeQuery(query);
        //Recorre los resultados.
        while(result.next()){
            Carrera carrera = new Carrera(
                    result.getString("nombreCarrera"),                     // <-------- Columna con el nombre de la carrera
                    result.getInt("numCreditos"),                      // <-------- Columna con los créditos
                    result.getInt("duracion"),                      // <-------- Columna con la duración en periodos
                    6);                                             // <-------- Los periodos en la UAEM duran 6 meses
            mayor.add(carrera);
        } 
        return mayor;
    }

    @Override
    public List<Carrera> carreraMasCreditos() throws SQLException {
        verificarConexion();
        List<Carrera> mayor = new LinkedList();
        
        //Consulta a la base de datos que obtiene las carreras con el máximo de créditos.
        String query="SELECT * FROM carreras WHERE numCreditos = "
                + "(SELECT max(numCreditos) FROM carreras)";             // <----- REEMPLAZAR EL QUERY
        
        //Ejecuta la consulta a la base de datos.
        ResultSet result = conn.createStatement().executeQuery(query);
        //Recorre los resultados.
        while(result.next()){
            Carrera carrera = new Carrera(
                    result.getString("nombreCarrera"),                     // <-------- Columna con el nombre de la carrera
                    result.getInt("numCreditos"),                      // <-------- Columna con los créditos
                    result.getInt("duracion"),                      // <-------- Columna con la duración en periodos
                    6);                                             // <-------- Los periodos en el IPN duran 6 meses
            mayor.add(carrera);
        } 
        return mayor;
    }

    @Override
    public List<Carrera> carreraMenosCreditos() throws SQLException {
        verificarConexion();
        List<Carrera> mayor = new LinkedList();
        
        //Consulta a la base de datos que obtiene las carreras con el mínimo de créditos.
        String query="SELECT * FROM carreras WHERE numCreditos = "
                + "(SELECT min(numCreditos) FROM carreras)";             // <----- REEMPLAZAR EL QUERY
        
        //Ejecuta la consulta a la base de datos.
        ResultSet result = conn.createStatement().executeQuery(query);
        //Recorre los resultados.
        while(result.next()){
            Carrera carrera = new Carrera(
                    result.getString("nombreCarrera"),                     // <-------- Columna con el nombre de la carrera
                    result.getInt("numCreditos"),                      // <-------- Columna con los créditos
                    result.getInt("duracion"),                      // <-------- Columna con la duración en periodos
                    6);                                             // <-------- Los periodos en el IPN duran 6 meses
            mayor.add(carrera);
        } 
        return mayor;
    }

    @Override
    public List<Carrera> carrerasDisponibles() throws SQLException {
        verificarConexion();
        List<Carrera> mayor = new LinkedList();
        
        //Consulta a la base de datos para todas las carreras.
        String query="SELECT * FROM carreras";             // <----- REEMPLAZAR EL QUERY
        
        //Ejecuta la consulta a la base de datos.
        ResultSet result = conn.createStatement().executeQuery(query);
        //Recorre los resultados.
        while(result.next()){
            Carrera carrera = new Carrera(
                    result.getString("nombreCarrera"),                     // <-------- Columna con el nombre de la carrera
                    result.getInt("numCreditos"),                      // <-------- Columna con los créditos
                    result.getInt("duracion"),                      // <-------- Columna con la duración en periodos
                    6);                                             // <-------- Los periodos en el IPN duran 6 meses
            mayor.add(carrera);
        } 
        return mayor;
    }

}
