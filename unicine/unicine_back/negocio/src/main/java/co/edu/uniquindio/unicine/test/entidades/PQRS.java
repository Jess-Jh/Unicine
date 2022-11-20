package co.edu.uniquindio.unicine.test.entidades;

import com.fasterxml.jackson.annotation.JsonIgnore;
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

    @ToString.Exclude
    @ManyToOne
    private Cliente cliente;

    public PQRS(String mensaje, Cliente cliente) {
        this.mensaje = mensaje;
        this.cliente = cliente;
    }
}
