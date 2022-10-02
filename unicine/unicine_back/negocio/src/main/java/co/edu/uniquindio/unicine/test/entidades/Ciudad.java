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

    @ToString.Exclude
    @OneToMany(mappedBy = "ciudad")
    private List<Cliente> clientes;

    //editado
    @ToString.Exclude
    @OneToMany(mappedBy = "ciudad")
    private List<Administrador> administradores;
    //aqui

    @ToString.Exclude
    @OneToMany(mappedBy = "ciudad")
    private List<Teatro> listaTeatros;

    public Ciudad(String nombre) {
        this.nombre = nombre;
    }
}
