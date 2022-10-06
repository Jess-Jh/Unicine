package co.edu.uniquindio.unicine.test.entidades;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
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

    @ToString.Exclude
    @ManyToOne
    private Cliente cliente;

    @ToString.Exclude
    @ManyToOne
    private FuncionSala funcionSala;

    @ToString.Exclude
    @OneToMany(mappedBy = "compra")
    private List<Entrada> listaEntradas;

    @ToString.Exclude
    @OneToMany(mappedBy = "compra")
    private List<ConfiteriaCompra> listaConfiteriaCompra;


    public Compra(String metodoPago, Double subtotal, Double total, Cliente cliente, FuncionSala funcionSala) {
        this.fechaCompra = LocalDateTime.now();;
        this.metodoPago = metodoPago;
        this.subtotal = subtotal;
        this.total = total;
        this.cliente = cliente;
        this.funcionSala = funcionSala;
    }
}