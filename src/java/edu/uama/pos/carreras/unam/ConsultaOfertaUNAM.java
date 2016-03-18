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

package edu.uama.pos.carreras.unam;

//import edu.uama.pos.carreras.ipn.*;
import edu.uama.pos.carreras.ConsultaOferta;
import edu.uama.pos.carreras.Carrera;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

/**
 * Consulta concreta a la base de datos de carreras del IPN
 * @author Víctor M. Campuzano Pineda, e-mail: al210331497@alumnos.azc.uam.mx
 */
public class ConsultaOfertaUNAM extends ConsultaOferta{

    public ConsultaOfertaUNAM(Connection conn) {
        super(conn, "UNAM", "Universidad Nacional Autonoma de México");          // <----- CAMBIAR LOS DATOS DE SU INSTITUCIÓN
    }

    @Override
    public int numeroCarrerasDisponibles() throws SQLException {
        //Consulta a la base de datos que cuenta el número de carreras.
        String query="select count(nombre_carrera) from Carreras";                   // <----- SOLO TIENEN QUE REEMPLAZAR EL QUERY
        
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
        //Consulta a la base de datos obtiene las carreras que contienen la palabra
        String query="select idcarrera from Carreras "
                + "where instr(lower(nombre), lower('"+palabra+"'))>0";// <----- SOLO TIENEN QUE REEMPLAZAR EL QUERY
        
        //Ejecuta la consulta a la base de datos.
        ResultSet result = conn.createStatement().executeQuery(query);
        //Si contiene resultado regresa true, si está vacio false.
        return result.first();
    }

    @Override
    public List<Carrera> carreraMayorDuracion() throws SQLException {
        List<Carrera> mayor = new LinkedList();
        
        //Consulta a la base de datos que obtiene las carreras con la mayor duración.
        String query="select * from Carreras where duracion = "
                + "(select max(num_periodos) from Carreras)";             // <----- REEMPLAZAR EL QUERY
        
        //Ejecuta la consulta a la base de datos.
        ResultSet result = conn.createStatement().executeQuery(query);
        //Recorre los resultados.
        while(result.next()){
            Carrera carrera = new Carrera(
                    result.getString("nombre_carrera"),                     // <-------- Columna con el nombre de la carrera
                    result.getInt("num_creditos"),                      // <-------- Columna con los créditos
                    result.getInt("num_periodos"),                      // <-------- Columna con la duración en periodos
                    6);                                             // <-------- Los periodos en el IPN duran 6 meses
            mayor.add(carrera);
        } 
        return mayor;
    }

    @Override
    public List<Carrera> carreraMasCreditos() throws SQLException {
        List<Carrera> mayor = new LinkedList();
        
        //Consulta a la base de datos que obtiene las carreras con el máximo de créditos.
        String query="select * from Carreras where duracion = "
                + "(select max(num_creditos) from Carreras)";             // <----- REEMPLAZAR EL QUERY
        
        //Ejecuta la consulta a la base de datos.
        ResultSet result = conn.createStatement().executeQuery(query);
        //Recorre los resultados.
        while(result.next()){
            Carrera carrera = new Carrera(
                    result.getString("nombre_carrera"),                     // <-------- Columna con el nombre de la carrera
                    result.getInt("num_creditos"),                      // <-------- Columna con los créditos
                    result.getInt("num_periodos"),                      // <-------- Columna con la duración en periodos
                    6);                                             // <-------- Los periodos en el IPN duran 6 meses
            mayor.add(carrera);
        } 
        return mayor;
    }

    @Override
    public List<Carrera> carreraMenosCreditos() throws SQLException {
        List<Carrera> mayor = new LinkedList();
        
        //Consulta a la base de datos que obtiene las carreras con el mínimo de créditos.
        String query="select * from Carreras where duracion = "
                + "(select min(num_creditos) from Carreras)";             // <----- REEMPLAZAR EL QUERY
        
        //Ejecuta la consulta a la base de datos.
        ResultSet result = conn.createStatement().executeQuery(query);
        //Recorre los resultados.
        while(result.next()){
            Carrera carrera = new Carrera(
                    result.getString("nombre_carrera"),                     // <-------- Columna con el nombre de la carrera
                    result.getInt("num_creditos"),                      // <-------- Columna con los créditos
                    result.getInt("num_periodos"),                      // <-------- Columna con la duración en periodos
                    6);                                             // <-------- Los periodos en el IPN duran 6 meses
            mayor.add(carrera);
        } 
        return mayor;
    }

    @Override
    public List<Carrera> carrerasDisponibles() throws SQLException {
        List<Carrera> mayor = new LinkedList();
        
        //Consulta a la base de datos para todas las carreras.
        String query="select * from Carreras";             // <----- REEMPLAZAR EL QUERY
        
        //Ejecuta la consulta a la base de datos.
        ResultSet result = conn.createStatement().executeQuery(query);
        //Recorre los resultados.
        while(result.next()){
            Carrera carrera = new Carrera(
                    result.getString("nombre_carrera"),                     // <-------- Columna con el nombre de la carrera
                    result.getInt("num_creditos"),                      // <-------- Columna con los créditos
                    result.getInt("num_periodos"),                      // <-------- Columna con la duración en periodos
                    6);                                             // <-------- Los periodos en el IPN duran 6 meses
            mayor.add(carrera);
        } 
        return mayor;
    }

}
