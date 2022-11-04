package co.edu.uniquindio.unicine.test.repositorios;

import co.edu.uniquindio.unicine.test.entidades.Cliente;
import co.edu.uniquindio.unicine.test.entidades.Compra;
import co.edu.uniquindio.unicine.test.entidades.CuponCliente;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ClienteRepo extends JpaRepository<Cliente, String> {

    @Query("select c from Cliente c where c.email = ?1")
    Cliente obtener(String email);

    Optional<Cliente> findByEmail(String email);

    @Query("select c from Cliente c where c.email = :email and c.contrasena = :contrasena")
    Cliente comprobarAutenticacion(String email, String contrasena);


    Cliente findByEmailAndContrasena(String email, String contrasena);

    @Query("select c " +
            "from Cliente c " +
            "where c.estado = :estado")
    List<Cliente> obtenerPorEstado(int estado, PageRequest paginador);

    @Query("select comp from Cliente cli, in(cli.compras) comp where cli.email = :email")
    List<Compra> obtenerCompras(String email);

    @Query("select c from Compra c where c.cliente.email = :email")
    List<Compra> obtenerComprasOpcion2(String email);

    @Query("select comp from Cliente cli join cli.compras comp where cli.email = :email")
    List<Compra> obtenerComprasOpcion3(String email);

    @Query("select cup from Cliente cli join cli.listaCuponClientes cup where cli.email = :email")
    List<CuponCliente> obtenerCupones(String email);

    @Query("select c from Cliente c where c.email = :email")
    Cliente obtenerCliente(String email);


}
