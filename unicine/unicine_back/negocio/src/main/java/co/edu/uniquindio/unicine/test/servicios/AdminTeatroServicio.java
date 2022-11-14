package co.edu.uniquindio.unicine.test.servicios;

import co.edu.uniquindio.unicine.test.entidades.*;

import java.util.List;

public interface AdminTeatroServicio {

    Horario crearHorario(Horario horario);

    List<Horario> listarHorarios();

    Horario obtenerHorario(Integer idHorario) throws Exception;

    Horario actualizarHorario(Horario horario) throws Exception;

    boolean eliminarHorario(Integer idHorario) throws Exception;

    Funcion crearFuncion(Funcion funcion);

    Funcion actualizarFuncion(Funcion funcion) throws Exception;

    boolean eliminarFuncion(Integer idFuncion) throws Exception;

    List<Funcion> listarFunciones();

    Funcion obtenerFuncion(Integer idFuncion) throws Exception;

    Sala crearSala(Sala sala);

    Sala actualizarSala(Sala sala) throws Exception;

    boolean eliminarSala(Integer idSala) throws Exception;

    List<Sala> listarSalas();

    Sala obtenerSala(Integer idSala) throws Exception;

    Teatro crearTeatro(Teatro teatro);

    Teatro actualizarTeatro(Teatro teatro) throws Exception;

    boolean eliminarTeatro(Integer idTeatro) throws Exception;

    List<Teatro> listarTeatros();

    Teatro obtenerTeatro(Integer idTeatro) throws Exception;

    DistribucionSilla crearDistribuccionSilla(DistribucionSilla distribucionSilla);

    DistribucionSilla actualizarDistribuccionSilla(DistribucionSilla distribucionSilla) throws Exception;

    boolean eliminarDistribuccionSilla(Integer idDistribucionSilla) throws Exception;

    List<DistribucionSilla> listarDistribuccionSillas();

    DistribucionSilla obtenerDistribuccionSilla(Integer idDistribucionSilla) throws Exception;
}
