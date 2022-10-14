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

    @Query("select sum(c.total) from Compra c where c.cliente.cedula = :cedulaCliente")
    Double calcularTotalGastadoCliente(String cedulaCliente);

    @Query("select c.cliente, c from Compra c order by c.total desc")
    List<Object[]> obtenerCompraMasCostosa();

    @Query("select c1.cliente, c1 from Compra c1 where c1.total = (select max(c.total) from Compra)")
    List<Object[]> obtenerCompraMasCostosa2();

    @Query("select new co.edu.uniquindio.unicine.test.dto.InformacionCompraDTO(c.total, c.fechaCompra, c.funcionSala, (select sum(cc.precio) from ConfiteriaCompra cc where cc.compra.idCompra = c.idCompra) )from Compra c where c.cliente.cedula = :cedulaCliente")
    List<Object[]> obtenerInformacionCompras(String cedulaCliente);

}
