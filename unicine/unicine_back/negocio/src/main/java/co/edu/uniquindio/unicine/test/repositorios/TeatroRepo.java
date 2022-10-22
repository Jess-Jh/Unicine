package co.edu.uniquindio.unicine.test.repositorios;

import co.edu.uniquindio.unicine.test.entidades.Teatro;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TeatroRepo extends JpaRepository<Teatro, Integer> {

    @Query("select t from Teatro t where t.ciudad.nombre = :nombreCiudad")
    List<Teatro> listar(String nombreCiudad);

    @Query("select t.ciudad.idCiudad, t.ciudad.nombre, count(t) from Teatro t group by t.ciudad")
    List<Object[]> contarTeatros();

    @Query("select t from Teatro t")
    List<Teatro> obtenerTeatros();

}
