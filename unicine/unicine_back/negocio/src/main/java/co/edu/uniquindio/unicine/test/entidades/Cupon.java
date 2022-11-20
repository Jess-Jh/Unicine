package co.edu.uniquindio.unicine.test.entidades;

import com.fasterxml.jackson.annotation.JsonIgnore;
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

    @Column(nullable = false)
    private Double valorDescuento;

    @Column(nullable = false)
    private LocalDate fechaVencimiento;

    @Column(length = 100, nullable = false)
    private String descripcion;

    @Column(length = 100, nullable = false)
    private String criterio;

    @ToString.Exclude
    @JsonIgnore
    @OneToMany(mappedBy = "cupon")
    private List<CuponCliente> listaCuponClientes;

    @Builder
    public Cupon(Double valorDescuento, LocalDate fechaVencimiento, String descripcion, String criterio) {
        this.valorDescuento = valorDescuento;
        this.fechaVencimiento = fechaVencimiento;
        this.descripcion = descripcion;
        this.criterio = criterio;
    }
}
