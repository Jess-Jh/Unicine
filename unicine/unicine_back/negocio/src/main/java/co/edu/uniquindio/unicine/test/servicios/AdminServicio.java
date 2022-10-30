package co.edu.uniquindio.unicine.test.servicios;

import co.edu.uniquindio.unicine.test.entidades.*;

import java.util.List;

public interface AdminServicio {

    Ciudad crearCiudad(Ciudad ciudad);

    Ciudad obtenerCiudad(Integer idCiudad) throws Exception;

    Pelicula crearPelicula(Pelicula pelicula);

    Pelicula actualizarPelicula(Pelicula pelicula);

    void eliminarPelicula(Integer idPelicula);

    List<Pelicula> listarPeliculas();

    Pelicula obtenerPelicula(Integer idPelicula);

    Cupon crearCupon(Cupon cupon);

    Cupon actualizarCupon(Cupon cupon);

    Cupon eliminarCupon(Integer idCupon);

    List<Cupon> listarCupones();

    Cupon obtenerCupon(Integer idCupon);

    Confiteria crearConfiteria(Confiteria confiteria);

    Confiteria actualizarConfiteria(Confiteria confiteria);

    void eliminarConfiteria(Integer idConfiteria);

    List<Confiteria> listarConfiteria();

    Confiteria obtenerConfiteria(Integer idConfiteria);


}
