package co.edu.uniquindio.unicine.test.dto;

import co.edu.uniquindio.unicine.test.entidades.Horario;
import co.edu.uniquindio.unicine.test.entidades.Sala;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@ToString
public class HorarioSalaDTO {

    private Horario horario;

    private Sala sala;
}
