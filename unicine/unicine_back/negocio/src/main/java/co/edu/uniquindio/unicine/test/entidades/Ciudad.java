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
public class Ciudad implements Serializable {

    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idCiudad;

    @Column(length = 45, nullable = false)
    private String nombre;

    @OneToMany(mappedBy = "ciudad")
    private List<Cliente> clientes;

    //editado
    @OneToMany(mappedBy = "ciudad")
    private List<Administrador> administradores;
    //aqui

    @OneToMany(mappedBy = "ciudad")
    private List<Teatro> listaTeatros;


}
