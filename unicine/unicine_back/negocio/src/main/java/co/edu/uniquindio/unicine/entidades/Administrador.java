package co.edu.uniquindio.unicine.entidades;

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
    private List<Ciudad> ciudades;

    @OneToMany(mappedBy = "administrador")
    private List<TipoAdministrador> tipoAdministradores;

}
