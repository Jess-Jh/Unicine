package co.edu.uniquindio.unicine.entidades;

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
public class Entrada implements Serializable {

    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idEntrada;

    @Column(length = 45, nullable = false)
    private String filaSilla;

    @Column(length = 45, nullable = false)
    private String columnaSilla;

    @ManyToOne
    private Compra compra;

    @Builder
    public Entrada(String filaSilla, String columnaSilla, Compra compra) {
        this.filaSilla = filaSilla;
        this.columnaSilla = columnaSilla;
        this.compra = compra;
    }
}
