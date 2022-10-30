package co.edu.uniquindio.unicine.test.servicios;

import co.edu.uniquindio.unicine.test.entidades.Funcion;
import co.edu.uniquindio.unicine.test.entidades.Horario;
import co.edu.uniquindio.unicine.test.entidades.Sala;
import co.edu.uniquindio.unicine.test.entidades.Teatro;

import java.util.List;

public interface AdminTeatroServicio {

    Horario crearHorario(Horario horario);

    List<Horario> listarHorarios();

    Horario obtenerHorario(Integer idHorario);

    void eliminarHorario(Integer idHorario);

    Funcion crearFuncion(Funcion funcion);

    Funcion actualizarFuncion(Funcion funcion);

    void eliminarFuncion(Integer idFuncion);

    List<Funcion> listarFunciones();

    Funcion obtenerFuncion(Integer idFuncion);

    Sala crearSala(Sala sala);

    Sala actualizarSala(Sala sala);

    void eliminarSala(Integer idSala);

    List<Sala> listarSalas();

    Sala obtenerSala(Integer idSala);

    Teatro crearTeatro(Teatro teatro);

    Teatro actualizarTeatro(Teatro teatro);

    void eliminarTeatro(Integer idTeatro);

    List<Teatro> listarTeatros();

    Teatro obtenerTeatro(Integer idTeatro);
}
