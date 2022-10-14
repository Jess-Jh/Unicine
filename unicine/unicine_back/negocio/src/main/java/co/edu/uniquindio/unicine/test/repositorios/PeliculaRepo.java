package co.edu.uniquindio.unicine.test.repositorios;

import co.edu.uniquindio.unicine.test.dto.HorarioSalaDTO;
import co.edu.uniquindio.unicine.test.entidades.Pelicula;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Objects;

@Repository
public interface PeliculaRepo extends JpaRepository<Pelicula, Integer> {

    @Query("select p from Pelicula p where p.nombre like concat('%', :nombre, '%') and p.estadoPelicula.tipoEstado = :estadoPelicula")
    List<Pelicula> buscarPelicula(String nombre, Integer estadoPelicula);

    @Query("select new co.edu.uniquindio.unicine.test.dto.HorarioSalaDTO(f.funcion.horario, f.sala) from Pelicula p join p.listaFuncionSala f where p.idPelicula = :idPelicula " +
            " and f.sala.teatro.idTeatro = :idTeatro")
    List<HorarioSalaDTO> listarHorarios(Integer idPelicula, Integer idTeatro);


}
