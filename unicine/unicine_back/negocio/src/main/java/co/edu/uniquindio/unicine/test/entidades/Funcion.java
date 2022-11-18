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
public class Funcion implements Serializable {

    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idFuncion;

    @Column(nullable = false)
    private Double precio;


    @ManyToOne
    private Horario horario;

    @JsonIgnore
    @ToString.Exclude
    @OneToMany(mappedBy = "funcion")
    private List<FuncionSala> listaFuncionSala;


    public Funcion(Horario horario, Double precio) {
        this.horario = horario;
        this.precio = precio;
    }
}
