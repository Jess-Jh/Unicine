package co.edu.uniquindio.unicine.test.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@Getter
@Setter
@ToString
public class CarteleraDTO {

    private String nombrePelicula;
    private String reparto;
    private String sinopsis;
    private String trailer;
    private String imagen;
    private String horario;
    private String nombreSala;
}
