package co.edu.uniquindio.unicine.test.servicios;

import co.edu.uniquindio.unicine.test.entidades.Funcion;
import co.edu.uniquindio.unicine.test.entidades.Horario;
import co.edu.uniquindio.unicine.test.entidades.Sala;
import co.edu.uniquindio.unicine.test.entidades.Teatro;

import java.util.List;

public interface AdminTeatroServicio {

    Horario crearHorario(Horario horario);

    List<Horario> listarHorarios();

    Horario obtenerHorario(Integer idHorario) throws Exception;

    void eliminarHorario(Integer idHorario) throws Exception;

    Funcion crearFuncion(Funcion funcion);

    Funcion actualizarFuncion(Funcion funcion) throws Exception;

    void eliminarFuncion(Integer idFuncion) throws Exception;

    List<Funcion> listarFunciones();

    Funcion obtenerFuncion(Integer idFuncion) throws Exception;

    Sala crearSala(Sala sala);

    Sala actualizarSala(Sala sala) throws Exception;

    void eliminarSala(Integer idSala) throws Exception;

    List<Sala> listarSalas();

    Sala obtenerSala(Integer idSala) throws Exception;

    Teatro crearTeatro(Teatro teatro);

    Teatro actualizarTeatro(Teatro teatro) throws Exception;

    void eliminarTeatro(Integer idTeatro) throws Exception;

    List<Teatro> listarTeatros();

    Teatro obtenerTeatro(Integer idTeatro) throws Exception;
}
