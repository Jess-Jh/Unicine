package co.edu.uniquindio.unicine.test;

import co.edu.uniquindio.unicine.test.entidades.*;
import co.edu.uniquindio.unicine.test.repositorios.AdministradorRepo;
import co.edu.uniquindio.unicine.test.repositorios.EntradaRepo;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.jdbc.Sql;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.*;

@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
public class EntradaTest {

    @Autowired
    private EntradaRepo entradaRepo;

    @Test
    @Sql("classpath:dataset.sql")
    public void registrar(){
        List<String> telefonos = new ArrayList<>();
        telefonos.add("313447");
        Cliente cliente = new Cliente("1094973943", "juan jose", "correo@gmail.com", "4444",null,telefonos, null);
        Teatro teatro = new Teatro("Teatro prueba", "Centro carrera 14 #21",null);
        DistribucionSilla distribuccionSilla = new DistribucionSilla("Distribuccion 1", 49, 7, 7);
        Sala sala = new Sala("Sala prueba", teatro, distribuccionSilla);
        Pelicula pelicula = new Pelicula("pelicula prueba", EstadoPelicula.CARTELERA, "ruta/url", "thriller", "sinopsis prueba", "jhon doe - jana doe", null);
        //nuevo
        LocalTime time = LocalTime.now();
        LocalDate date = LocalDate.now();

        Horario horario = new Horario(date,time);

        Funcion funcion = new Funcion(horario, 20000.0);
        FuncionSala funcionSala = new FuncionSala(sala, pelicula, funcion);

        Compra compra = new Compra("Efectivo", 20000.0, 21000.0, cliente, funcionSala, null);

        Entrada entrada = new Entrada("Fila C3", "Columna A1", compra);
        Entrada guardado = entradaRepo.save(entrada);

        Assertions.assertEquals(21000.0,entrada.getCompra().getTotal());
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void eliminar(){
        Entrada buscado = entradaRepo.findById(1).orElse(null);
        entradaRepo.delete(buscado);

        Assertions.assertNull( entradaRepo.findById(1).orElse(null) );
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void actualizar(){
        Entrada guardado = entradaRepo.findById(1).orElse(null);
        guardado.setColumnaSilla("Columna A3");

        Entrada nuevo = entradaRepo.save(guardado);
        Assertions.assertEquals("Columna A3", nuevo.getColumnaSilla());
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void obtener(){
        Optional<Entrada> buscado = entradaRepo.findById(1);
        Assertions.assertNotNull( buscado.orElse(null) );
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void listar(){
        List<Entrada> lista = entradaRepo.findAll();
        lista.forEach(System.out::println);
    }
}
