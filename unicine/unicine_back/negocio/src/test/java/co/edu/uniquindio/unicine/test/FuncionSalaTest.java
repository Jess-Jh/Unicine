package co.edu.uniquindio.unicine.test;

import co.edu.uniquindio.unicine.test.entidades.*;
import co.edu.uniquindio.unicine.test.repositorios.FuncionSalaRepo;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.jdbc.Sql;

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
        Sala sala = new Sala("Sala prueba", teatro);
        Pelicula pelicula = new Pelicula("pelicula prueba", "ruta/img", "ruta/url", "thriller", "sinopsis prueba", "jhon doe - jana doe", null);
        Funcion funcion = new Funcion("Lunes-Viernes", 20000.0);

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
        Funcion funcionNueva = new Funcion("Lunes-Viernes", 20000.0);
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
}
