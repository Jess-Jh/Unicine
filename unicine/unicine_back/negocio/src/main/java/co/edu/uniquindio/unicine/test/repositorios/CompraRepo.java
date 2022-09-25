package co.edu.uniquindio.unicine.test.repositorios;

import co.edu.uniquindio.unicine.test.entidades.Compra;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CompraRepo extends JpaRepository<Compra, Integer> {
}
