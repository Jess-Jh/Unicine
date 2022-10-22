package co.edu.uniquindio.unicine.test.repositorios;

import co.edu.uniquindio.unicine.test.dto.ConfiteriaDTO;
import co.edu.uniquindio.unicine.test.entidades.Confiteria;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ConfiteriaRepo extends JpaRepository<Confiteria, Integer> {

    @Query("select conf from Confiteria conf")
    List<Confiteria> obtenerConfiteria();

    @Query("select new co.edu.uniquindio.unicine.test.dto.ConfiteriaDTO( conf.nombre, conf.precio ) from Confiteria conf")
    List<ConfiteriaDTO> obtenerConfiteria2();

}
