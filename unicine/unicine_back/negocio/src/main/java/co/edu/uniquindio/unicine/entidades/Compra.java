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
public class Compra implements Serializable {

    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idCompra;

    private LocalDate fechaCompra;

    private String metodoPago;

    private Double subtotal;

    private Double total;

    @ManyToOne
    private Cliente cliente;

    @ManyToOne
    private FuncionSala funcionSala;

    @OneToMany(mappedBy = "compra")
    private List<Entrada> listaEntradas;

    @OneToMany(mappedBy = "compra")
    private List<ConfiteriaCompra> listaConfiteriaCompra;

}
