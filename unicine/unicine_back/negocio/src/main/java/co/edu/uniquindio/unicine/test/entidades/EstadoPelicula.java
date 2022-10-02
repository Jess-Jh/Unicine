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
public class EstadoPelicula implements Serializable {

    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idEstadoPelicula;

    private Integer tipoEstado;

    @ToString.Exclude
    @OneToMany(mappedBy = "estadoPelicula")
    private List<Pelicula> listaPeliculas;

    public EstadoPelicula(Integer tipoEstado) {
        this.tipoEstado = tipoEstado;
    }
}
