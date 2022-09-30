package co.edu.uniquindio.unicine.test.entidades;

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
public class Confiteria implements Serializable {

    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idConfiteria;

    @Column(length = 200, nullable = false)
    private String imagen;

    @Column(nullable = false)
    private Double precio;

    @Column(length = 45, nullable = false)
    private String nombre;

    @OneToMany(mappedBy = "confiteria")
    private List<ConfiteriaCompra> listaConfiteriaCompra;

    @Builder
    public Confiteria(Double precio, String nombre) {
        this.precio = precio;
        this.nombre = nombre;
    }
}
