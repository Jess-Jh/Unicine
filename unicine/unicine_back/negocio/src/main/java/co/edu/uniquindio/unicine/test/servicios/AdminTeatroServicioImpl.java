package co.edu.uniquindio.unicine.test.servicios;

import co.edu.uniquindio.unicine.test.entidades.*;
import co.edu.uniquindio.unicine.test.repositorios.FuncionRepo;
import co.edu.uniquindio.unicine.test.repositorios.HorarioRepo;
import co.edu.uniquindio.unicine.test.repositorios.SalaRepo;
import co.edu.uniquindio.unicine.test.repositorios.TeatroRepo;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

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
        return horarioRepo.save(horario);
    }

    @Override
    public List<Horario> listarHorarios() {
        return horarioRepo.findAll();
    }

    @Override
    public Horario obtenerHorario(Integer idHorario) throws Exception {
        Optional<Horario> guardado = horarioRepo.findById(idHorario);
        if (guardado.isEmpty()){
            throw new Exception("No hay un horario con ese codigo");
        }
        return guardado.get();
    }

    @Override
    public void eliminarHorario(Integer idHorario) throws Exception {
        Horario buscado = horarioRepo.findById(idHorario).orElse(null);

        if (buscado == null){
            throw new Exception("No se encontro la confiteria para eliminar");
        }else {
            horarioRepo.delete(buscado);
        }
    }

    @Override
    public Funcion crearFuncion(Funcion funcion) {

        return funcionRepo.save(funcion);
    }

    @Override
    public Funcion actualizarFuncion(Funcion funcion) throws Exception {
        Funcion guardado = funcionRepo.findById(funcion.getIdFuncion()).orElse(null);
        if (guardado == null){
            throw new Exception("No existe la funcion");
        }else {
            guardado.setPrecio(funcion.getPrecio());
            guardado.setHorario(funcion.getHorario());
        }
        return guardado;
    }

    @Override
    public void eliminarFuncion(Integer idFuncion) throws Exception {
        Funcion buscado = funcionRepo.findById(idFuncion).orElse(null);

        if (buscado == null){
            throw new Exception("No se encontro la funcion para eliminar");
        }else {
            funcionRepo.delete(buscado);
        }
    }

    @Override
    public List<Funcion> listarFunciones() {

        return funcionRepo.findAll();
    }

    @Override
    public Funcion obtenerFuncion(Integer idFuncion) throws Exception {
        Optional<Funcion> guardado = funcionRepo.findById(idFuncion);
        if (guardado.isEmpty()){
            throw new Exception("No hay un horario con ese codigo");
        }
        return guardado.get();
    }

    @Override
    public Sala crearSala(Sala sala) {
        return salaRepo.save(sala);
    }

    @Override
    public Sala actualizarSala(Sala sala) throws Exception {
        Sala guardado = salaRepo.findById(sala.getIdSala()).orElse(null);
        if (guardado == null){
            throw new Exception("No existe la funcion");
        }else {
            guardado.setNombre(sala.getNombre());
            guardado.setTeatro(sala.getTeatro());
        }
        return guardado;
    }

    @Override
    public void eliminarSala(Integer idSala) throws Exception {
        Sala buscado = salaRepo.findById(idSala).orElse(null);

        if (buscado == null){
            throw new Exception("No se encontro la sala para eliminar");
        }else {
            salaRepo.delete(buscado);
        }
    }

    @Override
    public List<Sala> listarSalas() {

        return salaRepo.findAll();
    }

    @Override
    public Sala obtenerSala(Integer idSala) throws Exception {
        Optional<Sala> guardado = salaRepo.findById(idSala);
        if (guardado.isEmpty()){
            throw new Exception("No hay un horario con ese codigo");
        }
        return guardado.get();
    }

    @Override
    public Teatro crearTeatro(Teatro teatro) {
        return teatroRepo.save(teatro);
    }

    @Override
    public Teatro actualizarTeatro(Teatro teatro) throws Exception {

        Teatro guardado = teatroRepo.findById(teatro.getIdTeatro()).orElse(null);
        if (guardado == null){
            throw new Exception("No existe la funcion");
        }else {
            guardado.setNombre(teatro.getNombre());
            guardado.setDireccion(teatro.getDireccion());
            guardado.setCiudad(teatro.getCiudad());
        }
        return guardado;
    }

    @Override
    public void eliminarTeatro(Integer idTeatro) throws Exception {
        Teatro buscado = teatroRepo.findById(idTeatro).orElse(null);

        if (buscado == null){
            throw new Exception("No se encontro la sala para eliminar");
        }else {
            teatroRepo.delete(buscado);
        }
    }

    @Override
    public List<Teatro> listarTeatros() {
        return teatroRepo.findAll();
    }

    @Override
    public Teatro obtenerTeatro(Integer idTeatro) throws Exception {
        Optional<Teatro> guardado = teatroRepo.findById(idTeatro);
        if (guardado.isEmpty()){
            throw new Exception("No hay un horario con ese codigo");
        }
        return guardado.get();
    }
}