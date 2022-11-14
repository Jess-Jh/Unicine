package co.edu.uniquindio.unicine.test.repositorios;

import co.edu.uniquindio.unicine.test.dto.SalaDTO;
import co.edu.uniquindio.unicine.test.entidades.DistribucionSilla;
import co.edu.uniquindio.unicine.test.entidades.Sala;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SalaRepo extends JpaRepository<Sala, Integer> {

    @Query("select s.nombre, s.distribucionSilla from Sala s")
    List<SalaDTO> obtenerSalas();

    @Query("select ds.distribucionSilla from Sala ds where ds.idSala = :idSala")
    DistribucionSilla obtenerDistribucionPorSala(Integer idSala);


}
