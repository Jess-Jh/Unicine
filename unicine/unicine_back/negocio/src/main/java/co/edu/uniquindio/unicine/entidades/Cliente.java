package co.edu.uniquindio.unicine.entidades;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;
import java.util.Map;

@Entity
@Getter
@Setter
@NoArgsConstructor
@ToString
public class Cliente extends Persona implements Serializable {

    @Column(length = 150)
    private String imagenPerfil;

    private Integer membresia;

    private Integer activo;

    @ElementCollection
    private Map<String, String> telefonos;

    @OneToMany(mappedBy = "cliente")
    private List<PQRS> pqrs;

    @ManyToOne
    private Ciudad ciudad;

    @OneToMany(mappedBy = "cliente")
    private List<Compra> compras;

    @OneToMany(mappedBy = "cliente")
    private List<CuponCliente> listaCuponClientes;

}
