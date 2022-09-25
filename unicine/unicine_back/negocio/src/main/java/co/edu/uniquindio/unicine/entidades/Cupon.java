package co.edu.uniquindio.unicine.entidades;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@ToString
public class Cupon implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idCupon;

    private Double valorDescuento;

    private LocalDate fechaVencimiento;

    private String descripcion;

    private String criterio;

    @OneToMany(mappedBy = "cupon")
    private List<CuponCliente> listaCuponClientes;

}
