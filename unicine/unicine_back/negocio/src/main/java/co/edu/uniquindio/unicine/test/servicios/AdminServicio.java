package co.edu.uniquindio.unicine.test.servicios;

import co.edu.uniquindio.unicine.test.entidades.*;

import java.util.List;

public interface AdminServicio {

    Ciudad crearCiudad(Ciudad ciudad);

    Ciudad obtenerCiudad(Integer idCiudad) throws Exception;

    Pelicula crearPelicula(Pelicula pelicula) throws Exception;

    Pelicula actualizarPelicula(Pelicula pelicula) throws Exception;

    boolean eliminarPelicula(Integer idPelicula) throws Exception;

    List<Pelicula> listarPeliculas();

    Pelicula obtenerPelicula(Integer idPelicula) throws Exception;

    Cupon crearCupon(Cupon cupon);

    Cupon actualizarCupon(Cupon cupon) throws Exception;

    boolean eliminarCupon(Integer idCupon) throws Exception;

    List<Cupon> listarCupones();

    Cupon obtenerCupon(Integer idCupon) throws Exception;

    Confiteria crearConfiteria(Confiteria confiteria);

    Confiteria actualizarConfiteria(Confiteria confiteria) throws Exception;

    boolean eliminarConfiteria(Integer idConfiteria) throws Exception;

    List<Confiteria> listarConfiteria();

    Confiteria obtenerConfiteria(Integer idConfiteria) throws Exception;

    Administrador crearAdministradorTeatro(Administrador administradorTeatro);

    Administrador actualizarAdministradorTeatro(Administrador administradorTeatro) throws Exception;

    boolean eliminarAdministradorTeatro(String cedula) throws Exception;

    List<Administrador> listarAdministradorTeatro();

    Administrador obtenerAdministradorTeatro(String cedulaAdminTeatro) throws Exception;

}
