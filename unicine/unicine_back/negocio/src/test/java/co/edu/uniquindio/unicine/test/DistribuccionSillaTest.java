package co.edu.uniquindio.unicine.test;

import co.edu.uniquindio.unicine.test.entidades.Administrador;
import co.edu.uniquindio.unicine.test.entidades.DistribuccionSilla;
import co.edu.uniquindio.unicine.test.entidades.Sala;
import co.edu.uniquindio.unicine.test.entidades.Teatro;
import co.edu.uniquindio.unicine.test.repositorios.DistribuccionSillaRepo;
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
public class DistribuccionSillaTest {
    @Autowired
    private DistribuccionSillaRepo distribuccionSillaRepo;

    @Test
    @Sql("classpath:dataset.sql")
    public void registrar(){
        Teatro teatro = new Teatro("Teatro prueba", "Centro carrera 14 #21",null);
        Sala sala = new Sala("Sala prueba 1", teatro);
        DistribuccionSilla distribuccionSilla = new DistribuccionSilla("Distribuccion 1", 49, 7, 7, sala);
        DistribuccionSilla guardado = distribuccionSillaRepo.save(distribuccionSilla);

        Assertions.assertEquals("Distribuccion 1",distribuccionSilla.getDistribuccionSillas());
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void eliminar(){
        DistribuccionSilla buscado = distribuccionSillaRepo.findById(1).orElse(null);
        distribuccionSillaRepo.delete(buscado);

        Assertions.assertNull( distribuccionSillaRepo.findById(1).orElse(null) );
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void actualizar(){
        DistribuccionSilla guardado = distribuccionSillaRepo.findById(1).orElse(null);
        guardado.setDistribuccionSillas("Nueva distribuccion");

        DistribuccionSilla nuevo = distribuccionSillaRepo.save(guardado);
        Assertions.assertEquals("Nueva distribuccion", nuevo.getDistribuccionSillas());
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void obtener(){
        Optional<DistribuccionSilla> buscado = distribuccionSillaRepo.findById(2);
        Assertions.assertNotNull( buscado.orElse(null) );
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void listar(){
        List<DistribuccionSilla> lista = distribuccionSillaRepo.findAll();
        lista.forEach(System.out::println);
    }
}