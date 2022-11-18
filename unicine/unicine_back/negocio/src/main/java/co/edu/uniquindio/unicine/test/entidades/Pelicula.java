package co.edu.uniquindio.unicine.test.entidades;

import com.fasterxml.jackson.annotation.JsonIgnore;
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

    @Column(length = 255, nullable = false)
    private String nombre;

    @Column(length = 255, nullable = false)
    private String imagen;

    @Column(length = 255, nullable = false)
    private String trailer;

    @Column(length = 45, nullable = false)
    private String genero;

    @Column(length = 255, nullable = false)
    private String sinopsis;

    @Column(nullable = false)
    private String reparto;

    /*@ManyToOne
 private EstadoPelicula estadoPelicula;*/

    @Column(nullable=false)
    @Enumerated(EnumType.STRING)
    private EstadoPelicula estadoPelicula;

    @JsonIgnore
    @ToString.Exclude
    @OneToMany(mappedBy = "pelicula")
    private List<FuncionSala> listaFuncionSala;

    public Pelicula(String nombre, EstadoPelicula estadoPelicula, String imagen, String trailer, String genero, String sinopsis, String reparto) {
        this.nombre = nombre;
        this.estadoPelicula = estadoPelicula;
        this.imagen = imagen;
        this.trailer = trailer;
        this.genero = genero;
        this.sinopsis = sinopsis;
        this.reparto = reparto;

    }
}
