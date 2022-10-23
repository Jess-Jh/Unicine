package co.edu.uniquindio.unicine.test.servicios;

import co.edu.uniquindio.unicine.test.entidades.Cliente;
import co.edu.uniquindio.unicine.test.entidades.Compra;
import co.edu.uniquindio.unicine.test.repositorios.ClienteRepo;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class ClienteServicioImpl implements ClienteServicio{

    private ClienteRepo clienteRepo;

    public ClienteServicioImpl(ClienteRepo clienteRepo) {
        this.clienteRepo = clienteRepo;
    }

    @Override
    public Cliente obtenerCliente(String cedula) throws Exception {
        Optional<Cliente> guardado = clienteRepo.findById(cedula);

        if (guardado.isEmpty()){
            throw new Exception("el cliente no existe");
        }

        return guardado.get();
    }

    @Override
    public Cliente login(String email, String contrasena) throws Exception {
        Cliente cliente = clienteRepo.comprobarAutenticacion(email, contrasena);
        if(cliente == null){
            throw new Exception("Los datos de autenticacion son incorrectos");
        }
        return  cliente;
    }

    @Override
    public Cliente registrarCliente(Cliente cliente) throws Exception {
        boolean correoExiste = esRepetido(cliente.getEmail());

        if (correoExiste){
            throw new Exception("El correo ya se encuentra registrado");
        }
        return clienteRepo.save(cliente);
    }

    private boolean esRepetido(String email){
        //si da un valor diferente de null significa que esta repetido
        //pero si devuelve un null no esta repetido
        return clienteRepo.findByEmail(email).orElse(null) != null;
    }

    @Override
    public Cliente actualizarCliente(Cliente cliente) throws Exception {
        Optional<Cliente> guardado = clienteRepo.findById(cliente.getCedula());

        if (guardado.isEmpty()){
            throw new Exception("el cliente no existe");
        }

        return clienteRepo.save(cliente);
    }

    @Override
    public void eliminarCliente(String cedula) throws Exception {
        Optional<Cliente> guardado = clienteRepo.findById(cedula);

        if (guardado.isEmpty()){
            throw new Exception("el cliente no existe");
        }

        clienteRepo.delete(guardado.get());
    }

    @Override
    public List<Cliente> listarClientes() {
        return clienteRepo.findAll();
    }

    @Override
    public List<Cliente> listarHistorialCompra(String cedula) {
        return null;
    }

    @Override
    public Compra registrarCompra(Compra compra) {
        return null;
    }
}
