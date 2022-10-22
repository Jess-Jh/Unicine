package co.edu.uniquindio.unicine.test;

import co.edu.uniquindio.unicine.test.entidades.Teatro;
import co.edu.uniquindio.unicine.test.repositorios.TeatroRepo;
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
public class TeatroTest {
    @Autowired
    private TeatroRepo teatroRepo;

    @Test
    @Sql("classpath:dataset.sql")
    public void registrar(){
        Teatro teatro = new Teatro("Teatro prueba", "Centro carrera 14 #21",null);
        Teatro guardado = teatroRepo.save(teatro);

        Assertions.assertEquals("Teatro prueba",teatro.getNombre());
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void eliminar(){
        Teatro buscado = teatroRepo.findById(1).orElse(null);
        teatroRepo.delete(buscado);

        Assertions.assertNull( teatroRepo.findById(1).orElse(null) );
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void actualizar(){
        Teatro guardado = teatroRepo.findById(2).orElse(null);
        guardado.setNombre("Teatro unicentro");

        Teatro nuevo = teatroRepo.save(guardado);
        Assertions.assertEquals("Teatro unicentro", nuevo.getNombre());
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void obtener(){
        Optional<Teatro> buscado = teatroRepo.findById(2);
        Assertions.assertNotNull( buscado.orElse(null) );
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void listar(){
        List<Teatro> lista = teatroRepo.findAll();
        lista.forEach(System.out::println);
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void listarTeatrosPorCiudad(){
        List<Teatro> lista = teatroRepo.listar("armenia");
        lista.forEach(System.out::println);
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void obtenerTeatros(){
        List<Teatro> lista = teatroRepo.obtenerTeatros();
        lista.forEach(System.out::println);
    }

}
