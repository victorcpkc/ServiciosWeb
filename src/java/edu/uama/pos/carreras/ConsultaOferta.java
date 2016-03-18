/*
 * Copyright (C) 2016 Alumno
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
package edu.uama.pos.carreras;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

/**
 * Adapatador normailzar las consultas a las distintas bases de datos
 * @author Víctor M. Campuzano Pineda, e-mail: al210331497@alumnos.azc.uam.mx
 */
public abstract class ConsultaOferta {
    
    protected Connection conn;
    
    protected String siglas;
    
    protected String institucion;
    
    /**
     * Constructor básico para los adaptadores de consulta.
     * @param conn Conexión a base de datos JDBC.
     * @param siglas Siglas de la institución que están adapatado.
     * @param institucion Nombre de la institución que están adapatado.
     */
    public ConsultaOferta(Connection conn, String siglas, String institucion){
        this.conn = conn;
        this.siglas = siglas;
        this.institucion = institucion;
    }

    public String getSiglas() {
        return siglas;
    }

    public void setSiglas(String siglas) {
        this.siglas = siglas;
    }

    public String getInstitucion() {
        return institucion;
    }

    public void setInstitucion(String institucion) {
        this.institucion = institucion;
    }
    
    /**
     * Número de carreras disponibles en su institución educativa.
     * @return Cantidad de carreras.
     * @throws java.sql.SQLException
     */
    public abstract int numeroCarrerasDisponibles() throws SQLException;
    
    /**
     * Contesta a la pregunta ¿Entre las carreras de la institución existe una
     * carrera que contega <code>palabra</code> en el nombre?
     * @param palabra Palabra que van a comparar.
     * @return true si por lo menos una tupla contiene a <code>palabra</code>, 
     * false si no hay coincidencias
     * @throws java.sql.SQLException
     */
    public abstract boolean nombreCarreraContiene(String palabra) throws SQLException;
    
    /**
     * Obtiene las carreras con mayor duración.
     * @return Objeto Carrera con mayor duración (la duración en meses). 
     * @throws java.sql.SQLException 
     */
    public abstract List<Carrera> carreraMayorDuracion() throws SQLException;
    
    /**
     * Obtiene las carreras con mayor número de creditos.
     * @return Objeto Carrera con mayor duración.
     * @throws java.sql.SQLException
     */
    public abstract List<Carrera> carreraMasCreditos() throws SQLException;
    
    /**
     * Obtiene las carreras con mayor número de creditos.
     * @return Objeto Carrera con mayor duración.
     * @throws java.sql.SQLException
     */
    public abstract List<Carrera> carreraMenosCreditos() throws SQLException;
    
    /**
     * Todas las carreras con que cuenta la institución.
     * @return Lista con todas las carreras.
     */
    public abstract List<Carrera> carrerasDisponibles() throws SQLException;
}
