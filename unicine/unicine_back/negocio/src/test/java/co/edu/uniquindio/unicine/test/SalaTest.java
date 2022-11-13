package co.edu.uniquindio.unicine.test;

import co.edu.uniquindio.unicine.test.dto.SalaDTO;
import co.edu.uniquindio.unicine.test.entidades.DistribucionSilla;
import co.edu.uniquindio.unicine.test.entidades.Sala;
import co.edu.uniquindio.unicine.test.entidades.Teatro;
import co.edu.uniquindio.unicine.test.repositorios.SalaRepo;
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
public class SalaTest {

    @Autowired
    private SalaRepo salaRepo;

    @Test
    @Sql("classpath:dataset.sql")
    public void registrar(){
        Teatro teatro = new Teatro("Teatro prueba", "Centro carrera 14 #21",null);
        DistribucionSilla distribuccionSilla = new DistribucionSilla("Distribuccion 1", 49, 7, 7);
        Sala sala = new Sala("Sala prueba 1", teatro, distribuccionSilla);
        Sala guardado = salaRepo.save(sala);

        Assertions.assertEquals("Teatro prueba",teatro.getNombre());
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void eliminar(){
        Sala buscado = salaRepo.findById(1).orElse(null);
        salaRepo.delete(buscado);

        Assertions.assertNull( salaRepo.findById(1).orElse(null) );
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void actualizar(){
        Sala guardado = salaRepo.findById(1).orElse(null);
        guardado.setNombre("Nueva sala prueba");

        Sala nuevo = salaRepo.save(guardado);
        Assertions.assertEquals("Nueva sala prueba", nuevo.getNombre());
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void obtener(){
        Optional<Sala> buscado = salaRepo.findById(1);
        Assertions.assertNotNull( buscado.orElse(null) );
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void listar(){
        List<Sala> lista = salaRepo.findAll();
        lista.forEach(System.out::println);
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void obtenerSalas(){
        List<SalaDTO> lista = salaRepo.obtenerSalas();
        lista.forEach(System.out::println);
    }


}
