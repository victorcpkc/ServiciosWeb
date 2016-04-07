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

import edu.uama.pos.carreras.ipn.ConsultaOfertaIPN;
import edu.uama.pos.carreras.uacm.ConsultaOfertaUACM;
import edu.uama.pos.carreras.uaem.ConsultaOfertaUAEM;
import edu.uama.pos.carreras.uam.ConsultaOfertaUAM;
import edu.uama.pos.carreras.unam.ConsultaOfertaUNAM;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * @author Víctor M. Campuzano Pineda
 */
@WebService(serviceName = "OfertaEducativa")
public class OfertaEducativa {
    
    private Class[] consultas = {ConsultaOfertaIPN.class, ConsultaOfertaUAM.class, 
        ConsultaOfertaUNAM.class, ConsultaOfertaUAEM.class, ConsultaOfertaUACM.class};
    
    private ConsultaOferta[] oferta= {
            new ConsultaOfertaIPN(),
            new ConsultaOfertaUAM(),
            new ConsultaOfertaUNAM(),
            new ConsultaOfertaUAEM(),
            new ConsultaOfertaUACM()
        };

    @WebMethod
    public int numeroInstituciones(){
        return consultas.length;
    }
    
    @WebMethod
    public int numeroProgramasEstudio(@WebParam String siglas){
        for(ConsultaOferta consulta: oferta){
            if(consulta.getSiglas().equals(siglas))
                try {
                    return consulta.numeroCarrerasDisponibles();
            } catch (SQLException ex) {
                Logger.getLogger(OfertaEducativa.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return 0;
    }
    
    @WebMethod
    public String[] dondeOfrecen(@WebParam String palabra){
        ArrayList<String> opciones = new ArrayList();
        for(ConsultaOferta consulta: oferta){
            try {
                if(consulta.nombreCarreraContiene(palabra))
                    opciones.add(consulta.getSiglas());
            } catch (SQLException ex) {
                Logger.getLogger(OfertaEducativa.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return opciones.toArray(new String[opciones.size()]);
    }
    
    @WebMethod
    public String[] lasMasDuraderoDeTodos(){
        int max=0;
        LinkedList<Carrera> carreras = new LinkedList();
        for(ConsultaOferta consulta: oferta){
            try {
                List<Carrera> c = consulta.carreraMayorDuracion();
                if(!c.isEmpty() && max<c.get(0).getDuracion()*c.get(0).getMesesPeriodo()){
                    carreras.clear();
                    carreras.addAll(c);
                    max = c.get(0).getDuracion()*c.get(0).getMesesPeriodo();
                }else if(!c.isEmpty() && max==c.get(0).getDuracion()*c.get(0).getMesesPeriodo()){
                    carreras.addAll(c);
                }
            } catch (SQLException ex) {
                Logger.getLogger(OfertaEducativa.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        ArrayList<String> opciones = new ArrayList();
        for(Carrera c: carreras){
            opciones.add(c.getNombre()+":"+c.getDuracion()*c.getMesesPeriodo()+" meses");
        }
        return opciones.toArray(new String[opciones.size()]);
    }
    
    @WebMethod
    public String[] lasMenosCreditosDeTodos(){
        int min=21474836;
        LinkedList<Carrera> carreras = new LinkedList();
        for(ConsultaOferta consulta: oferta){
            try {
                List<Carrera> c = consulta.carreraMenosCreditos();
                if(!c.isEmpty() && min>c.get(0).getCreditos()) {
                    carreras.clear();
                    carreras.addAll(c);
                    min = c.get(0).getCreditos();
                } else if(!c.isEmpty() && min==c.get(0).getCreditos()) {
                    carreras.addAll(c);
                }
            } catch (SQLException ex) {
                Logger.getLogger(OfertaEducativa.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        ArrayList<String> opciones = new ArrayList();
        for(Carrera c: carreras){
            opciones.add(c.getNombre()+":"+c.getCreditos()+" créditos");
        }
        return opciones.toArray(new String[opciones.size()]);
    }
    
    @WebMethod
    public String[] dondeOfrecen2(@WebParam String[] palabrasClave){
        ArrayList<String> opciones = new ArrayList();
        for(ConsultaOferta consulta: oferta){
            try {
                for(String palabra: palabrasClave){
                    if(consulta.nombreCarreraContiene(palabra)){
                        opciones.add(consulta.getSiglas());
                        break;
                    }
                }
            } catch (SQLException ex) {
                Logger.getLogger(OfertaEducativa.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return opciones.toArray(new String[opciones.size()]);
    }
}
