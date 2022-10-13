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
public class FuncionSalaDTO {

    private String nombrePelicula;
    private EstadoPelicula estadoPelicula;
    private String imagen;
    private Integer idSala;
    private String direccion;
    private String nombreCiudad;
    private String horario;


}
