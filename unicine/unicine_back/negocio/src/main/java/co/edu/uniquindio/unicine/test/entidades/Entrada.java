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
public class Entrada implements Serializable {

    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idEntrada;

    @Column(length = 45, nullable = false)
    private String filaSilla;

    @Column(length = 45, nullable = false)
    private String columnaSilla;

    @Column(nullable = false)
    private Double precio;

    @ManyToOne
    private Compra compra;

    public Entrada(String filaSilla, String columnaSilla, Compra compra) {
        this.filaSilla = filaSilla;
        this.columnaSilla = columnaSilla;
        this.compra = compra;
    }
}
