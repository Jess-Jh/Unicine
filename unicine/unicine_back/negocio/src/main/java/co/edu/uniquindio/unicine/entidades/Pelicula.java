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
public class Pelicula implements Serializable {

    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idPelicula;

    private String nombre;

    private String imagen;

    private String trailer;

    private String genero;

    private String sinopsis;

    private String reparto;

    @ManyToOne
    private EstadoPelicula estadoPelicula;

    @OneToMany(mappedBy = "pelicula")
    private List<FuncionSala> listaFuncionSala;
}
