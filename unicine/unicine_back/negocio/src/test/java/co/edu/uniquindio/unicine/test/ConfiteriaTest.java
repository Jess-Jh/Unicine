package co.edu.uniquindio.unicine.test;

import co.edu.uniquindio.unicine.test.dto.ConfiteriaDTO;
import co.edu.uniquindio.unicine.test.entidades.Confiteria;
import co.edu.uniquindio.unicine.test.repositorios.ConfiteriaRepo;
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
public class ConfiteriaTest {
    @Autowired
    private ConfiteriaRepo confiteriaRepo;

    @Test
    @Sql("classpath:dataset.sql")
    public void registrar(){
        Confiteria confiteria = new Confiteria("ruta/img",13000.0 , "confiteria 1");
        Confiteria guardado = confiteriaRepo.save(confiteria);

        Assertions.assertEquals("confiteria 1",confiteria.getNombre());
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void eliminar(){
        Confiteria buscado = confiteriaRepo.findById(1).orElse(null);
        confiteriaRepo.delete(buscado);

        Assertions.assertNull( confiteriaRepo.findById(1).orElse(null) );
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void actualizar(){
        Confiteria guardado = confiteriaRepo.findById(1).orElse(null);
        guardado.setNombre("Confiteria nueva");

        Confiteria nuevo = confiteriaRepo.save(guardado);
        Assertions.assertEquals("Confiteria nueva", nuevo.getNombre());
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void obtener(){
        Optional<Confiteria> buscado = confiteriaRepo.findById(1);
        Assertions.assertNotNull( buscado.orElse(null) );
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void listar(){
        List<Confiteria> lista = confiteriaRepo.findAll();
        lista.forEach(System.out::println);
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void obtenerConfiteria(){
        List<Confiteria> lista = confiteriaRepo.obtenerConfiteria();
        lista.forEach(System.out::println);
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void obtenerConfiteria2(){
        List<ConfiteriaDTO> lista = confiteriaRepo.obtenerConfiteria2();
        lista.forEach(System.out::println);
    }
}
