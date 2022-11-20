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
public class Ciudad implements Serializable {

    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idCiudad;

    @Column(length = 45, nullable = false)
    private String nombre;

    @ToString.Exclude
    @OneToMany(mappedBy = "ciudad")
    @JsonIgnore
    private List<Cliente> clientes;

    //editado
    @ToString.Exclude
    @JsonIgnore
    @OneToMany(mappedBy = "ciudad")
    private List<Administrador> administradores;
    //aqui

    @ToString.Exclude
    @JsonIgnore
    @OneToMany(mappedBy = "ciudad")
    private List<Teatro> listaTeatros;

    public Ciudad(String nombre) {
        this.nombre = nombre;
    }
}
