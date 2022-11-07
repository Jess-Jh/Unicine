package co.edu.uniquindio.unicine.test.controladores;

import co.edu.uniquindio.unicine.test.entidades.Ciudad;
import co.edu.uniquindio.unicine.test.entidades.Confiteria;
import co.edu.uniquindio.unicine.test.entidades.Cupon;
import co.edu.uniquindio.unicine.test.entidades.Pelicula;
import co.edu.uniquindio.unicine.test.servicios.AdminServicio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@CrossOrigin(maxAge = 3600)
@RestController
public class AdminController {

    @Autowired
    private AdminServicio adminServicio;

    @PostMapping("/registrar-ciudad")
    public Ciudad registrarCiudad(@RequestBody Ciudad ciudad) {
        return adminServicio.crearCiudad(ciudad);
    }

    @GetMapping("/obtener-ciudad/{idCiudad}")
    public Ciudad obtenerCiudad(@PathVariable Integer idCiudad) throws Exception {
        return adminServicio.obtenerCiudad(idCiudad);
    }

    @PostMapping("/crear-pelicula")
    public Pelicula crearPelicula(@RequestBody Pelicula pelicula) {
        return adminServicio.crearPelicula(pelicula);
    }

    @PutMapping("/actualizar-pelicula")
    public Pelicula actualizarPelicula(@RequestBody Pelicula pelicula) throws Exception {
        return adminServicio.actualizarPelicula(pelicula);
    }

    @DeleteMapping("/eliminar-pelicula/{idPelicula}")
    public boolean eliminarPelicula(@PathVariable Integer idPelicula) throws Exception {
        return adminServicio.eliminarPelicula(idPelicula);
    }

    @GetMapping("/lista-peliculas")
    public List<Pelicula> listarPeliculas() {
        return adminServicio.listarPeliculas();
    }

    @GetMapping("/detalle-pelicula/{idPelicula}")
    public Pelicula obtenerPelicula(@PathVariable Integer idPelicula) throws Exception {
        return adminServicio.obtenerPelicula(idPelicula);
    }

    @PostMapping("/crear-cupon")
    public Cupon crearCupon(@RequestBody Cupon cupon) {
        return adminServicio.crearCupon(cupon);
    }

    @PutMapping("/actualizar-cupon")
    public Cupon actualizarCupon(@RequestBody Cupon cupon) throws Exception {
        return adminServicio.actualizarCupon(cupon);
    }

    @GetMapping("/obtener-cupon/{idCupon}")
    public Cupon obtenerCupon(@PathVariable Integer idCupon) throws Exception {
        return adminServicio.obtenerCupon(idCupon);
    }

    @DeleteMapping("/eliminar-cupon/{idCupon}")
    public boolean eliminarCupon(@PathVariable Integer idCupon) throws Exception {
        return adminServicio.eliminarCupon(idCupon);
    }

    @GetMapping("/lista-cupones")
    public List<Cupon> listaCupones() {
        return adminServicio.listarCupones();
    }

    @PostMapping("/crear-confiteria")
    public Confiteria crearConfiteria(@RequestBody Confiteria confiteria) {
        return adminServicio.crearConfiteria(confiteria);
    }

    @PutMapping("/actualizar-confiteria")
    public Confiteria actualizarConfiteria(@RequestBody Confiteria confiteria) throws Exception {
        return adminServicio.actualizarConfiteria(confiteria);
    }

    @GetMapping("/obtener-confiteria/{idConfiteria}")
    public Confiteria obtenerConfiteria( @PathVariable Integer idConfiteria ) throws Exception {
        return adminServicio.obtenerConfiteria(idConfiteria);
    }

    @DeleteMapping("/eliminar-confiteria/{idConfiteria}")
    public boolean eliminarConfiteria(@PathVariable Integer idConfiteria) throws Exception {
        return adminServicio.eliminarConfiteria(idConfiteria);
    }

    @GetMapping("/lista-confiteria")
    public List<Confiteria> listaConfiterias() {
        return adminServicio.listarConfiteria();
    }




}
