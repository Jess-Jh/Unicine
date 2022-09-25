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
public class Confiteria implements Serializable {

    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idConfiteria;

    private String imagen;

    private Double precio;

    private String nombre;

    @OneToMany(mappedBy = "confiteria")
    private List<ConfiteriaCompra> listaConfiteriaCompra;
}
