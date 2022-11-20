package co.edu.uniquindio.unicine.test.entidades;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@ToString
public class CuponCliente implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idCuponCliente;

    private Integer isDisponible;

    @ManyToOne
    private Cupon cupon;

    @ManyToOne
    private Cliente cliente;

    @ToString.Exclude
    @JsonIgnore
    @OneToMany(mappedBy = "cuponCliente")
    private List<Compra> listaCompras;

    public CuponCliente(Integer isDisponible, Cupon cupon, Cliente cliente) {
        this.isDisponible = isDisponible;
        this.cupon = cupon;
        this.cliente = cliente;
    }
}
