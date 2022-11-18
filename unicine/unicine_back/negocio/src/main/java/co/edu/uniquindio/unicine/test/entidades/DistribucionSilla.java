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
public class DistribucionSilla implements Serializable {

    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idDistribuccionSilla;

    @Column(length = 45, nullable = false)
    private String distribuccionSillas;

    private Integer totalSillas;

    private Integer filas;

    private Integer columnas;

    /**
    @JsonIgnore
    @ManyToOne
    private Sala sala;
**/
    @JsonIgnore
    @ToString.Exclude
    @OneToMany(mappedBy = "distribucionSilla")
    private List<Sala> listaSalas;

    @Builder
    public DistribucionSilla(String distribuccionSillas, Integer totalSillas, Integer filas, Integer columnas) {
        this.distribuccionSillas = distribuccionSillas;
        this.totalSillas = totalSillas;
        this.filas = filas;
        this.columnas = columnas;
    }
}
