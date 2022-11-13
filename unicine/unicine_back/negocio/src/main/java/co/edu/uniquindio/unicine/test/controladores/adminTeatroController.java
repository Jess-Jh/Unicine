package co.edu.uniquindio.unicine.test.controladores;

import co.edu.uniquindio.unicine.test.entidades.*;
import co.edu.uniquindio.unicine.test.servicios.AdminTeatroServicio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@CrossOrigin(maxAge = 3600)
@RestController
public class adminTeatroController {

    @Autowired
    private AdminTeatroServicio adminTeatroServicio;

    @PostMapping("/crear-horario")
    @ResponseStatus(code = HttpStatus.CREATED)
    public ResponseEntity<?> crearHorario(@RequestBody Horario horario) {
        Map<String, Object> res = new HashMap<>();

        try {
            Horario nuevoHorario = adminTeatroServicio.crearHorario(horario);
            res.put("horario", nuevoHorario);
            res.put("mensaje", "¡El horario ha sido creado con éxito!");
        } catch (Exception e) {
            res.put("mensaje", "Error al crear el horario");
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.CREATED);
    }

    @GetMapping("/obtener-horario/{idHorario}")
    public ResponseEntity<?> obtenerHorario(@PathVariable Integer idHorario) {
        Map<String, Object> res = new HashMap<>();

        try {
            Horario horario = adminTeatroServicio.obtenerHorario(idHorario);
            res.put("horario", horario);
        } catch (Exception e) {
            res.put("mensaje", "Error al buscar el horario");
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.OK);
    }

    @PutMapping("/actualizar-horario")
    @ResponseStatus(code = HttpStatus.OK)
    public ResponseEntity<?> actualizarHorario(@RequestBody Horario horario) {
        Map<String, Object> res = new HashMap<>();

        try {
            Horario horarioActualizado = adminTeatroServicio.actualizarHorario(horario);
            res.put("horario", horarioActualizado);
            res.put("mensaje", "El horario ha sido actualizado con éxito!");
        } catch (Exception e) {
            res.put("mensaje", "Error al actualizar el horario");
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.OK);
    }

    @DeleteMapping("/eliminar-horario/{idHorario}")
    @ResponseStatus(code = HttpStatus.OK)
    public ResponseEntity<?> eliminarHorario( @PathVariable Integer idHorario ) {
        Map<String, Object> res = new HashMap<>();

        try {
            adminTeatroServicio.eliminarHorario(idHorario);
            res.put("mensaje", "¡El horario ha sido eliminado con éxito!");
        } catch (Exception e) {
            res.put("mensaje", "Error al eliminar el horario " + idHorario);
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.CREATED);
    }

    @GetMapping("/lista-horarios")
    public ResponseEntity<?> listaHorarios() {
        Map<String, Object> res = new HashMap<>();

        try {
            List<Horario> listaHorarios = adminTeatroServicio.listarHorarios();
            res.put("horarios", listaHorarios);
        } catch (Exception e) {
            res.put("mensaje", "Error al buscar los horarios");
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.OK);
    }

    @PostMapping("/crear-funcion")
    @ResponseStatus(code = HttpStatus.CREATED)
    public ResponseEntity<?> crearFuncion(@RequestBody Funcion funcion) {
        Map<String, Object> res = new HashMap<>();

        try {
            Funcion nuevaFuncion = adminTeatroServicio.crearFuncion(funcion);
            res.put("pelicula", nuevaFuncion);
            res.put("mensaje", "¡Se ha creado la función con éxito!");
        } catch (Exception e) {
            res.put("mensaje", "Error al crear la función");
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.CREATED);
    }

    @GetMapping("/obtener-funcion/{idFuncion}")
    public ResponseEntity<?> obtenerFuncion(@PathVariable Integer idFuncion) {
        Map<String, Object> res = new HashMap<>();

        try {
            Funcion funcion = adminTeatroServicio.obtenerFuncion(idFuncion);
            res.put("funcion", funcion);
        } catch (Exception e) {
            res.put("mensaje", "Error al buscar la función con el id " + idFuncion);
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.OK);
    }

    @PutMapping("/actualizar-funcion")
    @ResponseStatus(code = HttpStatus.OK)
    public ResponseEntity<?> actualizarFuncion(@RequestBody Funcion funcion) {
        Map<String, Object> res = new HashMap<>();

        try {
            Funcion funcionActualizada = adminTeatroServicio.actualizarFuncion(funcion);
            res.put("funcion", funcionActualizada);
            res.put("mensaje", "La función ha sido actualizada con éxito!");
        } catch (Exception e) {
            res.put("mensaje", "Error al actualizar la función");
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.OK);
    }

    @DeleteMapping("/eliminar-funcion/{idFuncion}")
    @ResponseStatus(code = HttpStatus.OK)
    public ResponseEntity<?> eliminarFuncion( @PathVariable Integer idFuncion ) {
        Map<String, Object> res = new HashMap<>();

        try {
            adminTeatroServicio.eliminarFuncion(idFuncion);
            res.put("mensaje", "¡La función ha sido eliminada con éxito!");
        } catch (Exception e) {
            res.put("mensaje", "Error al eliminar la función " + idFuncion);
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.CREATED);
    }

    @GetMapping("/lista-funciones")
    public ResponseEntity<?> listaFunciones() {
        Map<String, Object> res = new HashMap<>();

        try {
            List<Funcion> listaFunciones = adminTeatroServicio.listarFunciones();
            res.put("funciones", listaFunciones);
        } catch (Exception e) {
            res.put("mensaje", "Error al buscar las funciones");
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.OK);
    }

