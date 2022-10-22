package co.edu.uniquindio.unicine.test.repositorios;

import co.edu.uniquindio.unicine.test.dto.CarteleraDTO;
import co.edu.uniquindio.unicine.test.dto.FuncionSalaDTO;
import co.edu.uniquindio.unicine.test.entidades.FuncionSala;
import co.edu.uniquindio.unicine.test.entidades.Sala;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FuncionSalaRepo  extends JpaRepository<FuncionSala, Integer> {

    @Query("select fs.pelicula.nombre from FuncionSala fs where fs.idFuncionSala = :idFuncionSala")
    String obtenerNombrePelicula(Integer idFuncionSala);

    @Query("select new co.edu.uniquindio.unicine.test.dto.FuncionSalaDTO(f.pelicula.nombre, f.pelicula.estadoPelicula, f.pelicula.imagen," +
            " f.sala.idSala, f.sala.teatro.direccion, f.sala.teatro.ciudad.nombre, " +
            "f.funcion.horario) from FuncionSala f where f.pelicula.idPelicula = :idPelicula")
    List<FuncionSalaDTO> listarFunciones(Integer idPelicula);

    @Query("select f from FuncionSala f where f.sala.teatro.idTeatro = :idTeatro and f.listaCompras is empty")
    List<FuncionSala> obtenerFuncionesSalaSinCompra(Integer idTeatro);

    @Query("select new co.edu.uniquindio.unicine.test.dto.CarteleraDTO( p.nombre, p.reparto, p.sinopsis, p.trailer, p.imagen, " +
            "f.horario, t.nombre ) from FuncionSala fs join fs.funcion f join fs.pelicula p join fs.sala s join s.teatro t where" +
            " p.idPelicula = :idPelicula")
    List<CarteleraDTO> obtenerCartelera(Integer idPelicula);


}
