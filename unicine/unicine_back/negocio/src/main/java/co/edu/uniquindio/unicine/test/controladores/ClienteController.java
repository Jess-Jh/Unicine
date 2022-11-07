package co.edu.uniquindio.unicine.test.controladores;

import co.edu.uniquindio.unicine.test.entidades.Cliente;
import co.edu.uniquindio.unicine.test.entidades.Compra;
import co.edu.uniquindio.unicine.test.entidades.CuponCliente;
import co.edu.uniquindio.unicine.test.entidades.Pelicula;
import co.edu.uniquindio.unicine.test.servicios.ClienteServicio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@CrossOrigin(maxAge = 3600)
@RestController
public class ClienteController {

    @Autowired
    private ClienteServicio clienteServicio;

    @PostMapping("/auth/register")
    public Cliente registrarCliente(@RequestBody Cliente cliente) throws Exception {
        return clienteServicio.registrarCliente(cliente);
    }

    @GetMapping("/auth/login/{email}/{contrasena}")
    public Object loginUsuario(@PathVariable String email, @PathVariable String contrasena) throws Exception {
        return clienteServicio.login2(email, contrasena);
    }

    @GetMapping("/detalle-usuario/{cedula}")
    public Cliente obtenerCliente(@PathVariable String cedula) throws Exception {
        return clienteServicio.obtenerCliente(cedula);
    }

    @GetMapping("/detalle-usuarios")
    public List<Cliente> obtenerClientes() {
        return clienteServicio.listarClientes();
    }

    @DeleteMapping("/delete/{cedula}")
    public void borrarCliente(@PathVariable String cedula) throws Exception {
        clienteServicio.eliminarCliente(cedula);
    }

    @PutMapping("/update")
    public Cliente actualizarCliente(@RequestBody Cliente cliente) throws Exception {
        return clienteServicio.actualizarCliente(cliente);
    }

    @GetMapping("/historial-compras")
    public List<Compra> listarHistorialCompras(@PathVariable String email) {
        return clienteServicio.listarHistorialCompra(email);
    }

    @PostMapping("/registrar-compra")
    public Compra registrarCompra(@RequestBody Compra compra) throws Exception {
        return clienteServicio.registrarCompra(compra);
    }

    @PostMapping("/redimir-cupon")
    public CuponCliente redimirCupon(@RequestBody CuponCliente cuponCliente) {
        return clienteServicio.redimirCupon(cuponCliente);
    }

    @PutMapping("/cambiar-contraseña")
    public boolean cambiarContrasena(@PathVariable String email, @PathVariable String contrasena) throws Exception {
        return clienteServicio.cambiarContrasena(email, contrasena);
    }

    @GetMapping("/filtrar-pelicula-cartelera")
    public List<Pelicula> filtroPeliculasCartelera(@PathVariable String nombre) {
        return clienteServicio.buscarPelicula(nombre);
    }

}
