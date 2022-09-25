package co.edu.uniquindio.unicine.test.entidades;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;
import java.util.Map;

@Entity
@Getter
@Setter
@NoArgsConstructor
@ToString(callSuper = true)
public class Cliente extends Persona implements Serializable {

    @Column(length = 150)
    private String imagenPerfil;

    private Integer membresia;

    private Integer activo;

    @ElementCollection
    private Map<String, String> telefonos;

    @ToString.Exclude
    @OneToMany(mappedBy = "cliente")
    private List<PQRS> pqrs;

    @ToString.Exclude
    @ManyToOne
    private Ciudad ciudad;

    @ToString.Exclude
    @OneToMany(mappedBy = "cliente")
    private List<Compra> compras;

    @ToString.Exclude
    @OneToMany(mappedBy = "cliente")
    private List<CuponCliente> listaCuponClientes;

    public Cliente(String cedula, String nombreCompleto, String email, String contrasena, Map<String, String> telefonos) {
        super(cedula, nombreCompleto, email, contrasena);
        this.telefonos = telefonos;
    }
}
