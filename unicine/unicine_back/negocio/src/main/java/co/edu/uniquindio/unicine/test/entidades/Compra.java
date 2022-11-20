package co.edu.uniquindio.unicine.test.entidades;

import com.fasterxml.jackson.annotation.JsonIgnore;
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


    @ManyToOne
    private Cliente cliente;

    @ManyToOne
    private FuncionSala funcionSala;

    @ToString.Exclude
    @OneToMany(mappedBy = "compra")
    private List<Entrada> listaEntradas;

    @ToString.Exclude
    @JsonIgnore
    @OneToMany(mappedBy = "compra")
    private List<ConfiteriaCompra> listaConfiteriaCompra;

    @ManyToOne
    private CuponCliente cuponCliente;


    public Compra(String metodoPago, Double subtotal, Double total, Cliente cliente, FuncionSala funcionSala, CuponCliente cuponCliente) {
        this.fechaCompra = LocalDateTime.now();
        this.metodoPago = metodoPago;
        this.subtotal = subtotal;
        this.total = total;
        this.cliente = cliente;
        this.funcionSala = funcionSala;
        this.cuponCliente = cuponCliente;
    }
}
