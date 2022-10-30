package co.edu.uniquindio.unicine.test.controladores;

import co.edu.uniquindio.unicine.test.entidades.Cliente;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class ClienteController {

   // @Autowired
    //private Servicios servicios;
/*
    @PostMapping("/auth/register")
    public Cliente registrarCliente(@RequestBody Cliente cliente) {
        return servicio.GuardarCliente(cliente);
    }

    @GetMapping("/unicine/detalle-usuario/{cedula}")
    public Cliente obtenerCliente(@PathVariable String cedula) {
        return servicio.obtenerCliente(cedula);
    }

    @GetMapping("/unicine/detalle-usuario")
    public List<Cliente> obtenerClientes() {
        return servicio.obtenerClientes();
    }

    @DeleteMapping("/delete/{id}")
    public String borrarCliente(@PathVariable String cedula) {
        return servicio.borrarCliente(cedula);
    }

    @PutMapping("/update")
    public Cliente actualizarCliente(@RequestBody Cliente cliente) {
        return servicio.actualizarCliente(cliente);
    }
*/
}
