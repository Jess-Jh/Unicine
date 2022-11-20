package co.edu.uniquindio.unicine.test.entidades;

import com.fasterxml.jackson.annotation.JsonIgnore;
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

    private Boolean membresia;

    private Boolean estado;

    @ElementCollection
    private List<String> telefonos;

    @JsonIgnore
    @ToString.Exclude
    @OneToMany(mappedBy = "cliente")
    private List<PQRS> pqrs;

    @ManyToOne
    private Ciudad ciudad;

    @ToString.Exclude
    @JsonIgnore
    @OneToMany(mappedBy = "cliente")
    private List<Compra> compras;

    @ToString.Exclude
    @JsonIgnore
    @OneToMany(mappedBy = "cliente")
    private List<CuponCliente> listaCuponClientes;


    public Cliente(String cedula, String nombreCompleto, String email, String contrasena, Rol rol, List<String> telefonos, String imagenPerfil) {
        super(cedula, nombreCompleto, email, contrasena, rol);
        this.telefonos = telefonos;
        this.id = 1;
        this.label = "Cliente";
        this.imagenPerfil = imagenPerfil;
        this.membresia = false;
        this.estado = false;
        this.rol = rol;
    }
}
