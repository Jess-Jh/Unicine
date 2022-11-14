package co.edu.uniquindio.unicine.test;

import co.edu.uniquindio.unicine.test.entidades.Administrador;
import co.edu.uniquindio.unicine.test.entidades.Cliente;
import co.edu.uniquindio.unicine.test.entidades.Cupon;
import co.edu.uniquindio.unicine.test.entidades.CuponCliente;
import co.edu.uniquindio.unicine.test.repositorios.CuponClienteRepo;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.jdbc.Sql;

import java.time.LocalDate;
import java.util.*;

@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
public class CuponClienteTest {

    @Autowired
    private CuponClienteRepo cuponClienteRepo;

    @Test
    @Sql("classpath:dataset.sql")
    public void registrar(){
        LocalDate tiempo = LocalDate.now();
        Cupon cupon = new Cupon(20000.0, tiempo, "descripcion pru", "criterio");

        List<String> telefonos = new ArrayList<>();
        telefonos.add("313447");
        Cliente cliente = new Cliente("1094973", "juan jose", "correo@gmail.com", "4444",null,telefonos, null);


        CuponCliente cuponCliente = new CuponCliente(1, cupon, cliente);
        CuponCliente guardado = cuponClienteRepo.save(cuponCliente);

        Assertions.assertEquals("juan jose",cuponCliente.getCliente().getNombreCompleto());
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void eliminar(){
        CuponCliente buscado = cuponClienteRepo.findById(1).orElse(null);
        cuponClienteRepo.delete(buscado);

        Assertions.assertNull( cuponClienteRepo.findById(1).orElse(null) );
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void actualizar(){
        CuponCliente guardado = cuponClienteRepo.findById(1).orElse(null);
        guardado.setIsDisponible(0);

        CuponCliente nuevo = cuponClienteRepo.save(guardado);
        Assertions.assertEquals(0, nuevo.getIsDisponible());
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void obtener(){
        Optional<CuponCliente> buscado = cuponClienteRepo.findById(1);
        Assertions.assertNotNull( buscado.orElse(null) );
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void listar(){
        List<CuponCliente> lista = cuponClienteRepo.findAll();
        lista.forEach(System.out::println);
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void obtenerCuponCliente(){
        List<CuponCliente> lista = cuponClienteRepo.listar("correo@gmail.com");
        lista.forEach(System.out::println);
    }
}
