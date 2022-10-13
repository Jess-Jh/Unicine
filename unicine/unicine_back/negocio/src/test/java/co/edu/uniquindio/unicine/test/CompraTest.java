package co.edu.uniquindio.unicine.test;

import co.edu.uniquindio.unicine.test.entidades.*;
import co.edu.uniquindio.unicine.test.repositorios.CompraRepo;
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
public class CompraTest {

    @Autowired
    private CompraRepo compraRepo;

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
        Compra guardado = compraRepo.save(compra);

        Assertions.assertEquals("juan jose",compra.getCliente().getNombreCompleto());
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void eliminar(){
        Compra buscado = compraRepo.findById(1).orElse(null);
        compraRepo.delete(buscado);

        Assertions.assertNull( compraRepo.findById(1).orElse(null) );
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void actualizar(){
        Compra guardado = compraRepo.findById(1).orElse(null);
        guardado.setSubtotal(55000.0);

        Compra nuevo = compraRepo.save(guardado);
        Assertions.assertEquals(55000.0, nuevo.getSubtotal());
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void obtener(){
        Optional<Compra> buscado = compraRepo.findById(1);
        Assertions.assertNotNull( buscado.orElse(null) );
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void listar(){
        List<Compra> lista = compraRepo.findAll();
        lista.forEach(System.out::println);
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void obtenerEntradasCompra(){
        List<Entrada> lista = compraRepo.obtenerEntradas(1);
        //lista.forEach(System.out::println);
        Assertions.assertEquals(2, lista.size());
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void obtenerComprasPorCliente(){
        List<Object[]> lista = compraRepo.obtenerComprasTodos();
        lista.forEach(o ->
                System.out.println(o[0] + ", " + o[1])
        );
        //Assertions.assertEquals(2, lista.size());
    }
}
