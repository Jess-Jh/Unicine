package co.edu.uniquindio.unicine.test.repositorios;

import co.edu.uniquindio.unicine.test.entidades.Cupon;
import co.edu.uniquindio.unicine.test.entidades.CuponCliente;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CuponClienteRepo extends JpaRepository<CuponCliente, Integer> {

    @Query("select cc from CuponCliente cc where cc.cliente.email = :emailCliente")
    List<CuponCliente> listar (String emailCliente);
}
