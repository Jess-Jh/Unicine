package co.edu.uniquindio.unicine.test.servicios;

import co.edu.uniquindio.unicine.test.entidades.*;

import java.util.List;

public interface ClienteServicio {

    Cliente obtenerCliente(String cedula) throws Exception;
    Cliente login(String email, String contrasena) throws Exception;

    Object login2(String email, String contrasena) throws Exception;

    Cliente findByEmail(String email) throws Exception;

    Cliente registrarCliente(Cliente cliente) throws Exception;

    Cliente actualizarCliente(Cliente cliente) throws Exception;

    boolean eliminarCliente(String cedula) throws Exception;

    List<Cliente> listarClientes();

    List<Compra> listarHistorialCompra(String email);

    Compra registrarCompra(Compra compra) throws Exception;

    List<Pelicula> buscarPelicula(String nombre);

    CuponCliente redimirCupon(CuponCliente cuponCliente);

    boolean cambiarContrasena(String email, String contrasena) throws Exception;

    List<Funcion> obtenerFuncionesDisponiblesPelicula(Integer idPelicula);

    List<Pelicula> obtenerPeliculasPorCiudad(String nombreCiudad);

    List<Pelicula> obtenerPeliculasPorTeatro(String nombreTeatro);
}
