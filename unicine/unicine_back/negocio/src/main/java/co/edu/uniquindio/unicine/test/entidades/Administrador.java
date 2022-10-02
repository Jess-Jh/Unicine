package co.edu.uniquindio.unicine.test.entidades;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
@ToString
public class Administrador extends Persona implements Serializable {

    @OneToMany(mappedBy = "administrador")
    private List<TipoAdministrador> tipoAdministradores;

    //editado
    @ManyToOne
    private Ciudad ciudad;
    //aqui

}
