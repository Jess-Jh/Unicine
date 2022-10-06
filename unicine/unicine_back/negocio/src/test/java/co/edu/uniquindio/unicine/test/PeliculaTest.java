package co.edu.uniquindio.unicine.test;

import co.edu.uniquindio.unicine.test.entidades.Pelicula;
import co.edu.uniquindio.unicine.test.repositorios.PeliculaRepo;
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
public class PeliculaTest {

    @Autowired
    private PeliculaRepo peliculaRepo;

    @Test
    @Sql("classpath:dataset.sql")
    public void registrar(){
        Pelicula pelicula = new Pelicula("pelicula prueba", "ruta/img", "ruta/url", "thriller", "sinopsis prueba", "jhon doe - jana doe", null);
        Pelicula guardado = peliculaRepo.save(pelicula);

        Assertions.assertEquals("pelicula prueba",pelicula.getNombre());
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void eliminar(){
        Pelicula buscado = peliculaRepo.findById(2).orElse(null);
        peliculaRepo.delete(buscado);

        Assertions.assertNull( peliculaRepo.findById(2).orElse(null) );
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void actualizar(){
        Pelicula guardado = peliculaRepo.findById(2).orElse(null);
        guardado.setGenero("Romance prueba");

        Pelicula nuevo = peliculaRepo.save(guardado);
        Assertions.assertEquals("Romance prueba", nuevo.getGenero());
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void obtener(){
        Optional<Pelicula> buscado = peliculaRepo.findById(2);
        Assertions.assertNotNull( buscado.orElse(null) );
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void listar(){
        List<Pelicula> lista = peliculaRepo.findAll();
        lista.forEach(System.out::println);
    }
}