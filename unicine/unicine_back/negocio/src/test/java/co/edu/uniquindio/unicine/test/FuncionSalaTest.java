package co.edu.uniquindio.unicine.test;

import co.edu.uniquindio.unicine.test.dto.CarteleraDTO;
import co.edu.uniquindio.unicine.test.dto.FuncionSalaDTO;
import co.edu.uniquindio.unicine.test.entidades.*;
import co.edu.uniquindio.unicine.test.repositorios.FuncionSalaRepo;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.jdbc.Sql;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.Optional;

@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
public class FuncionSalaTest {

    @Autowired
    private FuncionSalaRepo funcionSalaRepo;

    @Test
    @Sql("classpath:dataset.sql")
    public void registrar(){
        Teatro teatro = new Teatro("Teatro prueba", "Centro carrera 14 #21",null);
        DistribucionSilla distribuccionSilla = new DistribucionSilla("Distribuccion 1", 49, 7, 7);
        Sala sala = new Sala("Sala prueba", teatro, distribuccionSilla);
        Pelicula pelicula = new Pelicula("pelicula prueba", EstadoPelicula.CARTELERA, "ruta/url", "thriller", "sinopsis prueba", "jhon doe - jana doe", null);
        //nuevo
        LocalTime time = LocalTime.now();
        LocalDate date = LocalDate.now();

        Horario horario = new Horario(date,time);

        Funcion funcion = new Funcion(horario, 20000.0);

        FuncionSala funcionSala = new FuncionSala(sala, pelicula, funcion);
        FuncionSala guardado = funcionSalaRepo.save(funcionSala);

        Assertions.assertEquals("pelicula prueba",funcionSala.getPelicula().getNombre());
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void eliminar(){
        FuncionSala buscado = funcionSalaRepo.findById(1).orElse(null);
        funcionSalaRepo.delete(buscado);

        Assertions.assertNull( funcionSalaRepo.findById(1).orElse(null) );
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void actualizar(){
        LocalTime time = LocalTime.now();
        LocalDate date = LocalDate.now();

        Horario horario = new Horario(date,time);

        Funcion funcionNueva = new Funcion(horario, 20000.0);
        FuncionSala guardado = funcionSalaRepo.findById(2).orElse(null);
        guardado.setFuncion(funcionNueva);

        FuncionSala nuevo = funcionSalaRepo.save(guardado);
        Assertions.assertEquals(funcionNueva, nuevo.getFuncion());
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void obtener(){
        Optional<FuncionSala> buscado = funcionSalaRepo.findById(1);
        Assertions.assertNotNull( buscado.orElse(null) );
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void listar(){
        List<FuncionSala> lista = funcionSalaRepo.findAll();
        lista.forEach(System.out::println);
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void obtenerPeliculaFuncionSala(){
        String nombre = funcionSalaRepo.obtenerNombrePelicula(1);
        //System.out.println(nombre);
        Assertions.assertEquals("pelicula prueba2", nombre);
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void obtenerFuncionSala(){
        List<FuncionSalaDTO> lista = funcionSalaRepo.listarFunciones(2);
        lista.forEach(System.out::println);
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void obtenerCartelera(){
        List<CarteleraDTO> lista = funcionSalaRepo.obtenerCartelera(1);
        //System.out.println(lista.toString());
        lista.forEach(System.out::println);
    }

}
