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

package edu.uama.pos.carreras;

/**
 * Tipo de dato carrera.
 * Tiene la finalidad estandarizar el tipo de dato carrera sin importar la 
 * definición en la base de datos.
 * @author Víctor M. Campuzano Pineda, e-mail: al210331497@alumnos.azc.uam.mx
 */
public class Carrera {

    /**
     * Nombre de la carrera.
     */
    private String nombre;
    
    /**
     * Créditos mínimos.
     */
    private int creditos;
    
    /**
     * Cantidad de periodos sugeridos para terminar la carrera.
     */
    private int duracion;
    
    /**
     * Duración en meses del periodo.
     */
    private int mesesPeriodo;

    public Carrera() {
    }

    public Carrera(String nombre, int creditos, int duracion, int mesesPeriodo) {
        this.nombre = nombre;
        this.creditos = creditos;
        this.duracion = duracion;
        this.mesesPeriodo = mesesPeriodo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCreditos() {
        return creditos;
    }

    public void setCreditos(int creditos) {
        this.creditos = creditos;
    }

    public int getDuracion() {
        return duracion;
    }

    public void setDuracion(int duracion) {
        this.duracion = duracion;
    }

    public int getMesesPeriodo() {
        return mesesPeriodo;
    }

    public void setMesesPeriodo(int mesesPeriodo) {
        this.mesesPeriodo = mesesPeriodo;
    }
    
    
}
