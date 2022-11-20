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

        Map<String, Object> res = new HashMap<>();

        try {
            clienteServicio.registrarCliente(cliente);
            //String emailCliente = encriptarEmail(cliente.getEmail());
            //String route = "auth/activacion/"+emailCliente;
            //this.emailServicio.enviarEmail("Registro de cuenta en Unicine", "¡El cliente " + cliente.getNombreCompleto() + ", ha sido registrado con éxito!. Se le ha enviado un correo para que active su cuenta.", cliente.getEmail());
            // res.put("cliente", cliente);

            res.put("mensaje", "¡El cliente " + cliente.getNombreCompleto() + ", ha sido registrado con éxito!. Se le ha enviado un correo para que active su cuenta.");
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.CREATED);
        }catch(Exception e) {
            res.put("mensaje", "Error al registrarse en unicine");
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping("/activar-cuenta/{email}")
    public ResponseEntity<?> activarCuenta(@PathVariable String email){
        Map<String, Object> res = new HashMap<>();

        try {
            boolean activarCuenta = clienteServicio.activarCuentaCliente(email);
            res.put("respuestaCuenta", activarCuenta);
            res.put("mensaje", "¡Su cuenta ha sido activada con éxito!");
        } catch (Exception e) {
            res.put("mensaje", "Error en la activación de la cuenta");
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.CREATED);
    }

    private String encriptarEmail(String email){
        String emailCliente = JwtEncript.encrypt(email);
        return emailCliente;
    }

    @GetMapping("/auth/login2/{email}/{contrasena}")
    public Object loginUsuario2(@PathVariable String email, @PathVariable String contrasena) throws Exception {
        return clienteServicio.login2(email, contrasena);
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
            res.put("mensaje", "¡El usuario ha iniciado sesión con éxito!");
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

    @GetMapping("/obtener-cliente-email/{email}")
    public ResponseEntity<?> obtenerClienteEmail(@PathVariable String email) {
        Map<String, Object> res = new HashMap<>();
        Cliente cliente;

        try {
            cliente = clienteServicio.obtenerClienteEmail(email);
        } catch (Exception e) {
            res.put("mensaje", "Error al realizar la búsqueda del cliente en la base de datos");
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
        if(cliente == null) {
            res.put("mensaje", "¡El cliente con el correo " + email.toString()+" no éxiste en la base de datos!");
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
    public ResponseEntity<?> actualizarCliente(@RequestBody Cliente cliente) throws Exception {

        Map<String, Object> res = new HashMap<>();

        try {
            Cliente clienteActualizado = clienteServicio.actualizarCliente(cliente);
            res.put("cliente", clienteActualizado);
            res.put("mensaje", "¡El usuario ha sido actualizado con éxito!");
        } catch (Exception e) {
            res.put("mensaje", "Error al actualizar el cliente");
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.CREATED);
    }


    @GetMapping("/historial-compras/{email}")
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

    @GetMapping("/filtrar-pelicula-cartelera/{nombre}")
    public ResponseEntity<?> filtroPeliculasCartelera(@PathVariable String nombre) {
        Map<String, Object> res = new HashMap<>();

        List<Pelicula> listaPeliculasCartelera = clienteServicio.buscarPelicula(nombre);
        res.put("listaPeliculas", listaPeliculasCartelera);

        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.OK);
    }


    @GetMapping("/obtener-funciones-pelicula/{idPelicula}")
    public ResponseEntity<?> obtenerFuncionesPelicula(@PathVariable int idPelicula) {
        Map<String, Object> res = new HashMap<>();

        List<FuncionSala> listaFuncionesPelicula = clienteServicio.obtenerFuncionesDisponiblesPelicula(idPelicula);
        res.put("listaFunciones", listaFuncionesPelicula);

        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.OK);
    }


    @GetMapping("/obtener-peliculas-ciudad/{nombreCiudad}")
    public ResponseEntity<?> obtenerPeliculaCiudad(@PathVariable String nombreCiudad) {
        Map<String, Object> res = new HashMap<>();

        List<Pelicula> listaPeliculasCiudad = clienteServicio.obtenerPeliculasPorCiudad(nombreCiudad);
        res.put("listaPeliculas", listaPeliculasCiudad);

        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.OK);
    }

    @GetMapping("/obtener-peliculas-teatro/{nombreTeatro}")
    public ResponseEntity<?> obtenerPeliculaTeatro(@PathVariable String nombreTeatro) {
        Map<String, Object> res = new HashMap<>();

        List<Pelicula> listaPeliculasTeatro = clienteServicio.obtenerPeliculasPorTeatro(nombreTeatro);
        res.put("listaPeliculas", listaPeliculasTeatro);

        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.OK);
    }

    @GetMapping("/obtener-peliculas-preventa/{idCiudad}")
    public ResponseEntity<?> obtenerPeliculaPreventa(@PathVariable int idCiudad) {
        Map<String, Object> res = new HashMap<>();

        List<Pelicula> listaPeliculasPreventa = clienteServicio.obtenerPeliculaPreventa(idCiudad);
        res.put("listaPeliculas", listaPeliculasPreventa);

        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.OK);
    }

    @GetMapping("/obtener-peliculas-cartelera/{idCiudad}")
    public ResponseEntity<?> obtenerPeliculaCartelera(@PathVariable int idCiudad) {
        Map<String, Object> res = new HashMap<>();

        List<Pelicula> listaPeliculasCartelera = clienteServicio.obtenerPeliculaCartelera(idCiudad);
        res.put("listaPeliculas", listaPeliculasCartelera);

        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.OK);
    }

    @PostMapping("/registrar-PQRS")
    @ResponseStatus(code = HttpStatus.CREATED)
    public ResponseEntity<?> registrarPQRS(@RequestBody PQRS pqrs) {
        Map<String, Object> res = new HashMap<>();

        try {
            PQRS nuevoPQRS = clienteServicio.registrarPQRS(pqrs);
            res.put("pqrs", nuevoPQRS);
            res.put("mensaje", "¡Se ha registrado el PQRS con éxito!");
        } catch (Exception e) {
            res.put("mensaje", "Error al crear el PQRS");
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.CREATED);
    }

    @GetMapping("/validar-membresia/{email}/{contrasena}")
    public ResponseEntity<?> validarMembresia(@PathVariable String email, @PathVariable String contrasena) {
        Map<String, Object> res = new HashMap<>();

        try {
            boolean registroMembresia = clienteServicio.obtenerMembresiaCliente(email, contrasena);
            res.put("respuestaMembresia", registroMembresia);
            res.put("mensaje", "¡Se ha registrado la membresía con éxito!");
        } catch (Exception e) {
            res.put("mensaje", "Error al registrar la membresía");
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.CREATED);
    }

    @GetMapping("/lista-pqrs")
    public ResponseEntity<?> listaPQRS() {
        Map<String, Object> res = new HashMap<>();
        try {
            List<PQRS> listaPQRS = clienteServicio.listarPQRS();
            res.put("listaPQRS", listaPQRS);
        } catch (Exception e) {
            res.put("mensaje", "Error al cargar los pqrs");
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.OK);
    }

    @GetMapping("/lista-pqrs-cliente")
    public ResponseEntity<?> listaPQRSCliente(@PathVariable String email) {
        Map<String, Object> res = new HashMap<>();
        try {
            List<PQRS> listaPQRSCliente = clienteServicio.obtenerPQRSEmailCliente(email);
            res.put("listaPQRSCliente", listaPQRSCliente);
        } catch (Exception e) {
            res.put("mensaje", "Error al cargar los pqrs del cliente");
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.OK);
    }





}
