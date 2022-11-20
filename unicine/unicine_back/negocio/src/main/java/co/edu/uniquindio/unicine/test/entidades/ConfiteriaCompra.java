package co.edu.uniquindio.unicine.test.entidades;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Getter
@Setter
@NoArgsConstructor
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@ToString
public class ConfiteriaCompra implements Serializable {

    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idConfiteriaCompra;

    @Column(nullable = false)
    private Double precio;

    @Column(nullable = false)
    private Integer unidades;

    @ManyToOne
    private Compra compra;

    @ManyToOne
    private Confiteria confiteria;

    public ConfiteriaCompra(Double precio, Compra compra, Confiteria confiteria, Integer unidades) {
        this.precio = precio;
        this.compra = compra;
        this.confiteria = confiteria;
        this.unidades = unidades;
    }
}
