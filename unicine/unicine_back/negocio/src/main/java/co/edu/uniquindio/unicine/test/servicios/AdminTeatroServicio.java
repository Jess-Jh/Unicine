package co.edu.uniquindio.unicine.test.servicios;

import co.edu.uniquindio.unicine.test.dto.SillasOcupadasDTO;
import co.edu.uniquindio.unicine.test.entidades.*;

import java.util.List;
import java.util.Optional;

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

    DistribucionSilla crearDistribucionSilla(DistribucionSilla distribucionSilla);

    DistribucionSilla actualizarDistribucionSilla(DistribucionSilla distribucionSilla) throws Exception;

    boolean eliminarDistribucionSilla(Integer idDistribucionSilla) throws Exception;

    List<DistribucionSilla> listarDistribucionSillas();

    DistribucionSilla obtenerDistribucionSilla(Integer idDistribucionSilla) throws Exception;

    DistribucionSilla obtenerDistribucionSillaPorSala(Integer idSala) throws Exception;

    String agregarSalaDistribucionSilla(Integer idDistribucionSilla, Sala sala) throws Exception;

    FuncionSala crearFuncionSala(FuncionSala funcionSala) throws Exception;

    FuncionSala actualizarFuncionSala(FuncionSala funcionSala) throws Exception;

    boolean eliminarFuncionSala(Integer idFuncionSala) throws Exception;

    List<FuncionSala> listarFuncionSala();

    FuncionSala obtenerFuncionSala(Integer idFuncionSala) throws Exception;

}
