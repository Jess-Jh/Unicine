package co.edu.uniquindio.unicine.test.servicios;

import co.edu.uniquindio.unicine.test.dto.SillasOcupadasDTO;
import co.edu.uniquindio.unicine.test.entidades.*;
import co.edu.uniquindio.unicine.test.repositorios.*;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AdminTeatroServicioImpl implements  AdminTeatroServicio{

    private final HorarioRepo horarioRepo;
    private final FuncionRepo funcionRepo;
    private final SalaRepo salaRepo;
    private final TeatroRepo teatroRepo;
    private final DistribucionSillaRepo distribucionSillaRepo;
    private final FuncionSalaRepo funcionSalaRepo;
    private final PQRSRepo pqrsRepo;

    private final CompraRepo compraRepo;

    public AdminTeatroServicioImpl(HorarioRepo horarioRepo, FuncionRepo funcionRepo, SalaRepo salaRepo, TeatroRepo teatroRepo,
                                   DistribucionSillaRepo distribucionSillaRepo, FuncionSalaRepo funcionSalaRepo, PQRSRepo pqrsRepo,
                                   CompraRepo compraRepo) {
        this.horarioRepo = horarioRepo;
        this.funcionRepo = funcionRepo;
        this.salaRepo = salaRepo;
        this.teatroRepo = teatroRepo;
        this.distribucionSillaRepo = distribucionSillaRepo;
        this.funcionSalaRepo = funcionSalaRepo;
        this.pqrsRepo = pqrsRepo;
        this.compraRepo = compraRepo;
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
    public Horario actualizarHorario(Horario horario) throws Exception {
        Optional<Horario> guardado = horarioRepo.findById(horario.getIdHorario());
        if (guardado.isEmpty()){
            throw new Exception("No existe el horario");
        }
        return horarioRepo.save(horario);
    }

    @Override
    public boolean eliminarHorario(Integer idHorario) throws Exception {
        Horario buscado = horarioRepo.findById(idHorario).orElse(null);

        if (buscado == null){
            throw new Exception("No se encontro la confiteria para eliminar");
        }else {
            if (buscado.getListaFunciones().size() <= 0){
                horarioRepo.delete(buscado);
                return true;
            } else {
                throw new Exception("El horario se encuentra relacionado en unas funciones");
            }
        }
    }

    @Override
    public Funcion crearFuncion(Funcion funcion) {

        return funcionRepo.save(funcion);
    }

    @Override
    public Funcion actualizarFuncion(Funcion funcion) throws Exception {
        Optional<Funcion> guardado = funcionRepo.findById(funcion.getIdFuncion());
        if (guardado.isEmpty()){
            throw new Exception("No existe la funcion");
        }
        return funcionRepo.save(funcion);
    }

    @Override
    public boolean eliminarFuncion(Integer idFuncion) throws Exception {
        Funcion buscado = funcionRepo.findById(idFuncion).orElse(null);

        if (buscado == null){
            throw new Exception("No se encontro la funcion para eliminar");
        }else {
            if(buscado.getListaFuncionSala().size() <= 0){
                funcionRepo.delete(buscado);
                return true;
            }else {
                throw new Exception("No se puede eliminar funcion ya que se encuentra relacionado a una funcion sala");
            }
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
        Optional<Sala> guardado = salaRepo.findById(sala.getIdSala());
        if (guardado.isEmpty()){
            throw new Exception("No existe la funcion");
        }
        return salaRepo.save(sala);
    }

    @Override
    public boolean eliminarSala(Integer idSala) throws Exception {
        Sala buscado = salaRepo.findById(idSala).orElse(null);

        if (buscado == null){
            throw new Exception("No se encontro la sala para eliminar");
        }else {
            if (buscado.getListaFuncionSala().size() <= 0){
                salaRepo.delete(buscado);
                return true;
            }else {
                throw new Exception("No se puede eliminar ya que tiene relacionado funcion sala");
            }
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

        Optional<Teatro> guardado = teatroRepo.findById(teatro.getIdTeatro());
        if (guardado.isEmpty()){
            throw new Exception("No existe la funcion");
        }
        return teatroRepo.save(teatro);
    }

    @Override
    public boolean eliminarTeatro(Integer idTeatro) throws Exception {
        Teatro buscado = teatroRepo.findById(idTeatro).orElse(null);

        if (buscado == null){
            throw new Exception("No se encontro la sala para eliminar");
        }else {
            if (buscado.getListaSalas().size()<=0){
                teatroRepo.delete(buscado);
                return true;
            }else {
                throw new Exception("No se puede eliminar teatro ya que tiene sala relacionada");
            }
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

    @Override
    public DistribucionSilla crearDistribucionSilla(DistribucionSilla distribucionSilla) {
        return distribucionSillaRepo.save(distribucionSilla);
    }

    @Override
    public DistribucionSilla actualizarDistribucionSilla(DistribucionSilla distribucionSilla) throws Exception {
        Optional<DistribucionSilla> guardado = distribucionSillaRepo.findById(distribucionSilla.getIdDistribuccionSilla());
        if (guardado.isEmpty()){
            throw new Exception("No existe la distribuccion de la sillas");
        }
        return distribucionSillaRepo.save(distribucionSilla);
    }

    @Override
    public boolean eliminarDistribucionSilla(Integer idDistribucionSilla) throws Exception {
        DistribucionSilla buscado = distribucionSillaRepo.findById(idDistribucionSilla).orElse(null);

        if (buscado == null){
            throw new Exception("No se encontro la distribuccion silla para eliminar");
        }else {
            if (buscado.getListaSalas().size()<=0){
                distribucionSillaRepo.delete(buscado);
                return true;
            }else {
                throw new Exception("No se puede eliminar distribuccion ya que tiene sala relacionada");
            }
        }
    }

    @Override
    public List<DistribucionSilla> listarDistribucionSillas() {
        return distribucionSillaRepo.findAll();
    }

    @Override
    public DistribucionSilla obtenerDistribucionSilla(Integer idDistribucionSilla) throws Exception {
        Optional<DistribucionSilla> guardado = distribucionSillaRepo.findById(idDistribucionSilla);
        if (guardado.isEmpty()){
            throw new Exception("No se encontro ninguna distribuccion silla");
        }
        return guardado.get();
    }

    @Override
    public DistribucionSilla obtenerDistribucionSillaPorSala(Integer idSala) throws Exception {
        DistribucionSilla guardado = salaRepo.obtenerDistribucionPorSala(idSala);
        if (guardado != null) {
            return guardado;
        }else {
            throw new Exception("La sala no tienen ninguna distribución de sillas asignada");
        }
    }

    @Override
    public String agregarSalaDistribucionSilla(Integer idDistribucionSilla, Sala sala) throws Exception {
        String mensaje;
        Optional<DistribucionSilla> guardado = distribucionSillaRepo.findById(idDistribucionSilla);

        if (guardado.isEmpty()){
            throw new Exception("El id de la distribución no existe");
        }else {
            guardado.get().getListaSalas().add(sala);
            mensaje = "¡La sala ha quedado almacenada en la distribución con éxito!";
            return mensaje;
        }
    }

    @Override
    public FuncionSala crearFuncionSala(FuncionSala funcionSala) throws Exception {
        List<FuncionSala> funcionSalasGuardadas = funcionSalaRepo.findAll();

        for(int i = 0; i < funcionSalasGuardadas.size(); i++){
            if(funcionSala.getFuncion() == funcionSalasGuardadas.get(i).getFuncion()
                    && funcionSala.getSala() ==  funcionSalasGuardadas.get(i).getSala()){
                throw new Exception("Ya existe un registro con la funcion - sala relacionada.");
            }
        }

        return funcionSalaRepo.save(funcionSala);
    }

    @Override
    public FuncionSala actualizarFuncionSala(FuncionSala funcionSala) throws Exception {
        Optional<FuncionSala> guardado = funcionSalaRepo.findById(funcionSala.getIdFuncionSala());
        if (guardado.isEmpty()){
            throw new Exception("No existe la funcion sala");
        }
        return funcionSalaRepo.save(funcionSala);
    }

    @Override
    public boolean eliminarFuncionSala(Integer idFuncionSala) throws Exception {
        FuncionSala buscado = funcionSalaRepo.findById(idFuncionSala).orElse(null);

        if (buscado == null){
            throw new Exception("No se encontro la funcion sala para eliminar");
        }else {
            if (buscado.getListaCompras().size() <=0 ){
                funcionSalaRepo.delete(buscado);
                return true;
            }else {
                throw new Exception("No se puede eliminar la funcion sala ya que tiene compras relacionadas");
            }
        }
    }

    @Override
    public List<FuncionSala> listarFuncionSala() {
        return funcionSalaRepo.findAll();
    }

    @Override
    public FuncionSala obtenerFuncionSala(Integer idFuncionSala) throws Exception {
        Optional<FuncionSala> guardado = funcionSalaRepo.findById(idFuncionSala);
        if (guardado.isEmpty()){
            throw new Exception("No se encontro ninguna funcion sala");
        }
        return guardado.get();
    }


}
