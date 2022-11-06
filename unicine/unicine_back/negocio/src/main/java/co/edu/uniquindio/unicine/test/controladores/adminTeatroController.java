package co.edu.uniquindio.unicine.test.controladores;

import co.edu.uniquindio.unicine.test.entidades.Funcion;
import co.edu.uniquindio.unicine.test.entidades.Horario;
import co.edu.uniquindio.unicine.test.entidades.Sala;
import co.edu.uniquindio.unicine.test.entidades.Teatro;
import co.edu.uniquindio.unicine.test.servicios.AdminTeatroServicio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin(origins = {"http://localhost:8080"})
@RestController
public class adminTeatroController {

    @Autowired
    private AdminTeatroServicio adminTeatroServicio;

    @PostMapping("/crear-horario")
    public Horario crearHorario(@RequestBody Horario horario) {
        return adminTeatroServicio.crearHorario(horario);
    }

    @GetMapping("/obtener-horario/{idHorario}")
    public Horario obtenerHorario(@PathVariable Integer idHorario) throws Exception {
        return adminTeatroServicio.obtenerHorario(idHorario);
    }

    @DeleteMapping("/eliminar-horario/{idHorario}")
    public boolean eliminarHorario( @PathVariable Integer idHorario ) throws Exception {
        return adminTeatroServicio.eliminarHorario(idHorario);
    }

    @GetMapping("/lista-horarios")
    public List<Horario> listaHorarios() {
        return adminTeatroServicio.listarHorarios();
    }

    @PostMapping("/crear-funcion")
    public Funcion crearFuncion(@RequestBody Funcion funcion) {
        return adminTeatroServicio.crearFuncion(funcion);
    }

    @GetMapping("/obtener-funcion/{idFuncion}")
    public Funcion obtenerFuncion(@PathVariable Integer idFuncion) throws Exception {
        return adminTeatroServicio.obtenerFuncion(idFuncion);
    }

    @DeleteMapping("/eliminar-funcion/{idFuncion}")
    public boolean eliminarFuncion( @PathVariable Integer idFuncion ) throws Exception {
        return adminTeatroServicio.eliminarFuncion(idFuncion);
    }

    @GetMapping("/lista-funciones")
    public List<Funcion> listaFunciones() {
        return adminTeatroServicio.listarFunciones();
    }

    @PostMapping("/crear-sala")
    public Sala crearSala(@RequestBody Sala sala) {
        return adminTeatroServicio.crearSala(sala);
    }

    @GetMapping("/obtener-sala/{idSala}")
    public Sala obtenerSala(@PathVariable Integer idSala) throws Exception {
        return adminTeatroServicio.obtenerSala(idSala);
    }

    @DeleteMapping("/eliminar-sala/{idSala}")
    public boolean eliminarSala( @PathVariable Integer idSala ) throws Exception {
        return adminTeatroServicio.eliminarSala(idSala);
    }

    @GetMapping("/lista-salas")
    public List<Sala> listaSalas() {
        return adminTeatroServicio.listarSalas();
    }

    @PostMapping("/crear-teatro")
    public Teatro crearTeatro(@RequestBody Teatro teatro) {
        return adminTeatroServicio.crearTeatro(teatro);
    }

    @GetMapping("/obtener-teatro/{idTeatro}")
    public Teatro obtenerTeatro(@PathVariable Integer idTeatro) throws Exception {
        return adminTeatroServicio.obtenerTeatro(idTeatro);
    }

    @DeleteMapping("/eliminar-teatro/{idTeatro}")
    public boolean eliminarTeatro( @PathVariable Integer idTeatro ) throws Exception {
        return adminTeatroServicio.eliminarTeatro(idTeatro);
    }

    @GetMapping("/lista-teatros")
    public List<Teatro> listaTeatros() {
        return adminTeatroServicio.listarTeatros();
    }






}
