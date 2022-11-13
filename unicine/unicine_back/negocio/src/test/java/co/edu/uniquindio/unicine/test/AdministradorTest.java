package co.edu.uniquindio.unicine.test;

import co.edu.uniquindio.unicine.test.entidades.Administrador;
import co.edu.uniquindio.unicine.test.entidades.Cliente;
import co.edu.uniquindio.unicine.test.repositorios.AdministradorRepo;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.jdbc.Sql;

import java.util.List;
import java.util.Optional;

@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
public class AdministradorTest {
    @Autowired
    private AdministradorRepo administradorRepo;

    /*
    @Test
    @Sql("classpath:dataset.sql")
    public void registrar(){
        Administrador administrador = new Administrador("1094973", "juan jose", "correo@gmail.com", "4444", null);
        Administrador guardado = administradorRepo.save(administrador);

        Assertions.assertEquals("juan jose",administrador.getNombreCompleto());
    }

     */

    @Test
    @Sql("classpath:dataset.sql")
    public void eliminar(){
        Administrador buscado = administradorRepo.findById("12351").orElse(null);
        administradorRepo.delete(buscado);

        Assertions.assertNull( administradorRepo.findById("12351").orElse(null) );
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void actualizar(){
        Administrador guardado = administradorRepo.findById("12351").orElse(null);
        guardado.setEmail("correoNuevoAdmin2@gmail.com");

        Administrador nuevo = administradorRepo.save(guardado);
        Assertions.assertEquals("correoNuevoAdmin2@gmail.com", nuevo.getEmail());
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void obtener(){
        Optional<Administrador> buscado = administradorRepo.findById("12351");
        Assertions.assertNotNull( buscado.orElse(null) );
    }

    @Test
    @Sql("classpath:dataset.sql")
    public void listar(){
        List<Administrador> lista = administradorRepo.findAll();
        lista.forEach(System.out::println);
    }
}