    @PostMapping("/crear-sala")
    @ResponseStatus(code = HttpStatus.CREATED)
    public ResponseEntity<?> crearSala(@RequestBody Sala sala) {
        Map<String, Object> res = new HashMap<>();

        try {
            Sala nuevaSala = adminTeatroServicio.crearSala(sala);
            res.put("sala", nuevaSala);
            res.put("mensaje", "¡La sala ha sido creada con éxito!");
        } catch (Exception e) {
            res.put("mensaje", "Error al crear la sala");
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.CREATED);
    }

    @GetMapping("/obtener-sala/{idSala}")
    public ResponseEntity<?> obtenerSala(@PathVariable Integer idSala) {
        Map<String, Object> res = new HashMap<>();

        try {
            Sala sala = adminTeatroServicio.obtenerSala(idSala);
            res.put("sala", sala);
        } catch (Exception e) {
            res.put("mensaje", "Error al buscar la sala");
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.OK);
    }

    @PutMapping("/actualizar-sala")
    @ResponseStatus(code = HttpStatus.OK)
    public ResponseEntity<?> actualizarSala(@RequestBody Sala sala) {
        Map<String, Object> res = new HashMap<>();

        try {
            Sala salaActualizada = adminTeatroServicio.actualizarSala(sala);
            res.put("sala", salaActualizada);
            res.put("mensaje", "La sala ha sido actualizada con éxito!");
        } catch (Exception e) {
            res.put("mensaje", "Error al actualizar la sala");
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.OK);
    }

    @DeleteMapping("/eliminar-sala/{idSala}")
    @ResponseStatus(code = HttpStatus.OK)
    public ResponseEntity<?> eliminarSala( @PathVariable Integer idSala ) {
        Map<String, Object> res = new HashMap<>();

        try {
            adminTeatroServicio.eliminarSala(idSala);
            res.put("mensaje", "¡La sala ha sido eliminada con éxito!");
        } catch (Exception e) {
            res.put("mensaje", "Error al eliminar la sala " + idSala);
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.CREATED);
    }

    @GetMapping("/lista-salas")
    public ResponseEntity<?> listaSalas() {
        Map<String, Object> res = new HashMap<>();

        try {
            List<Sala> listaSalas = adminTeatroServicio.listarSalas();
            res.put("salas", listaSalas);
        } catch (Exception e) {
            res.put("mensaje", "Error al buscar las salas");
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.OK);
    }

    @PostMapping("/crear-teatro")
    @ResponseStatus(code = HttpStatus.CREATED)
    public ResponseEntity<?> crearTeatro(@RequestBody Teatro teatro) {
        Map<String, Object> res = new HashMap<>();

        try {
            Teatro nuevoTeatro = adminTeatroServicio.crearTeatro(teatro);
            res.put("teatro", nuevoTeatro);
            res.put("mensaje", "¡Se ha creado el teatro con éxito!");
        } catch (Exception e) {
            res.put("mensaje", "Error al crear el teatro");
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.CREATED);
    }

    @PutMapping("/actualizar-teatro")
    @ResponseStatus(code = HttpStatus.OK)
    public ResponseEntity<?> actualizarTeatro(@RequestBody Teatro teatro) {
        Map<String, Object> res = new HashMap<>();

        try {
            Teatro teatroActualizado = adminTeatroServicio.actualizarTeatro(teatro);
            res.put("teatro", teatroActualizado);
            res.put("mensaje", "El teatro ha sido actualizado con éxito!");
        } catch (Exception e) {
            res.put("mensaje", "Error al actualizar el teatro");
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.OK);
    }

    @GetMapping("/obtener-teatro/{idTeatro}")
    public ResponseEntity<?> obtenerTeatro(@PathVariable Integer idTeatro) {
        Map<String, Object> res = new HashMap<>();

        try {
            Teatro teatro = adminTeatroServicio.obtenerTeatro(idTeatro);
            res.put("teatro", teatro);
        } catch (Exception e) {
            res.put("mensaje", "Error al buscar el teatro");
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.OK);
    }

    @DeleteMapping("/eliminar-teatro/{idTeatro}")
    @ResponseStatus(code = HttpStatus.OK)
    public ResponseEntity<?> eliminarTeatro( @PathVariable Integer idTeatro ) {
        Map<String, Object> res = new HashMap<>();

        try {
            adminTeatroServicio.eliminarTeatro(idTeatro);
            res.put("mensaje", "¡El teatro ha sido eliminado con éxito!");
        } catch (Exception e) {
            res.put("mensaje", "Error al eliminar el teatro con el id " + idTeatro);
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
        res.put("mensaje", "¡El teatro ha sido eliminado con éxito!");
        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.OK);
    }

    @GetMapping("/lista-teatros")
    public ResponseEntity<?> listaTeatros() {
        Map<String, Object> res = new HashMap<>();

        try {
            List<Teatro> listaTeatros = adminTeatroServicio.listarTeatros();
            res.put("teatros", listaTeatros);
        } catch (Exception e) {
            res.put("mensaje", "Error al cargar los teatros");
            res.put("error", e.getMessage());
            return new ResponseEntity<Map<String, Object>>(res, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Map<String, Object>>(res, HttpStatus.OK);
    }
}
