package co.edu.uniquindio.unicine.test.entidades;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Getter
@Setter
@NoArgsConstructor
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@ToString
public class PQRS implements Serializable {

    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idPQRS;

    @Column(nullable = false)
    private String mensaje;

    @ManyToOne
    private Cliente cliente;

    @Builder
    public PQRS(String mensaje, Cliente cliente) {
        this.mensaje = mensaje;
        this.cliente = cliente;
    }
}
