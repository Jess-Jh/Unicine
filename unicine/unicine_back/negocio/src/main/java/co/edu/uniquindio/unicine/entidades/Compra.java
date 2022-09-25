package co.edu.uniquindio.unicine.entidades;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;
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

    @Column(nullable = false)
    private LocalDateTime fechaCompra;

    @Column(length = 45, nullable = false)
    private String metodoPago;

    @Column(nullable = false)
    private Double subtotal;

    @Column(nullable = false)
    private Double total;

    @ManyToOne
    private Cliente cliente;

    @ManyToOne
    private FuncionSala funcionSala;

    @OneToMany(mappedBy = "compra")
    private List<Entrada> listaEntradas;

    @OneToMany(mappedBy = "compra")
    private List<ConfiteriaCompra> listaConfiteriaCompra;
    @Builder
    public Compra(String metodoPago, Cliente cliente, FuncionSala funcionSala, List<Entrada> listaEntradas,
                  List<ConfiteriaCompra> listaConfiteriaCompra) {
        this.fechaCompra = LocalDateTime.now();
        this.metodoPago = metodoPago;
        this.cliente = cliente;
        this.funcionSala = funcionSala;
        this.listaEntradas = listaEntradas;
        this.listaConfiteriaCompra = listaConfiteriaCompra;
    }
}
