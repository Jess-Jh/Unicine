package co.edu.uniquindio.unicine.test;

import co.edu.uniquindio.unicine.test.dto.HorarioDTO;
import co.edu.uniquindio.unicine.test.entidades.Cupon;
import co.edu.uniquindio.unicine.test.entidades.Horario;
import co.edu.uniquindio.unicine.test.repositorios.HorarioRepo;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.jdbc.Sql;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
public class HorarioTest {

    @Autowired
    private HorarioRepo horarioRepo;

    @Test
    @Sql("classpath:dataset.sql")
    public void registrar(){
        LocalTime time = LocalTime.now();
        LocalDate date = LocalDate.now();

        Horario horario = new Horario(date,time);

        Horario guardado = horarioRepo.save(horario);

        Assertions.assertEquals(date, horario.getFecha());

    }

    @Test
    @Sql("classpath:dataset.sql")
    public void eliminar(){
        Horario buscado = horarioRepo.findById(1).orElse(null);
        horarioRepo.delete(buscado);

        Assertions.assertNull( horarioRepo.findById(1).orElse(null) );
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void actualizar(){
        LocalDate date = LocalDate.now();

        Horario guardado = horarioRepo.findById(1).orElse(null);
        guardado.setFecha(date);

        Horario nuevo = horarioRepo.save(guardado);
        Assertions.assertEquals(date, nuevo.getFecha());
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void listar(){
        List<Horario> lista = horarioRepo.findAll();
        lista.forEach(System.out::println);
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void obtenerHorario(){
        List<HorarioDTO> lista = horarioRepo.obtenerHorario();
        lista.forEach(System.out::println);
    }

}
