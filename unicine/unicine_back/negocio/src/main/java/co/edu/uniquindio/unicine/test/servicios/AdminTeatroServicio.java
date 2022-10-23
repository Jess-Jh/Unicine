package co.edu.uniquindio.unicine.test.servicios;

import co.edu.uniquindio.unicine.test.entidades.Funcion;
import co.edu.uniquindio.unicine.test.entidades.Horario;

public interface AdminTeatroServicio {

    Horario crearHorario(Horario horario);

    Funcion crearFuncion(Funcion funcion);

}
