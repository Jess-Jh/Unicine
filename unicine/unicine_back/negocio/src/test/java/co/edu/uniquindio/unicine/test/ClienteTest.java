package co.edu.uniquindio.unicine.test;

import ch.qos.logback.core.CoreConstants;
import co.edu.uniquindio.unicine.test.entidades.Cliente;
import co.edu.uniquindio.unicine.test.repositorios.ClienteRepo;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;

import java.io.OutputStream;
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
    public void registrar(){

        Map<String, String> telefonos = new HashMap<>();
        telefonos.put("movil","313447");

        Cliente cliente = new Cliente("1094973", "juan jose", "correo@gmail.com", "4444",telefonos);

        Cliente guardado = clienteRepo.save(cliente);

        Assertions.assertEquals("juan jose",cliente.getNombreCompleto());
    }

    @Test
    public void eliminar(){

        Map<String, String> telefonos = new HashMap<>();
        telefonos.put("movil","313447");

        Cliente cliente = new Cliente("1094973", "juan jose", "correo@gmail.com", "4444",telefonos);

        Cliente guardado = clienteRepo.save(cliente);

        clienteRepo.delete(guardado);

        Optional<Cliente> buscado = clienteRepo.findById("1094973");

        Assertions.assertNull(buscado.orElse(null));
    }

    @Test
    public void actualizar(){

        Map<String, String> telefonos = new HashMap<>();
        telefonos.put("movil","313447");

        Cliente cliente = new Cliente("1094973", "juan jose", "correo@gmail.com", "4444",telefonos);

        Cliente guardado = clienteRepo.save(cliente);

        guardado.setEmail("correo2@gmail.com");

        Cliente nuevo = clienteRepo.save(guardado);

        Assertions.assertEquals("correo2@gmail.com", nuevo.getEmail());

    }

    @Test
    public void obtener(){

        Map<String, String> telefonos = new HashMap<>();
        telefonos.put("movil","313447");

        Cliente cliente = new Cliente("1094973", "juan jose", "correo@gmail.com", "4444",telefonos);

        clienteRepo.save(cliente);

        Optional<Cliente> buscado = clienteRepo.findById("1094973");

        System.out.println( buscado.orElse(null) );


    }

    @Test
    public void listar(){

        Map<String, String> telefonos = new HashMap<>();
        telefonos.put("movil","313447");

        Cliente cliente = new Cliente("1094973", "juan jose", "correo@gmail.com", "4444",telefonos);

        clienteRepo.save(cliente);

        List<Cliente> lista = clienteRepo.findAll();

        System.out.println(lista);

    }

}
