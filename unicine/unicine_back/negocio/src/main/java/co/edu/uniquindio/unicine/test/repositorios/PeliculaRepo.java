package co.edu.uniquindio.unicine.test.repositorios;

import co.edu.uniquindio.unicine.test.dto.HorarioSalaDTO;
import co.edu.uniquindio.unicine.test.dto.PeliculaDTO;
import co.edu.uniquindio.unicine.test.entidades.Entrada;
import co.edu.uniquindio.unicine.test.entidades.Pelicula;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Objects;

@Repository
public interface PeliculaRepo extends JpaRepository<Pelicula, Integer> {

    @Query("select p " +
            "from Pelicula p " +
            "where p.nombre " +
            "like concat('%', :nombre, '%') " +
            "and p.estadoPelicula.tipoEstado = :estadoPelicula")
    List<Pelicula> buscarPelicula(String nombre, Integer estadoPelicula);

    @Query("select new co.edu.uniquindio.unicine.test.dto.HorarioSalaDTO(f.funcion.horario, f.sala) " +
            "from Pelicula p join p.listaFuncionSala f " +
            "where p.idPelicula = :idPelicula " +
            "and f.sala.teatro.idTeatro = :idTeatro")
    List<HorarioSalaDTO> listarHorarios(Integer idPelicula, Integer idTeatro);

    @Query("select p " +
            "from Pelicula p join p.listaFuncionSala lfs join lfs.sala s join s.teatro t join t.ciudad c " +
            "where c.nombre = :nombreCiudad")
    List<Pelicula> obtenerPeliculasCiudad(String nombreCiudad);

    @Query("select p " +
            "from Pelicula p join p.listaFuncionSala lfs join lfs.sala s join s.teatro t " +
            "where t.nombre = :nombreTeatro")
    List<Pelicula> obtenerPeliculasTeatro(String nombreTeatro);

    @Query("select new co.edu.uniquindio.unicine.test.dto.PeliculaDTO( p.nombre, p.genero, p.estadoPelicula.tipoEstado, p.imagen ) from Pelicula p")
    List<PeliculaDTO> obtenerPeliculas();

}
