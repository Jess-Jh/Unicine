package co.edu.uniquindio.unicine.test.repositorios;

import co.edu.uniquindio.unicine.test.entidades.PQRS;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PQRSRepo extends JpaRepository<PQRS, Integer> {

    @Query("select pq from PQRS pq join pq.cliente c where c.email = :email")
    List<PQRS> obtenerPQRSCliente(String email);
}
