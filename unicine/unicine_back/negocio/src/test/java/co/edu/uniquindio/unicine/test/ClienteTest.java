package co.edu.uniquindio.unicine.test;

import co.edu.uniquindio.unicine.test.entidades.Cliente;
import co.edu.uniquindio.unicine.test.entidades.Compra;
import co.edu.uniquindio.unicine.test.entidades.CuponCliente;
import co.edu.uniquindio.unicine.test.repositorios.ClienteRepo;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.test.context.jdbc.Sql;

import java.awt.print.Pageable;
import java.util.*;

@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
public class ClienteTest {

    @Autowired
    private ClienteRepo clienteRepo;

    @Test
    @Sql("classpath:dataset.sql")
    public void registrar(){
        List<String> telefonos = new ArrayList<>();
        telefonos.add("313447");
        Cliente cliente = new Cliente("1094973", "juan jose", "correo@gmail.com", "4444",null,telefonos, null);

        Cliente guardado = clienteRepo.save(cliente);

        Assertions.assertEquals("juan jose",cliente.getNombreCompleto());
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void eliminar(){

        Cliente buscado = clienteRepo.findById("12345").orElse(null);
        clienteRepo.delete(buscado);

        Assertions.assertNull( clienteRepo.findById("12345").orElse(null) );
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void actualizar(){

        Cliente guardado = clienteRepo.findById("12345").orElse(null);
        guardado.setEmail("correoNuevo2@gmail.com");

        Cliente nuevo = clienteRepo.save(guardado);
        Assertions.assertEquals("correoNuevo2@gmail.com", nuevo.getEmail());
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void obtener(){
        Optional<Cliente> buscado = clienteRepo.findById("12345");
        Assertions.assertNotNull( buscado.orElse(null) );
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void listar(){
        List<Cliente> lista = clienteRepo.findAll();
        lista.forEach(System.out::println);
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void obtenerPorEmail(){
        Cliente cliente = clienteRepo.findByEmail("correo@gmail.com").orElse(null);
        Assertions.assertNotNull(cliente);
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void comprobarAutenticacion(){
        Cliente cliente = clienteRepo.findByEmailAndContrasena("correo@gmail.com", "123");
        Assertions.assertNotNull(cliente);
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void paginador(){
        List<Cliente> lista = clienteRepo.findAll(PageRequest.of(0,2)).toList();
        lista.forEach(System.out::println);
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void paginadorEstado(){
        List<Cliente> lista = clienteRepo.obtenerPorEstado(1, PageRequest.of(0,2));
        lista.forEach(System.out::println);
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void ordenarRegistros(){
        List<Cliente> lista = clienteRepo.findAll(Sort.by("nombreCompleto").descending());
        lista.forEach(System.out::println);
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void obtenerCompras(){
        List<Compra> lista = clienteRepo.obtenerComprasOpcion3("correo@gmail.com");
        lista.forEach(System.out::println);
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void obtenerCupones(){
        List<CuponCliente> lista = clienteRepo.obtenerCupones("correo@gmail.com");
        //lista.forEach(System.out::println);
        Assertions.assertEquals(2, lista.size());
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void obtenerCliente(){
        Cliente cliente = clienteRepo.obtenerCliente("correo@gmail.com");
        Assertions.assertNotNull(cliente);
    }
}
