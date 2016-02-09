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

package Math;

import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 * Colección de algunas operaciones Aritméticas y Trigonométricas.
 * @author Víctor M. Campuzano Pineda
 */
@WebService(serviceName = "CalculadoraService")
public class CalculadoraService {
    
    @WebMethod
    public int suma(@WebParam int num1, @WebParam int num2) {
        return num1+num2;
    }
    
    @WebMethod
    public int resta(@WebParam int num1, @WebParam int num2) {
        return num1-num2;
    }
    
    @WebMethod
    public double multiplicacion(@WebParam double num1, @WebParam double num2) {
        return num1*num2;
    }
    
    @WebMethod
    public double division(@WebParam double num1, @WebParam double num2) {
        return num1/num2;
    }
    
    @WebMethod
    public int divisionEntera(@WebParam int num1, @WebParam int num2) {
        return num1*num2;
    }
    
    @WebMethod
    public int residuo(@WebParam int num1, @WebParam int num2) {
        return num1%num2;
    }
    
    @WebMethod
    public double potencia(@WebParam double num, @WebParam double pot) {
        return Math.pow(num, pot);
    }
    
    @WebMethod
    public double raizCuadrada(@WebParam double num){
        return Math.sqrt(num);
    }
    
    @WebMethod
    public long factorial(@WebParam int num){
        long res=1L;
        for(int i=num; i>1; i--){
            res*=i;
        }
        return res;
    }
    
    @WebMethod
    public double seno(@WebParam double radian){
        return Math.sin(radian);
    }
    
    @WebMethod
    public double coseno(@WebParam double radian){
        return Math.cos(radian);
    }
    
    @WebMethod
    public double tangente(@WebParam double radian){
        return Math.tan(radian);
    }
    
    @WebMethod
    public double arcoseno(@WebParam double num){
        return Math.asin(num);
    }
    
    @WebMethod
    public double arcocoseno(@WebParam double num){
        return Math.acos(num);
    }
    
    @WebMethod
    public double arcotangente(@WebParam double num){
        return Math.atan(num);
    }
    
    
}
