package co.edu.uniquindio.unicine.entidades;

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

    @ManyToOne
    private Compra compra;

    @ManyToOne
    private Confiteria confiteria;

    @Builder
    public ConfiteriaCompra(Double precio, Compra compra, Confiteria confiteria) {
        this.precio = precio;
        this.compra = compra;
        this.confiteria = confiteria;
    }
}
