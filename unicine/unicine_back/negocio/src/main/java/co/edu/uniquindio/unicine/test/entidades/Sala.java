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
public class Sala implements Serializable {

    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idSala;

    @Column(length = 45, nullable = false)
    private String nombre;

    @ToString.Exclude
    @ManyToOne
    private Teatro teatro;

    @ToString.Exclude
    @OneToMany(mappedBy = "sala")
    private List<FuncionSala> listaFuncionSala;

    @ToString.Exclude
    @OneToMany(mappedBy = "sala")
    private List<DistribuccionSilla> listaDistribuccionSillas;

    @Builder
    public Sala(String nombre, Teatro teatro) {
        this.nombre = nombre;
        this.teatro = teatro;
    }
}
