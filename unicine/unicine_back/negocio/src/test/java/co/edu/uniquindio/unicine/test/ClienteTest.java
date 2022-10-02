package co.edu.uniquindio.unicine.test;

import co.edu.uniquindio.unicine.test.entidades.Cliente;
import co.edu.uniquindio.unicine.test.repositorios.ClienteRepo;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.jdbc.Sql;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
public class ClienteTest {

    @Autowired
    private ClienteRepo clienteRepo;

    @Test
    @Sql("classpath:dataset.sql")
    public void registrar(){

        Map<String, String> telefonos = new HashMap<>();
        telefonos.put("movil","313447");

        Cliente cliente = new Cliente("1094973", "juan jose", "correo@gmail.com", "4444",telefonos);

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

}
