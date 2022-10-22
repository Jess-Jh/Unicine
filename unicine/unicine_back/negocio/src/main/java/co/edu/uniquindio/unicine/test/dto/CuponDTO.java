package co.edu.uniquindio.unicine.test.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@Getter
@Setter
@ToString
public class CuponDTO {

    private Double valorDescuento;
    private String descripcion;

}
