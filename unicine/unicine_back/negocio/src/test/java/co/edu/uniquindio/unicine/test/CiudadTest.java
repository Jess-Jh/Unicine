package co.edu.uniquindio.unicine.test;

import co.edu.uniquindio.unicine.test.entidades.Administrador;
import co.edu.uniquindio.unicine.test.entidades.Ciudad;
import co.edu.uniquindio.unicine.test.repositorios.AdministradorRepo;
import co.edu.uniquindio.unicine.test.repositorios.CiudadRepo;
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
public class CiudadTest {

    @Autowired
    private CiudadRepo ciudadRepo;

    @Test
    @Sql("classpath:dataset.sql")
    public void registrar(){
        Ciudad ciudad = new Ciudad("Armenia");
        Ciudad guardado = ciudadRepo.save(ciudad);

        Assertions.assertEquals("Armenia",ciudad.getNombre());
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void eliminar(){
        Ciudad buscado = ciudadRepo.findById(1).orElse(null);
        ciudadRepo.delete(buscado);

        Assertions.assertNull( ciudadRepo.findById(1).orElse(null) );
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void actualizar(){
        Ciudad guardado = ciudadRepo.findById(1).orElse(null);
        guardado.setNombre("Bogota");

        Ciudad nuevo = ciudadRepo.save(guardado);
        Assertions.assertEquals("Bogota", nuevo.getNombre());
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void obtener(){
        Optional<Ciudad> buscado = ciudadRepo.findById(1);
        Assertions.assertNotNull( buscado.orElse(null) );
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void listar(){
        List<Ciudad> lista = ciudadRepo.findAll();
        lista.forEach(System.out::println);
    }


    @Test
    @Sql("classpath:dataset.sql")
    public void listarNombreCiudades(){
        List<String> lista = ciudadRepo.listarCiudades();
        lista.forEach(System.out::println);
    }
}
