package co.edu.uniquindio.unicine.test.entidades;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.Email;
import java.io.Serializable;

@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
@MappedSuperclass
@Getter
@Setter
@NoArgsConstructor
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@ToString
public class Persona implements Serializable {

    @Id
    @EqualsAndHashCode.Include
    @Column(length = 20)
    private String cedula;

    @Column(length = 45, nullable = false)
    private String nombreCompleto;

    @Email
    @Column(length = 45, nullable = false, unique = true)
    private String email;

    @ToString.Exclude
    @Column(length = 45, nullable = false)
    private String contrasena;

    //Los dos datos referencia el tipo de usuario
    // 1 - Cliente , 2 - Administrador, 3 - Administrador_Teatro
    @ToString.Exclude
    @Column(length = 1, nullable = false)
    protected Integer id;

    @ToString.Exclude
    @Column(length = 45, nullable = false)
    protected String label;

    @Builder
    public Persona(String cedula, String nombreCompleto, String email, String contrasena) {
        this.cedula = cedula;
        this.nombreCompleto = nombreCompleto;
        this.email = email;
        this.contrasena = contrasena;
    }
}
