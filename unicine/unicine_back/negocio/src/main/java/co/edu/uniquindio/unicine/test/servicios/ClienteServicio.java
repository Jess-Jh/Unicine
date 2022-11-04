package co.edu.uniquindio.unicine.test.servicios;

import co.edu.uniquindio.unicine.test.entidades.Cliente;
import co.edu.uniquindio.unicine.test.entidades.Compra;
import co.edu.uniquindio.unicine.test.entidades.CuponCliente;
import co.edu.uniquindio.unicine.test.entidades.Pelicula;

import java.util.List;
import java.util.Objects;

public interface ClienteServicio {

    Cliente obtenerCliente(String cedula) throws Exception;
    Cliente login(String email, String contrasena) throws Exception;

    Object login2(String email, String contrasena) throws Exception;

    Cliente registrarCliente(Cliente cliente) throws Exception;

    Cliente actualizarCliente(Cliente cliente) throws Exception;

    boolean eliminarCliente(String cedula) throws Exception;

    List<Cliente> listarClientes();

    List<Compra> listarHistorialCompra(String email);

    Compra registrarCompra(Compra compra) throws Exception;

    List<Pelicula> buscarPelicula(String nombre);

    CuponCliente redimirCupon(CuponCliente cuponCliente);

    boolean cambiarContrasena(String email, String contrasena) throws Exception;

}
