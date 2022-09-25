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
public class Ciudad implements Serializable {

    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idCiudad;

    private String nombre;

    @OneToMany(mappedBy = "ciudad")
    private List<Cliente> clientes;

    @ManyToOne
    private Administrador administrador;

    @OneToMany(mappedBy = "ciudad")
    private List<Teatro> listaTeatros;

}
