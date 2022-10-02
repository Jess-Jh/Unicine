package co.edu.uniquindio.unicine.test.entidades;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
@ToString(callSuper = true)
public class Administrador extends Persona implements Serializable {

    @ToString.Exclude
    @OneToMany(mappedBy = "administrador")
    private List<TipoAdministrador> tipoAdministradores;

    //editado
    @ToString.Exclude
    @ManyToOne
    private Ciudad ciudad;
    //aqui


    public Administrador(String cedula, String nombreCompleto, String email, String contrasena, Ciudad ciudad) {
        super(cedula, nombreCompleto, email, contrasena);
        this.ciudad = ciudad;
    }
}
