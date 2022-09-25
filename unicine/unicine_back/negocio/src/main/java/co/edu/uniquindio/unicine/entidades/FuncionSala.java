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
public class FuncionSala implements Serializable {

    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idFuncionSala;

    @ManyToOne
    private Sala sala;

    @ManyToOne
    private Pelicula pelicula;

    @ManyToOne
    private Funcion funcion;

    @OneToMany(mappedBy = "funcionSala")
    private List<Compra> listaCompras;

    @Builder
    public FuncionSala(Sala sala, Pelicula pelicula, Funcion funcion) {
        this.sala = sala;
        this.pelicula = pelicula;
        this.funcion = funcion;
    }
}
