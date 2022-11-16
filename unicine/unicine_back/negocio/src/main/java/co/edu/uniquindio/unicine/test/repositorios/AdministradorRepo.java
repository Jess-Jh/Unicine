package co.edu.uniquindio.unicine.test.repositorios;

import co.edu.uniquindio.unicine.test.entidades.Administrador;
import co.edu.uniquindio.unicine.test.entidades.Cliente;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface AdministradorRepo  extends JpaRepository<Administrador, String> {


    @Query("select a from Administrador a where a.email = :email and a.contrasena = :contrasena")
    Administrador comprobarAutenticacionAdmin(String email, String contrasena);

    Optional<Administrador> findByEmail(String email);

    @Query("select at from Administrador at join at.rol r where r.codigo = :codigo")
    List<Administrador> listarAdministradoresTeatro(Integer codigo);


}
