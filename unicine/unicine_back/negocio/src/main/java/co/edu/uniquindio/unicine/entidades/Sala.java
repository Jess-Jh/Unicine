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
public class Sala implements Serializable {

    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idSala;

    private String nombre;

    @ManyToOne
    private Teatro teatro;

    @OneToMany(mappedBy = "sala")
    private List<FuncionSala> listaFuncionSala;

    @OneToMany(mappedBy = "sala")
    private List<DistribuccionSilla> listaDistribuccionSillas;

}
