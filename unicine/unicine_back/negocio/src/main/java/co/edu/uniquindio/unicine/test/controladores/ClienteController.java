package co.edu.uniquindio.unicine.test.controladores;

import co.edu.uniquindio.unicine.test.entidades.*;
import co.edu.uniquindio.unicine.test.jwt.JwtEncript;
import co.edu.uniquindio.unicine.test.jwt.JwtToken;
import co.edu.uniquindio.unicine.test.servicios.ClienteServicio;
import co.edu.uniquindio.unicine.test.servicios.EmailServicio;
import co.edu.uniquindio.unicine.test.servicios.JwtDetalleUsuarioServicio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@CrossOrigin(maxAge = 3600)
@RestController
public class ClienteController {

    @Autowired
    private ClienteServicio clienteServicio;
    private EmailServicio emailServicio;

    @Autowired
    private JwtDetalleUsuarioServicio jwtDetalleUsuarioServicio;

    @Autowired
    JwtToken jwtToken;

    @Autowired
    AuthenticationManager authenticationManager;

    @PostMapping("/auth/register")
    @ResponseStatus(code = HttpStatus.CREATED)
    public ResponseEntity<?> registrarCliente(@RequestBody Cliente cliente) throws Exception {
        Cliente clienteNuevo = null;
        Map<String, Object> res = new HashMap<>();

        try {
            cliente = clienteServicio.registrarCliente(cliente);
            String emailCliente = encriptarEmail(cliente.getEmail());
            String route = "auth/activacion/"+emailCliente;
            this.emailServicio.enviarEmail("Registro de cuenta en Unicine", route, cliente.getEmail());
            res.put("cliente", cliente);
            res.put("mensaje", "¡El cliente " + clienteNuevo.getNombreCompleto() + ", ha sido registrado con éxito!. Se le ha enviado un correo para que active su cuenta.");
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.CREATED);
        }catch(Exception e) {
            res.put("mensaje", "Error al registrarse en unicine");
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping("/activar-cuenta/{emailUsuario}")
    public ResponseEntity<?> activarCuenta(@PathVariable String email){
        Map<String, Object> response = new HashMap<>();
        try{
            String emailUsuario = JwtEncript.decrypt(email);
            Cliente cliente = this.clienteServicio.findByEmail(email);
            cliente.setEstado(true);
            this.clienteServicio.actualizarCliente(cliente);
            response.put("mensaje", "¡Su cuenta ha sido activada con éxito!");
            response.put("estado", cliente.getEstado());
            return new ResponseEntity<Map<String, Object>>(response, HttpStatus.OK);
        }catch(Exception e){
            response.put("mensaje", "Error en la activación de la cuenta");
            response.put("error", "No se ha encontrado el cliente");
            return new ResponseEntity<Map<String, Object>>(response, HttpStatus.NOT_FOUND);
        }
    }

    private String encriptarEmail(String email){
        String emailCliente = JwtEncript.encrypt(email);
        return emailCliente;
    }

    @GetMapping("/auth/login/{email}/{contrasena}")
    public Object loginUsuario(@PathVariable String email, @PathVariable String contrasena) throws Exception {
        Map<String, Object> res = new HashMap<>();

        try {
            autenticarUsuario(email, contrasena);
            final UserDetails userDetails = jwtDetalleUsuarioServicio.loadUserByUsername(email);
            String rol_user = "";

            for(GrantedAuthority e: userDetails.getAuthorities()){
                rol_user = e.getAuthority();
            }

            if(rol_user.equals("CLIENTE")){
                Cliente cliente = clienteServicio.findByEmail(email);
                if(!cliente.getEstado()){

                    res.put("mensaje", "Error al iniciar sesión");
                    res.put("error", "El cliente está inactivo. Active la cuenta abriendo el enlace enviado a su correo");
                    return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_ACCEPTABLE);
                }
            }
            final String token = jwtToken.generateToken(userDetails);
            Respuesta loginRespuesta = new Respuesta(userDetails.getUsername(), JwtEncript.encrypt(token), rol_user);
            res.put("login", loginRespuesta);
            res.put("mensaje", "¡El usuario ha iniciado sesión con éxito¡");
        } catch (Exception e) {
            res.put("mensaje", "Error al iniciar sesión");
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }

        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.OK);
    }

    private void autenticarUsuario(String email, String contrasena) throws Exception {
        try{
            authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(email, contrasena));
        }catch(DisabledException e){
            throw new Exception("Usuario deshabilitado");
        }catch(BadCredentialsException e){
            throw new BadCredentialsException("El email o contraseña es incorrecto");
        }
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
            res.put("mensaje", "¡El cliente con la cédula " + cedula.toString()+" no éxiste en la base de datos!");
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

    @PreAuthorize("hasRole('CLIENTE')")
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
