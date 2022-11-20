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

    @ToString.Exclude
    @JsonIgnore
    @OneToMany(mappedBy = "confiteria")
    private List<ConfiteriaCompra> listaConfiteriaCompra;

    public Confiteria(String imagen, Double precio, String nombre) {
        this.imagen = imagen;
        this.precio = precio;
        this.nombre = nombre;
    }
}
