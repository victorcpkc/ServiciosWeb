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
package salud;

import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * @author Víctor M. Campuzano Pineda
 */
@WebService(serviceName = "IndiceMasaCorporal")
public class IndiceMasaCorporal {

    @WebMethod
    public int imc(@WebParam int edad, @WebParam float peso, 
            @WebParam float estatura, @WebParam String genero){
        float indice = (float) (peso/Math.pow(estatura, 2));
        return indice<18?-1:    //Bajo de peso
                (indice<26?0:   //Peso ideal
                (indice>28?2:   //Obesidad
                1));            //Sobrepeso
    }
}
