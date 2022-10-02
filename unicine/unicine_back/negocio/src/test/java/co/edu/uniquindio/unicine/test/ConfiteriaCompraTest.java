package co.edu.uniquindio.unicine.test;

import co.edu.uniquindio.unicine.test.entidades.*;
import co.edu.uniquindio.unicine.test.repositorios.AdministradorRepo;
import co.edu.uniquindio.unicine.test.repositorios.ConfiteriaCompraRepo;
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
public class ConfiteriaCompraTest {

    @Autowired
    private ConfiteriaCompraRepo confiteriaCompraRepo;

    @Test
    @Sql("classpath:dataset.sql")
    public void registrar(){
        Map<String, String> telefonos = new HashMap<>();
        telefonos.put("movil","313447");
        Cliente cliente = new Cliente("1094973943", "juan jose", "correo@gmail.com", "4444",telefonos);
        Teatro teatro = new Teatro("Teatro prueba", "Centro carrera 14 #21",null);
        Sala sala = new Sala("Sala prueba", teatro);
        Pelicula pelicula = new Pelicula("pelicula prueba", "ruta/img", "ruta/url", "thriller", "sinopsis prueba", "jhon doe - jana doe", null);
        Funcion funcion = new Funcion("Lunes-Viernes", 20000.0);
        FuncionSala funcionSala = new FuncionSala(sala, pelicula, funcion);

        Compra compra = new Compra("Efectivo", 20000.0, 20000.0, cliente, funcionSala);
        Confiteria confiteria = new Confiteria("ruta/img",13000.0 , "confiteria 1");

        ConfiteriaCompra confiteriaCompra = new ConfiteriaCompra(30000.0, compra, confiteria);
        ConfiteriaCompra guardado = confiteriaCompraRepo.save(confiteriaCompra);

        Assertions.assertEquals("confiteria 1",confiteriaCompra.getConfiteria().getNombre());
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void eliminar(){
        ConfiteriaCompra buscado = confiteriaCompraRepo.findById(1).orElse(null);
        confiteriaCompraRepo.delete(buscado);

        Assertions.assertNull( confiteriaCompraRepo.findById(1).orElse(null) );
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void actualizar(){
        ConfiteriaCompra guardado = confiteriaCompraRepo.findById(1).orElse(null);
        guardado.setPrecio(0.0);

        ConfiteriaCompra nuevo = confiteriaCompraRepo.save(guardado);
        Assertions.assertEquals(0.0, nuevo.getPrecio());
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void obtener(){
        Optional<ConfiteriaCompra> buscado = confiteriaCompraRepo.findById(1);
        Assertions.assertNotNull( buscado.orElse(null) );
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void listar(){
        List<ConfiteriaCompra> lista = confiteriaCompraRepo.findAll();
        lista.forEach(System.out::println);
    }
}
