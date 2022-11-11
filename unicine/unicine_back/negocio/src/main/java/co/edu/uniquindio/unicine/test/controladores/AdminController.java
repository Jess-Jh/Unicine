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
            res.put("mensaje", "¡Se ha creado la pelicula con éxito!");
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
            res.put("mensaje", "¡La película ha sido actualizada con éxito!");
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
            res.put("mensaje", "¡Se ha eliminado la película con éxito!");
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.OK);
        } catch (Exception e) {
            res.put("mensaje", "Error al eliminar la película con el id " + idPelicula);

            res.put("error", e.getMessage());
          
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
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
    public ResponseEntity<?> obtenerPelicula(@PathVariable Integer idPelicula) {
        Map<String, Object> res = new HashMap<>();

        try {
            Pelicula pelicula = adminServicio.obtenerPelicula(idPelicula);
            res.put("pelicula", pelicula);
        } catch (Exception e) {
            res.put("mensaje", "Error al buscar la película");
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.OK);
    }

    @PostMapping("/crear-cupon")
    @ResponseStatus(code = HttpStatus.CREATED)
    public ResponseEntity<?> crearCupon(@RequestBody Cupon cupon) {
        Map<String, Object> res = new HashMap<>();

        try{
            Cupon nuevoCupon = adminServicio.crearCupon(cupon);
            res.put("cupon", nuevoCupon);
            res.put("mensaje", "¡El cupón ha sido creado con éxito!");
        } catch (Exception e) {
            res.put("mensaje", "Error al crear el cupón");
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.CREATED);
    }

    @PutMapping("/actualizar-cupon")
    @ResponseStatus(code = HttpStatus.OK)
    public ResponseEntity<?> actualizarCupon(@RequestBody Cupon cupon) {
        Map<String, Object> res = new HashMap<>();

        try {
            Cupon cuponActualizado = adminServicio.actualizarCupon(cupon);
            res.put("cupon", cuponActualizado);
            res.put("mensaje", "El cupón ha sido actualizado con éxito!");
        } catch (Exception e) {
            res.put("mensaje", "Error al actualizar el cupón");
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.OK);
    }

    @GetMapping("/obtener-cupon/{idCupon}")
    public ResponseEntity<?> obtenerCupon(@PathVariable Integer idCupon) {
        Map<String, Object> res = new HashMap<>();
        try {
            Cupon cupon = adminServicio.obtenerCupon(idCupon);
            res.put("cupon", cupon);
        } catch (Exception e) {
            res.put("mensaje", "Error al buscar el cupón");
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.OK);
    }

    @DeleteMapping("/eliminar-cupon/{idCupon}")
    @ResponseStatus(code = HttpStatus.OK)
    public ResponseEntity<?> eliminarCupon(@PathVariable Integer idCupon) {
        Map<String, Object> res = new HashMap<>();

        try {
            adminServicio.eliminarCupon(idCupon);
            res.put("mensaje", "¡El cupón ha sido eliminado con éxito!");
        } catch (Exception e) {
            res.put("mensaje", "Error al eliminar el cupón con el id " + idCupon);
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
        res.put("mensaje", "¡El cupón ha sido eliminado con éxito!");
        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.OK);
    }

    @GetMapping("/lista-cupones")
    public ResponseEntity<?> listaCupones() {
        Map<String, Object> res = new HashMap<>();
        try {
           List<Cupon> listaCupones = adminServicio.listarCupones();
           res.put("cupones", listaCupones);
        } catch (Exception e) {
            res.put("mensaje", "Error al cargar los cupones");
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.OK);
    }

    @PostMapping("/crear-confiteria")
    @ResponseStatus(code = HttpStatus.CREATED)
    public ResponseEntity<?> crearConfiteria(@RequestBody Confiteria confiteria) {
        Map<String, Object> res = new HashMap<>();

        try {
            Confiteria nuevaConfiteria = adminServicio.crearConfiteria(confiteria);
            res.put("confiteria", nuevaConfiteria);
            res.put("mensaje", "¡Se ha creado la confitería con éxito!");
        } catch (Exception e) {
            res.put("mensaje", "Error al crear la confitería");
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.CREATED);
    }

    @PutMapping("/actualizar-confiteria")
    @ResponseStatus(code = HttpStatus.OK)
    public ResponseEntity<?> actualizarConfiteria(@RequestBody Confiteria confiteria) {
        Map<String, Object> res = new HashMap<>();

        try {
            Confiteria confiteriaActualizada = adminServicio.actualizarConfiteria(confiteria);
            res.put("confiteria", confiteriaActualizada);
            res.put("mensaje", "¡Se ha actualizado la confitería con éxito!");
        } catch (Exception e) {
            res.put("mensaje", "Error al actualizar la confitería");
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.OK);
    }

    @GetMapping("/obtener-confiteria/{idConfiteria}")
    public ResponseEntity<?> obtenerConfiteria( @PathVariable Integer idConfiteria ) {
        Map<String, Object> res = new HashMap<>();

        try {
            Confiteria confiteria = adminServicio.obtenerConfiteria(idConfiteria);
            res.put("confiteria", confiteria);
        } catch (Exception e) {
            res.put("mensaje", "Error al buscar la confitería");
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.OK);
    }

    @DeleteMapping("/eliminar-confiteria/{idConfiteria}")
    @ResponseStatus(code = HttpStatus.OK)
    public ResponseEntity<?> eliminarConfiteria(@PathVariable Integer idConfiteria) {
        Map<String, Object> res = new HashMap<>();

        try {
            adminServicio.eliminarConfiteria(idConfiteria);
            res.put("mensaje", "¡La confitería ha sido eliminada con éxito!");
        } catch (Exception e) {
            res.put("mensaje", "Error al eliminar la confitería " + idConfiteria);
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.OK);
    }

    @GetMapping("/lista-confiteria")
    public ResponseEntity<?> listaConfiterias() {
        Map<String, Object> response = new HashMap<>();
        try {
            List<Confiteria> listaConfiterias = adminServicio.listarConfiteria();
            response.put("confiterias", listaConfiterias);
        } catch (Exception e) {
            response.put("mensaje", "Error al buscar las confiterías");
            response.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(response, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Map<String, Object>>(response, HttpStatus.OK);
    }

}
