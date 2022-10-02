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
public class TipoAdministrador implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idTipoAdministrador;

    private Integer tipoAdministrador;

    @ManyToOne
    private Administrador administrador;

    public TipoAdministrador(Integer tipoAdministrador) {
        this.tipoAdministrador = tipoAdministrador;
    }
}
