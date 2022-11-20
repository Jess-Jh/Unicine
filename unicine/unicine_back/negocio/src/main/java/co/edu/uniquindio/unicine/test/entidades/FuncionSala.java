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

    @JsonIgnore
    @ToString.Exclude
    @OneToMany(mappedBy = "funcionSala")
    private List<Compra> listaCompras;

    public FuncionSala(Sala sala, Pelicula pelicula, Funcion funcion) {
        this.sala = sala;
        this.pelicula = pelicula;
        this.funcion = funcion;
    }
}
