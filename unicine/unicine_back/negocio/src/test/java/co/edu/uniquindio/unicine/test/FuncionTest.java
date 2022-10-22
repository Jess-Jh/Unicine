package co.edu.uniquindio.unicine.test;

import co.edu.uniquindio.unicine.test.entidades.Funcion;
import co.edu.uniquindio.unicine.test.entidades.Horario;
import co.edu.uniquindio.unicine.test.repositorios.FuncionRepo;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.jdbc.Sql;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.Optional;

@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
public class FuncionTest {

    @Autowired
    private FuncionRepo funcionRepo;

    @Test
    @Sql("classpath:dataset.sql")
    public void registrar(){
        LocalTime time = LocalTime.now();
        LocalDate date = LocalDate.now();

        Horario horario = new Horario(date,time);

        Funcion funcion = new Funcion(horario, 20000.0);
        Funcion guardado = funcionRepo.save(funcion);

        Assertions.assertEquals("Lunes-Viernes",funcion.getHorario());
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void eliminar(){
        Funcion buscado = funcionRepo.findById(2).orElse(null);
        funcionRepo.delete(buscado);

        Assertions.assertNull( funcionRepo.findById(2).orElse(null) );
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void actualizar(){
        Funcion guardado = funcionRepo.findById(2).orElse(null);
        guardado.setPrecio(15000.0);

        Funcion nuevo = funcionRepo.save(guardado);
        Assertions.assertEquals(15000.0, nuevo.getPrecio());
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void obtener(){
        Optional<Funcion> buscado = funcionRepo.findById(2);
        Assertions.assertNotNull( buscado.orElse(null) );
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void listar(){
        List<Funcion> lista = funcionRepo.findAll();
        lista.forEach(System.out::println);
    }
}
