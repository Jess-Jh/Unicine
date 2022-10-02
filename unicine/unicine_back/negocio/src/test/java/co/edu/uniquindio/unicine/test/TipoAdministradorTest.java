package co.edu.uniquindio.unicine.test;

import co.edu.uniquindio.unicine.test.entidades.TipoAdministrador;
import co.edu.uniquindio.unicine.test.repositorios.TipoAdministradorRepo;
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
public class TipoAdministradorTest {
    @Autowired
    private TipoAdministradorRepo tipoAdministradorRepo;

    @Test
    @Sql("classpath:dataset.sql")
    public void registrar(){
        TipoAdministrador tipoAdministrador = new TipoAdministrador(1);
        TipoAdministrador guardado = tipoAdministradorRepo.save(tipoAdministrador);

        Assertions.assertEquals(1,tipoAdministrador.getTipoAdministrador());
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void eliminar(){
        TipoAdministrador buscado = tipoAdministradorRepo.findById(1).orElse(null);
        tipoAdministradorRepo.delete(buscado);

        Assertions.assertNull( tipoAdministradorRepo.findById(1).orElse(null) );
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void actualizar(){
        TipoAdministrador guardado = tipoAdministradorRepo.findById(1).orElse(null);
        guardado.setTipoAdministrador(0);

        TipoAdministrador nuevo = tipoAdministradorRepo.save(guardado);
        Assertions.assertEquals(0, nuevo.getTipoAdministrador());
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void obtener(){
        Optional<TipoAdministrador> buscado = tipoAdministradorRepo.findById(1);
        Assertions.assertNotNull( buscado.orElse(null) );
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void listar(){
        List<TipoAdministrador> lista = tipoAdministradorRepo.findAll();
        lista.forEach(System.out::println);
    }

}
