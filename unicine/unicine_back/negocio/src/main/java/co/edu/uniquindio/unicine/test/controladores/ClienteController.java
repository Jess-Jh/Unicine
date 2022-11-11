package co.edu.uniquindio.unicine.test.controladores;

import co.edu.uniquindio.unicine.test.entidades.Cliente;
import co.edu.uniquindio.unicine.test.entidades.Compra;
import co.edu.uniquindio.unicine.test.entidades.CuponCliente;
import co.edu.uniquindio.unicine.test.entidades.Pelicula;
import co.edu.uniquindio.unicine.test.servicios.ClienteServicio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@CrossOrigin(maxAge = 3600)
@RestController
public class ClienteController {

    @Autowired
    private ClienteServicio clienteServicio;

    @PostMapping("/auth/register")
    @ResponseStatus(code = HttpStatus.CREATED)
    public Cliente registrarCliente(@RequestBody Cliente cliente) throws Exception {
        return clienteServicio.registrarCliente(cliente);
    }

    @GetMapping("/auth/login/{email}/{contrasena}")
    public Object loginUsuario(@PathVariable String email, @PathVariable String contrasena) throws Exception {
        return clienteServicio.login2(email, contrasena);
    }

    @GetMapping("/detalle-usuario/{cedula}")
    public ResponseEntity<?> obtenerCliente(@PathVariable String cedula) {
        Map<String, Object> res = new HashMap<>();
        Cliente cliente;

        try {
            cliente = clienteServicio.obtenerCliente(cedula);
        } catch (Exception e) {
            res.put("mensaje", "Error al realizar la búsqueda del cliente en la base de datos");
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
        if(cliente == null) {
            res.put("mensaje", "¡El cliente con la cédula ".concat(cedula.toString().concat(" no éxiste en la base de datos!")));
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.INTERNAL_SERVER_ERROR);
        }
        res.put("cliente", cliente);
        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.OK);
    }

    @GetMapping("/detalle-usuarios")
    public ResponseEntity<?> obtenerClientes() {
        Map<String, Object> res = new HashMap<>();

        List<Cliente> listaClientes = clienteServicio.listarClientes();
        res.put("clientes", listaClientes);

        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.OK);
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
