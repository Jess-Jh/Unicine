package co.edu.uniquindio.unicine.test.repositorios;

import co.edu.uniquindio.unicine.test.dto.CuponDTO;
import co.edu.uniquindio.unicine.test.entidades.Cupon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CuponRepo extends JpaRepository<Cupon, Integer> {

    @Query("select new co.edu.uniquindio.unicine.test.dto.CuponDTO( c.valorDescuento, c.descripcion ) from Cupon c")
    List<CuponDTO> obtenerCupones();

}
