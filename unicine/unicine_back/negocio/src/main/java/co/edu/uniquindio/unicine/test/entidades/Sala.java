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

    @JsonIgnore
    @ToString.Exclude
    @OneToMany(mappedBy = "sala")
    private List<FuncionSala> listaFuncionSala;

    /**
    @ToString.Exclude
    @OneToMany(mappedBy = "sala")
    private List<DistribucionSilla> listaDistribuccionSillas;
**/
    @ManyToOne
    private DistribucionSilla distribucionSilla;

    @Builder
    public Sala(String nombre, Teatro teatro, DistribucionSilla distribucionSilla) {
        this.nombre = nombre;
        this.teatro = teatro;
        this.distribucionSilla = distribucionSilla;
    }
}
