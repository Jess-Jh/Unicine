package co.edu.uniquindio.unicine.test.repositorios;

import co.edu.uniquindio.unicine.test.entidades.Compra;
import co.edu.uniquindio.unicine.test.entidades.Entrada;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CompraRepo extends JpaRepository<Compra, Integer> {

    @Query("select e from Compra c join c.listaEntradas e where c.idCompra = :idCompra")
    List<Entrada> obtenerEntradas(Integer idCompra);

    @Query("select cli.nombreCompleto, comp from Cliente cli left join cli.compras comp")
    List<Object[]> obtenerComprasTodos();

}
