package co.edu.uniquindio.unicine.test.servicios;

import co.edu.uniquindio.unicine.test.entidades.Administrador;
import co.edu.uniquindio.unicine.test.entidades.Cliente;
import co.edu.uniquindio.unicine.test.repositorios.AdministradorRepo;
import co.edu.uniquindio.unicine.test.repositorios.ClienteRepo;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Collection;

@Transactional
@Service
public class JwtDetalleUsuarioServicio implements UserDetailsService {
    protected final Log logger = LogFactory.getLog(this.getClass());
    @Autowired
    private ClienteRepo clienteRepo;

    @Autowired
    private AdministradorRepo administradorRepo;


    @Override
    public UserDetails loadUserByUsername(String email) {
        Cliente cliente = null;
        Administrador administrador = null;

        cliente = this.clienteRepo.findByEmail(email).orElse(null);

        if(cliente == null){
            administrador = this.administradorRepo.findByEmail(email).orElse(null);
        }

        try {
            User user = asignarUser(cliente, administrador);
            return user;
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    private User asignarUser(Cliente cliente, Administrador administrador) throws Exception {
        if(cliente != null){
            Collection<SimpleGrantedAuthority> authorities = new ArrayList<>();
            authorities.add(new SimpleGrantedAuthority(cliente.getRol().getNombre()));
            return new org.springframework.security.core.userdetails.User(cliente.getEmail(), cliente.getContrasena(), authorities);
        }else if(administrador != null){
            Collection<SimpleGrantedAuthority> authorities = new ArrayList<>();
            authorities.add(new SimpleGrantedAuthority(administrador.getRol().getNombre()));
            return new org.springframework.security.core.userdetails.User(administrador.getEmail(), administrador.getContrasena(), authorities);
        }else{
            throw new Exception("El correo o contraseña es incorrecto");
        }
    }
}
