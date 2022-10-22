package co.edu.uniquindio.unicine.test.repositorios;

import co.edu.uniquindio.unicine.test.entidades.Ciudad;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CiudadRepo extends JpaRepository<Ciudad, Integer> {

    @Query("select c.idCiudad, c.nombre, count(t) " +
            "from Ciudad c join c.listaTeatros t " +
            "group by c.idCiudad")
    List<Object[]> contarTeatros();

    @Query("select c.nombre from Ciudad c")
    List<String> listarCiudades();

}
