package co.edu.uniquindio.unicine.test.controladores;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import co.edu.uniquindio.unicine.test.entidades.Ciudad;
import co.edu.uniquindio.unicine.test.entidades.Confiteria;
import co.edu.uniquindio.unicine.test.entidades.Cupon;
import co.edu.uniquindio.unicine.test.entidades.Pelicula;
import co.edu.uniquindio.unicine.test.servicios.AdminServicio;
import org.springframework.beans.factory.annotation.Autowired;



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
    @ResponseStatus(code = HttpStatus.CREATED)
    public ResponseEntity<?> crearPelicula(@RequestBody Pelicula pelicula) {
        Map<String, Object> res = new HashMap<>();

        try {
            Pelicula nuevaPelicula = adminServicio.crearPelicula(pelicula);
            res.put("pelicula", nuevaPelicula);
            res.put("mensaje", "Se ha creado la pelicula con éxito!");
        } catch (Exception e) {
            res.put("mensaje", "Error al crear la película");
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.CREATED);
    }

    @PutMapping("/actualizar-pelicula")
    @ResponseStatus(code = HttpStatus.CREATED)
    public ResponseEntity<?> actualizarPelicula(@RequestBody Pelicula pelicula) {
        Map<String, Object> res = new HashMap<>();

        try {
            Pelicula peliculaActualizada = adminServicio.actualizarPelicula(pelicula);
            res.put("pelicula", peliculaActualizada);
            res.put("mensaje", "La película ha sido actualizada con éxito!");
        } catch (Exception e) {
            res.put("mensaje", "Error al actualizar la película");
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.CREATED);
    }

    @DeleteMapping("/eliminar-pelicula/{idPelicula}")
    @ResponseStatus(code = HttpStatus.OK)
    public ResponseEntity<?> eliminarPelicula(@PathVariable Integer idPelicula) {
        Map<String, Object> res = new HashMap<>();

        try {
            adminServicio.eliminarPelicula(idPelicula);
        } catch (Exception e) {
            res.put("mensaje", "Error al eliminar la película ");
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
        res.put("mensaje", "Se ha eliminado la película con éxito");
        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.OK);
    }

    @GetMapping("/lista-peliculas")
    public ResponseEntity<?> listarPeliculas() {
        Map<String, Object> res = new HashMap<>();

        try {
            List<Pelicula> listaPeliculas = adminServicio.listarPeliculas();
            res.put("Peliculas", listaPeliculas);
        } catch (Exception e) {
            res.put("mensaje", "Hubo un error al momento de enviar las películas");
            res.put("Error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.OK);
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
