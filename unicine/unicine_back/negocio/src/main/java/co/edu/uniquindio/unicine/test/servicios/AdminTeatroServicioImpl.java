package co.edu.uniquindio.unicine.test.servicios;

import co.edu.uniquindio.unicine.test.entidades.Funcion;
import co.edu.uniquindio.unicine.test.entidades.Horario;
import co.edu.uniquindio.unicine.test.entidades.Sala;
import co.edu.uniquindio.unicine.test.entidades.Teatro;
import co.edu.uniquindio.unicine.test.repositorios.FuncionRepo;
import co.edu.uniquindio.unicine.test.repositorios.HorarioRepo;
import co.edu.uniquindio.unicine.test.repositorios.SalaRepo;
import co.edu.uniquindio.unicine.test.repositorios.TeatroRepo;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminTeatroServicioImpl implements  AdminTeatroServicio{

    private final HorarioRepo horarioRepo;
    private final FuncionRepo funcionRepo;
    private final SalaRepo salaRepo;
    private final TeatroRepo teatroRepo;

    public AdminTeatroServicioImpl(HorarioRepo horarioRepo, FuncionRepo funcionRepo, SalaRepo salaRepo, TeatroRepo teatroRepo) {
        this.horarioRepo = horarioRepo;
        this.funcionRepo = funcionRepo;
        this.salaRepo = salaRepo;
        this.teatroRepo = teatroRepo;
    }

    @Override
    public Horario crearHorario(Horario horario) {
        return null;
    }

    @Override
    public List<Horario> listarHorarios() {
        return null;
    }

    @Override
    public Horario obtenerHorario(Integer idHorario) {
        return null;
    }

    @Override
    public void eliminarHorario(Integer idHorario) {

    }

    @Override
    public Funcion crearFuncion(Funcion funcion) {
        return null;
    }

    @Override
    public Funcion actualizarFuncion(Funcion funcion) {
        return null;
    }

    @Override
    public void eliminarFuncion(Integer idFuncion) {

    }

    @Override
    public List<Funcion> listarFunciones() {
        return null;
    }

    @Override
    public Funcion obtenerFuncion(Integer idFuncion) {
        return null;
    }

    @Override
    public Sala crearSala(Sala sala) {
        return null;
    }

    @Override
    public Sala actualizarSala(Sala sala) {
        return null;
    }

    @Override
    public void eliminarSala(Integer idSala) {

    }

    @Override
    public List<Sala> listarSalas() {
        return null;
    }

    @Override
    public Sala obtenerSala(Integer idSala) {
        return null;
    }

    @Override
    public Teatro crearTeatro(Teatro teatro) {
        return null;
    }

    @Override
    public Teatro actualizarTeatro(Teatro teatro) {
        return null;
    }

    @Override
    public void eliminarTeatro(Integer idTeatro) {

    }

    @Override
    public List<Teatro> listarTeatros() {
        return null;
    }

    @Override
    public Teatro obtenerTeatro(Integer idTeatro) {
        return null;
    }
}
