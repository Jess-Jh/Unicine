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
public class Teatro implements Serializable {

    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idTeatro;

    private String nombre;

    private String direccion;

    @ManyToOne
    private Ciudad ciudad;

    @OneToMany(mappedBy = "teatro")
    private List<Sala> listaSalas;

}
