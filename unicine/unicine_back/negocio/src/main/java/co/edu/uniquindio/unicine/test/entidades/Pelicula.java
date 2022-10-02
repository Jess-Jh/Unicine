package co.edu.uniquindio.unicine.test.entidades;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@ToString
public class Pelicula implements Serializable {

    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idPelicula;

    @Column(length = 100, nullable = false)
    private String nombre;

    @Column(length = 100, nullable = false)
    private String imagen;

    @Column(length = 45, nullable = false)
    private String trailer;

    @Column(length = 45, nullable = false)
    private String genero;

    @Column(nullable = false)
    private String sinopsis;

    @Column(nullable = false)
    private String reparto;

    @ToString.Exclude
    @ManyToOne
    private EstadoPelicula estadoPelicula;

    @ToString.Exclude
    @OneToMany(mappedBy = "pelicula")
    private List<FuncionSala> listaFuncionSala;

    public Pelicula(String nombre, String imagen, String trailer, String genero, String sinopsis, String reparto, EstadoPelicula estadoPelicula) {
        this.nombre = nombre;
        this.imagen = imagen;
        this.trailer = trailer;
        this.genero = genero;
        this.sinopsis = sinopsis;
        this.reparto = reparto;
        this.estadoPelicula = estadoPelicula;
    }
}
