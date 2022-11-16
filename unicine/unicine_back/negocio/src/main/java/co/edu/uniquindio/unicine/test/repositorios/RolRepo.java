package co.edu.uniquindio.unicine.test.repositorios;

import co.edu.uniquindio.unicine.test.entidades.Rol;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface RolRepo extends JpaRepository<Rol, Integer> {

    @Query("select r from Rol r where r.codigo = :codigo")
    Rol obtenerRolAdminTeatro(Integer codigo);
}
