/*
 * Copyright (C) 2016 Brenda
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
package edu.uama.pos.carreras.uacm;

import edu.uama.pos.carreras.ConsultaOferta;
import edu.uama.pos.carreras.Carrera;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author Brenda
 */
public class ConsultaOfertaUACM extends ConsultaOferta{
    public ConsultaOfertaUACM(Connection conn) {
        super(conn, "UACM", "Universidad Autonoma de la Ciudad de Mexico");  
    }
    
    public int numeroCarrerasDisponibles() throws SQLException {
        //Consulta a la base de datos que cuenta el número de carreras.
        String query="SELECT count(nombre) FROM carrera";  
        //String query="select  idcarrera from carrera order by idcarrera desc LIMIT 1"; 
        
        //Ejecuta la consulta a la base de datos.
        ResultSet result = conn.createStatement().executeQuery(query);
        //Si contine un resultado regresa el valor del resultado.
        if(result.first()){
            return result.getInt(1);
        } 
        return 0;
    }

    public boolean nombreCarreraContiene(String palabra) throws SQLException {
        //Consulta a la base de datos obtiene las carreras que contienen la palabra
        String query="select idcarrera from carrera "
                + "where instr(lower(nombre), lower('"+palabra+"'))>0";;
        
        //Ejecuta la consulta a la base de datos.
        ResultSet result = conn.createStatement().executeQuery(query);
        //Si contiene resultado regresa true, si está vacio false.
        return result.first();
    }

    //consulta la duracion de las carreras, arroja unicamente el id de la duracion para 1=6 semestres, 2=8Sem y 3 = 10 sem
    public List<Carrera> carreraMayorDuracion() throws SQLException {
        List<Carrera> mayor = new LinkedList();
        
        //Consulta a la base de datos que obtiene las carreras con la mayor duración.
        String query="select * from carrera where duracion_idtable1 = "
                + "(select max(duracion_idtable1) from carrera)";             

        
        //Ejecuta la consulta a la base de datos.
        ResultSet result = conn.createStatement().executeQuery(query);
        //Recorre los resultados.
        while(result.next()){
            Carrera carrera = new Carrera(
                    result.getString("nombre"),                     // nombre de la carrera
                    result.getInt("creditos"),                      // créditos
                    result.getInt("duracion"),                      // duración,arroja unicamente el id de la duracion para 1=6 semestres, 2=8Sem y 3 = 10 sem
                    6);                                        //la duraicion es de 6 meses     
            mayor.add(carrera);
        } 
        return mayor;
    }

    @Override
    public List<Carrera> carreraMasCreditos() throws SQLException {
        List<Carrera> mayor = new LinkedList();
        
        //Consulta a la base de datos que obtiene las carreras con el máximo de créditos.
        String query="select * from carrera where duracion_idtable1 = "
                + "(select max(creditos) from carrera)";             

        
        //Ejecuta la consulta a la base de datos.
        ResultSet result = conn.createStatement().executeQuery(query);
        //Recorre los resultados.
        while(result.next()){
            Carrera carrera = new Carrera(
                    result.getString("nombre"),                     // nombre de la carrera
                    result.getInt("creditos"),                      // créditos
                    result.getInt("duracion"),                      // duración,arroja unicamente el id de la duracion para 1=6 semestres, 2=8Sem y 3 = 10 sem
                    6);                                        //la duraicion es de 6 meses                                          
            mayor.add(carrera);
        } 
        return mayor;
    }

    public List<Carrera> carreraMenosCreditos() throws SQLException {
        List<Carrera> mayor = new LinkedList();
        
        //Consulta a la base de datos que obtiene las carreras con el mínimo de créditos.
        String query="select * from carrera where duracion_idtable1 = "
                + "(select min(creditos) from carrera)";             

        
        //Ejecuta la consulta a la base de datos.
        ResultSet result = conn.createStatement().executeQuery(query);
        //Recorre los resultados.
        while(result.next()){
            Carrera carrera = new Carrera(
                    result.getString("nombre"),                     // nombre de la carrera
                    result.getInt("creditos"),                      //  créditos
                    result.getInt("duracion"),                      // duración,arroja unicamente el id de la duracion para 1=6 semestres, 2=8Sem y 3 = 10 sem
                    6);                                        //la duraicion es de 6 meses                                        
            mayor.add(carrera);
        } 
        return mayor;
    }

    public List<Carrera> carrerasDisponibles() throws SQLException {
        List<Carrera> mayor = new LinkedList();
        
        //Consulta a la base de datos para todas las carreras.
        String query="select * from carrera";            
        
        //Ejecuta la consulta a la base de datos.
        ResultSet result = conn.createStatement().executeQuery(query);
        //Recorre los resultados.
        while(result.next()){
            Carrera carrera = new Carrera(
                    result.getString("nombre"),                     //nombre de la carrera
                    result.getInt("creditos"),                      //créditos
                    result.getInt("duracion"),                      // duración,arroja unicamente el id de la duracion para 1=6 semestres, 2=8Sem y 3 = 10 sem
                    6);                                        //la duraicion es de 6 meses                                           
            mayor.add(carrera);
        } 
        return mayor;
    }
}
