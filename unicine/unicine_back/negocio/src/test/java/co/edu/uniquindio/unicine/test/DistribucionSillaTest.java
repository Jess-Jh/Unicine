package co.edu.uniquindio.unicine.test;

import co.edu.uniquindio.unicine.test.entidades.DistribucionSilla;
import co.edu.uniquindio.unicine.test.entidades.Sala;
import co.edu.uniquindio.unicine.test.entidades.Teatro;
import co.edu.uniquindio.unicine.test.repositorios.DistribucionSillaRepo;
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
public class DistribucionSillaTest {
    @Autowired
    private DistribucionSillaRepo distribuccionSillaRepo;

    @Test
    @Sql("classpath:dataset.sql")
    public void registrar(){
        Teatro teatro = new Teatro("Teatro prueba", "Centro carrera 14 #21",null);
        DistribucionSilla distribuccionSilla = new DistribucionSilla("Distribuccion 1", 49, 7, 7);
        DistribucionSilla guardado = distribuccionSillaRepo.save(distribuccionSilla);

        Assertions.assertEquals("Distribuccion 1",distribuccionSilla.getDistribuccionSillas());
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void eliminar(){
        DistribucionSilla buscado = distribuccionSillaRepo.findById(1).orElse(null);
        distribuccionSillaRepo.delete(buscado);

        Assertions.assertNull( distribuccionSillaRepo.findById(1).orElse(null) );
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void actualizar(){
        DistribucionSilla guardado = distribuccionSillaRepo.findById(1).orElse(null);
        guardado.setDistribuccionSillas("Nueva distribuccion");

        DistribucionSilla nuevo = distribuccionSillaRepo.save(guardado);
        Assertions.assertEquals("Nueva distribuccion", nuevo.getDistribuccionSillas());
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void obtener(){
        Optional<DistribucionSilla> buscado = distribuccionSillaRepo.findById(2);
        Assertions.assertNotNull( buscado.orElse(null) );
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void listar(){
        List<DistribucionSilla> lista = distribuccionSillaRepo.findAll();
        lista.forEach(System.out::println);
    }



}
