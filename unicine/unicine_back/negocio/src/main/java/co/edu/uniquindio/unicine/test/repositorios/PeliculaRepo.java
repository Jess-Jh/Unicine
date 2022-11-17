package co.edu.uniquindio.unicine.test.repositorios;

import co.edu.uniquindio.unicine.test.dto.HorarioSalaDTO;
import co.edu.uniquindio.unicine.test.dto.PeliculaDTO;
import co.edu.uniquindio.unicine.test.dto.PeliculaPreventaDTO;
import co.edu.uniquindio.unicine.test.entidades.*;
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
            "and p.estadoPelicula = :estadoPelicula")
    List<Pelicula> buscarPelicula(String nombre, EstadoPelicula estadoPelicula);

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

    @Query("select new co.edu.uniquindio.unicine.test.dto.PeliculaDTO( p.nombre, p.genero, p.estadoPelicula, p.imagen ) from Pelicula p")
    List<PeliculaDTO> obtenerPeliculas();

    @Query("select new co.edu.uniquindio.unicine.test.dto.PeliculaPreventaDTO( p.nombre, p.genero ) " +
            "from Pelicula p where p.estadoPelicula = :preventa")
    List<PeliculaPreventaDTO> obtenerPeliculaPreventa(EstadoPelicula preventa);

    @Query("select p from Pelicula p where p.estadoPelicula = :preventa")
    List<Pelicula> obtenerPeliculaPreventaCompleta(EstadoPelicula preventa);

    @Query("select fs from FuncionSala fs join fs.pelicula p where p.idPelicula = :idPelicula")
    List<FuncionSala> obtenerFuncionPorIdpelicula(Integer idPelicula);

    @Query("select p from Pelicula p join p.listaFuncionSala fs join fs.sala s join s.teatro t join t.ciudad c where c.idCiudad = :idCiudad and p.estadoPelicula = :preventa")
    List<Pelicula> obtenerPeliculaPreventaCiudad(Integer idCiudad, EstadoPelicula preventa);

    @Query("select p from Pelicula p join p.listaFuncionSala fs join fs.sala s join s.teatro t join t.ciudad c where c.idCiudad = :idCiudad and p.estadoPelicula = :cartelera")
    List<Pelicula> obtenerPeliculaCarteleraCiudad(Integer idCiudad, EstadoPelicula cartelera);
}
