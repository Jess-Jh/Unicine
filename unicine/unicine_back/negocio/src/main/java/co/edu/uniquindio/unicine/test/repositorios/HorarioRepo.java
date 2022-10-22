package co.edu.uniquindio.unicine.test.repositorios;

import co.edu.uniquindio.unicine.test.dto.HorarioDTO;
import co.edu.uniquindio.unicine.test.entidades.Horario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HorarioRepo extends JpaRepository<Horario, Integer> {

    @Query("select new co.edu.uniquindio.unicine.test.dto.HorarioDTO(h.fecha, h.hora) from Horario h")
    List<HorarioDTO> obtenerHorario();

}
