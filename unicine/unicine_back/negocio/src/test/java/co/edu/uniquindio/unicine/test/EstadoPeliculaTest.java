package co.edu.uniquindio.unicine.test;

import co.edu.uniquindio.unicine.test.entidades.EstadoPelicula;
import co.edu.uniquindio.unicine.test.repositorios.EstadoPeliculaRepo;
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
public class EstadoPeliculaTest {
    @Autowired
    private EstadoPeliculaRepo estadoPeliculaRepo;

    @Test
    @Sql("classpath:dataset.sql")
    public void registrar(){
        EstadoPelicula estadoPelicula = new EstadoPelicula(1);
        EstadoPelicula guardado = estadoPeliculaRepo.save(estadoPelicula);

        Assertions.assertEquals(1,estadoPelicula.getTipoEstado());
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void eliminar(){
        EstadoPelicula buscado = estadoPeliculaRepo.findById(1).orElse(null);
        estadoPeliculaRepo.delete(buscado);

        Assertions.assertNull( estadoPeliculaRepo.findById(1).orElse(null) );
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void actualizar(){
        EstadoPelicula guardado = estadoPeliculaRepo.findById(1).orElse(null);
        guardado.setTipoEstado(0);

        EstadoPelicula nuevo = estadoPeliculaRepo.save(guardado);
        Assertions.assertEquals(0, nuevo.getTipoEstado());
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void obtener(){
        Optional<EstadoPelicula> buscado = estadoPeliculaRepo.findById(1);
        Assertions.assertNotNull( buscado.orElse(null) );
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void listar(){
        List<EstadoPelicula> lista = estadoPeliculaRepo.findAll();
        lista.forEach(System.out::println);
    }
}
