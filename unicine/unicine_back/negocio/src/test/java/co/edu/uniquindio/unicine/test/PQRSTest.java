package co.edu.uniquindio.unicine.test;

import co.edu.uniquindio.unicine.test.entidades.Cliente;
import co.edu.uniquindio.unicine.test.entidades.Confiteria;
import co.edu.uniquindio.unicine.test.entidades.PQRS;
import co.edu.uniquindio.unicine.test.repositorios.PQRSRepo;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.jdbc.Sql;

import java.util.*;

@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
public class PQRSTest {

    @Autowired
    private PQRSRepo pqrsRepo;

    @Test
    @Sql("classpath:dataset.sql")
    public void registrar(){
        List<String> telefonos = new ArrayList<>();
        telefonos.add("313447");
        Cliente cliente = new Cliente("1094973943", "juan jose", "correo@gmail.com", "4444",null,telefonos, null);

        PQRS pqrs = new PQRS("Mensaje de prueba para el usuario", cliente);
        PQRS guardado = pqrsRepo.save(pqrs);

        Assertions.assertEquals("1094973943",pqrs.getCliente().getCedula());
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void eliminar(){
        PQRS buscado = pqrsRepo.findById(1).orElse(null);
        pqrsRepo.delete(buscado);

        Assertions.assertNull( pqrsRepo.findById(1).orElse(null) );
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void actualizar(){
        PQRS guardado = pqrsRepo.findById(1).orElse(null);
        guardado.setMensaje("Se cambia el mensaje de pqrs");

        PQRS nuevo = pqrsRepo.save(guardado);
        Assertions.assertEquals("Se cambia el mensaje de pqrs", nuevo.getMensaje());
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void obtener(){
        Optional<PQRS> buscado = pqrsRepo.findById(1);
        Assertions.assertNotNull( buscado.orElse(null) );
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void listar(){
        List<PQRS> lista = pqrsRepo.findAll();
        lista.forEach(System.out::println);
    }
}
