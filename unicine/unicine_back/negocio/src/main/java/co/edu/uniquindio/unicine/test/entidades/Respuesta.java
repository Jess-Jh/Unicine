package co.edu.uniquindio.unicine.test.entidades;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.util.Optional;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Respuesta implements Serializable {
    private String jwttoken;
    private String email;
    private String rol;


    public Respuesta(String email, String jwttoken, String rol) {
        this.email = email;
        this.jwttoken = jwttoken;
        this.rol = rol;
    }
}
