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
public class Funcion implements Serializable {

    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idFuncion;

    @Column(length = 45, nullable = false)
    private String horario;

    @Column(nullable = false)
    private Double precio;

    @OneToMany(mappedBy = "funcion")
    private List<FuncionSala> listaFuncionSala;


    @Builder
    public Funcion(String horario, Double precio) {
        this.horario = horario;
        this.precio = precio;
    }
}
