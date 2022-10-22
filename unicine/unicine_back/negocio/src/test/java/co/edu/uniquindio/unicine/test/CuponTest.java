package co.edu.uniquindio.unicine.test;

import co.edu.uniquindio.unicine.test.dto.CuponDTO;
import co.edu.uniquindio.unicine.test.entidades.Cupon;
import co.edu.uniquindio.unicine.test.repositorios.CuponRepo;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.jdbc.Sql;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
public class CuponTest {
    @Autowired
    private CuponRepo cuponRepo;

    @Test
    @Sql("classpath:dataset.sql")
    public void registrar(){
        LocalDate tiempo = LocalDate.now();
        Cupon cupon = new Cupon(20000.0, tiempo, "descripcion pru", "criterio");
        Cupon guardado = cuponRepo.save(cupon);

        Assertions.assertEquals("descripcion pru",cupon.getDescripcion());
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void eliminar(){
        Cupon buscado = cuponRepo.findById(1).orElse(null);
        cuponRepo.delete(buscado);

        Assertions.assertNull( cuponRepo.findById(1).orElse(null) );
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void actualizar(){
        Cupon guardado = cuponRepo.findById(1).orElse(null);
        guardado.setDescripcion("Descripcion nueva");

        Cupon nuevo = cuponRepo.save(guardado);
        Assertions.assertEquals("Descripcion nueva", nuevo.getDescripcion());
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void obtener(){
        Optional<Cupon> buscado = cuponRepo.findById(1);
        Assertions.assertNotNull( buscado.orElse(null) );
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void listar(){
        List<Cupon> lista = cuponRepo.findAll();
        lista.forEach(System.out::println);
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void obtenerCupones(){
        List<CuponDTO> lista = cuponRepo.obtenerCupones();
        lista.forEach(System.out::println);
    }

}
