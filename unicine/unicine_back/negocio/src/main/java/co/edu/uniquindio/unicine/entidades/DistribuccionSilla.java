package co.edu.uniquindio.unicine.entidades;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Getter
@Setter
@NoArgsConstructor
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@ToString
public class DistribuccionSilla implements Serializable {

    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idDistribuccionSilla;

    @Column(length = 45, nullable = false)
    private String distribuccionSillas;

    private Integer totalSillas;

    private Integer filas;

    private Integer columnas;

    @ManyToOne
    private Sala sala;

    @Builder
    public DistribuccionSilla(String distribuccionSillas, Integer totalSillas, Integer filas, Integer columnas, Sala sala) {
        this.distribuccionSillas = distribuccionSillas;
        this.totalSillas = totalSillas;
        this.filas = filas;
        this.columnas = columnas;
        this.sala = sala;
    }
}
