package co.edu.uniquindio.unicine.test.servicios;

import co.edu.uniquindio.unicine.test.entidades.Cliente;
import co.edu.uniquindio.unicine.test.entidades.Compra;
import co.edu.uniquindio.unicine.test.entidades.Pelicula;

import java.util.List;

public interface ClienteServicio {

    Cliente obtenerCliente(String cedula) throws Exception;
    Cliente login(String email, String contrasena) throws Exception;

    Cliente registrarCliente(Cliente cliente) throws Exception;

    Cliente actualizarCliente(Cliente cliente) throws Exception;

    void eliminarCliente(String cedula) throws Exception;

    List<Cliente> listarClientes();

    List<Compra> listarHistorialCompra(String email);

    Compra registrarCompra(Compra compra);

    List<Pelicula> buscarPelicula(String nombre);

    boolean redimirCupon(Integer idCupon);

    boolean cambiarContrasena(Integer idCodigo);

}
