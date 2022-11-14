package co.edu.uniquindio.unicine.test;

import co.edu.uniquindio.unicine.test.entidades.Cliente;
import co.edu.uniquindio.unicine.test.servicios.ClienteServicio;
import co.edu.uniquindio.unicine.test.servicios.EmailServicio;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.jdbc.Sql;

import javax.transaction.Transactional;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@SpringBootTest
@Transactional
public class ClienteServicioTest {

    @Autowired
    private ClienteServicio clienteServicio;

    @Autowired
    private EmailServicio emailServicio;

    @Test
    @Sql("classpath:dataset.sql")
    public void registrarClienteTest(){
        Cliente cliente = new Cliente("1094973943", "juan jose", "correoPrueba@gmail.com", "4444",null,null, null);
        try {
            Cliente nuevo = clienteServicio.registrarCliente(cliente);
            Assertions.assertNotNull(nuevo);
        } catch (Exception e) {
            Assertions.assertTrue(false);
        }
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void actualizarClienteTest(){
        try {
            Cliente cliente = clienteServicio.obtenerCliente("12345");
            cliente.setNombreCompleto("Ansumane fati");
            Cliente nuevo = clienteServicio.actualizarCliente(cliente);

            Assertions.assertEquals("Ansumane fati", nuevo.getNombreCompleto());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void eliminarClienteTest(){
        try {
            clienteServicio.eliminarCliente("12345");
        } catch (Exception e) {
            Assertions.assertTrue(false);
        }

        try {
            clienteServicio.obtenerCliente("12345");
        } catch (Exception e) {
            Assertions.assertTrue(true);
        }
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void listarClienteTest(){
        List<Cliente> lista = clienteServicio.listarClientes();
        lista.forEach(System.out::println);
    }

    @Test
    public void enviarEmailTest(){
        emailServicio.enviarEmail("Prueba de envio", "Este es un mensaje", "imanork13@gmail.com");
    }
}
