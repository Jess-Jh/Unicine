package co.edu.uniquindio.unicine.test.servicios;

import co.edu.uniquindio.unicine.test.entidades.*;
import co.edu.uniquindio.unicine.test.repositorios.CiudadRepo;
import co.edu.uniquindio.unicine.test.repositorios.ConfiteriaRepo;
import co.edu.uniquindio.unicine.test.repositorios.CuponRepo;
import co.edu.uniquindio.unicine.test.repositorios.PeliculaRepo;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AdminServicioImpl implements AdminServicio{

    private final CiudadRepo ciudadRepo;
    private final PeliculaRepo peliculaRepo;
    private final CuponRepo cuponRepo;
    private final ConfiteriaRepo confiteriaRepo;

    public AdminServicioImpl(CiudadRepo ciudadRepo, PeliculaRepo peliculaRepo, CuponRepo cuponRepo, ConfiteriaRepo confiteriaRepo) {
        this.ciudadRepo = ciudadRepo;
        this.peliculaRepo = peliculaRepo;
        this.cuponRepo = cuponRepo;
        this.confiteriaRepo = confiteriaRepo;
    }

    @Override
    public Ciudad crearCiudad(Ciudad ciudad) {

        return ciudadRepo.save(ciudad);
    }

    @Override
    public Ciudad obtenerCiudad(Integer idCiudad) throws Exception {
        Optional<Ciudad> ciudad = ciudadRepo.findById(idCiudad);
        if (ciudad.isEmpty()){
            throw new Exception("No hay una ciudad con ese codigo");
        }
        return ciudad.get();
    }

    @Override
    public Pelicula crearPelicula(Pelicula pelicula) {
        return peliculaRepo.save(pelicula);
    }

    @Override
    public Pelicula actualizarPelicula(Pelicula pelicula) throws Exception {
        Optional<Pelicula> guardado = peliculaRepo.findById(pelicula.getIdPelicula());

        if (guardado.isEmpty()){
            throw new Exception("No se encontro la pelicula para actualizar");
        }
        return peliculaRepo.save(pelicula);
    }

    @Override
    public boolean eliminarPelicula(Integer idPelicula) throws Exception {
        Pelicula buscado = peliculaRepo.findById(idPelicula).orElse(null);

        if (buscado == null){
            throw new Exception("No se encontro pelicula para eliminar");
        }else {
            if (buscado.getListaFuncionSala().size() <= 0){
                peliculaRepo.delete(buscado);
                return true;
            }
            else {
                throw new Exception("No se puede eliminar porque tiene una funcion asociada");
            }
        }
    }

    @Override
    public List<Pelicula> listarPeliculas() {
        return peliculaRepo.findAll();
    }

    @Override
    public Pelicula obtenerPelicula(Integer idPelicula) throws Exception {
        Optional<Pelicula> guardado = peliculaRepo.findById(idPelicula);

        if (guardado.isEmpty()){
            throw new Exception("la pelicula no existe");
        }
        return guardado.get();
    }

    @Override
    public Cupon crearCupon(Cupon cupon) {
        return cuponRepo.save(cupon);
    }

    @Override
    public Cupon actualizarCupon(Cupon cupon) throws Exception {

        Optional<Cupon> guardado = cuponRepo.findById(cupon.getIdCupon());

        if (guardado.isEmpty()){
            throw new Exception("No existe el cupon");
        }

        return cuponRepo.save(cupon);
    }

    @Override
    public boolean eliminarCupon(Integer idCupon) throws Exception {
        Cupon buscado = cuponRepo.findById(idCupon).orElse(null);

        if (buscado == null){
            throw new Exception("No se encontro pelicula para eliminar");
        }else {
            if (buscado.getListaCuponClientes().size() <= 0) {
                cuponRepo.delete(buscado);
                return true;
            }
            else {
                throw new Exception("Tiene asociado el cupon a clientes");
            }
        }
    }

    @Override
    public List<Cupon> listarCupones() {
        return cuponRepo.findAll();
    }

    @Override
    public Cupon obtenerCupon(Integer idCupon) throws Exception {
        Optional<Cupon> guardado = cuponRepo.findById(idCupon);
        if (guardado.isEmpty()){
            throw new Exception("El cupon no existe");
        }
        return guardado.get();
    }

    @Override
    public Confiteria crearConfiteria(Confiteria confiteria) {
        return confiteriaRepo.save(confiteria);
    }

    @Override
    public Confiteria actualizarConfiteria(Confiteria confiteria) throws Exception {
        Optional<Confiteria> guardado = confiteriaRepo.findById(confiteria.getIdConfiteria());

        if (guardado.isEmpty()){
            throw new Exception("No existe la confiteria");
        }
        return confiteriaRepo.save(confiteria);
    }

    @Override
    public boolean eliminarConfiteria(Integer idConfiteria) throws Exception {
        Confiteria buscado = confiteriaRepo.findById(idConfiteria).orElse(null);

        if (buscado == null){
            throw new Exception("No se encontro la confiteria para eliminar");
        }else {
            if(buscado.getListaConfiteriaCompra().size() <= 0){
                confiteriaRepo.delete(buscado);
                return true;
            }else {
                throw new Exception("La confiteria se encuentra relacionado algunas compras");
            }
        }
    }

    @Override
    public List<Confiteria> listarConfiteria() {
        return confiteriaRepo.findAll();
    }

    @Override
    public Confiteria obtenerConfiteria(Integer idConfiteria) throws Exception {
        Optional<Confiteria> guardado = confiteriaRepo.findById(idConfiteria);
        if (guardado.isEmpty()){
            throw new Exception("La confiteria no existe");
        }
        return guardado.get();
    }
}
