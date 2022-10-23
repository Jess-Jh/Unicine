package co.edu.uniquindio.unicine.test.servicios;

import co.edu.uniquindio.unicine.test.entidades.Ciudad;
import co.edu.uniquindio.unicine.test.entidades.Cupon;
import co.edu.uniquindio.unicine.test.entidades.Teatro;

public interface AdminServicio {

    Ciudad crearCiudad(Ciudad ciudad);

    Teatro crearTeatro(Teatro teatro);

    Cupon crearCupon(Cupon cupon);

}
