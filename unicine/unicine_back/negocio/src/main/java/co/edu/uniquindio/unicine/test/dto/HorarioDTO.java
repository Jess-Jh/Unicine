package co.edu.uniquindio.unicine.test.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import java.time.LocalDate;
import java.time.LocalTime;

@AllArgsConstructor
@Getter
@Setter
@ToString
public class HorarioDTO {

    private LocalDate fecha;
    private LocalTime hora;

}
