package co.edu.uniquindio.unicine.test.dto;

import co.edu.uniquindio.unicine.test.entidades.EstadoPelicula;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@Getter
@Setter
@ToString
public class PeliculaDTO {

    private String nombre;
    private String genero;
    private EstadoPelicula estado;
    private String imagen;

}
