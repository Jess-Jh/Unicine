package co.edu.uniquindio.unicine.test.dto;

import co.edu.uniquindio.unicine.test.entidades.FuncionSala;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDateTime;

@Getter
@Setter
@AllArgsConstructor
@ToString
public class InformacionCompraDTO {

    private Double total;
    private LocalDateTime fecha;
    private FuncionSala funcionSala;
    private Integer precioConfiteria;

}
