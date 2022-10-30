package co.edu.uniquindio.unicine.test.servicios;

import co.edu.uniquindio.unicine.test.entidades.Ciudad;
import co.edu.uniquindio.unicine.test.entidades.Confiteria;
import co.edu.uniquindio.unicine.test.entidades.Cupon;
import co.edu.uniquindio.unicine.test.entidades.Pelicula;
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
    public Pelicula actualizarPelicula(Pelicula pelicula) {

        Pelicula guardado = peliculaRepo.findById(pelicula.getIdPelicula()).orElse(null);
        guardado.setGenero(pelicula.getGenero());
        guardado.setEstadoPelicula(pelicula.getEstadoPelicula());

        return null;
    }

    @Override
    public void eliminarPelicula(Integer idPelicula) {

    }

    @Override
    public List<Pelicula> listarPeliculas() {
        return null;
    }

    @Override
    public Pelicula obtenerPelicula(Integer idPelicula) {
        return null;
    }

    @Override
    public Cupon crearCupon(Cupon cupon) {
        return null;
    }

    @Override
    public Cupon actualizarCupon(Cupon cupon) {
        return null;
    }

    @Override
    public Cupon eliminarCupon(Integer idCupon) {
        return null;
    }

    @Override
    public List<Cupon> listarCupones() {
        return null;
    }

    @Override
    public Cupon obtenerCupon(Integer idCupon) {
        return null;
    }

    @Override
    public Confiteria crearConfiteria(Confiteria confiteria) {
        return null;
    }

    @Override
    public Confiteria actualizarConfiteria(Confiteria confiteria) {
        return null;
    }

    @Override
    public void eliminarConfiteria(Integer idConfiteria) {

    }

    @Override
    public List<Confiteria> listarConfiteria() {
        return null;
    }

    @Override
    public Confiteria obtenerConfiteria(Integer idConfiteria) {
        return null;
    }
}
