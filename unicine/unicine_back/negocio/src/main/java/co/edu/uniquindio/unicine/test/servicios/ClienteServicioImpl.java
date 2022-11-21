package co.edu.uniquindio.unicine.test.servicios;

import co.edu.uniquindio.unicine.test.dto.SillasOcupadasDTO;
import co.edu.uniquindio.unicine.test.entidades.*;
import co.edu.uniquindio.unicine.test.repositorios.*;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Service
public class ClienteServicioImpl implements ClienteServicio{

    private final ClienteRepo clienteRepo;
    private final EmailServicio emailServicio;
    private final PeliculaRepo peliculaRepo;
    private final CompraRepo compraRepo;
    private final CuponClienteRepo cuponClienteRepo;
    private final AdministradorRepo administradorRepo;
    private final PQRSRepo pqrsRepo;

    private final CiudadRepo ciudadRepo;

    public ClienteServicioImpl(ClienteRepo clienteRepo, EmailServicio emailServicio, PeliculaRepo peliculaRepo,
                               CompraRepo compraRepo, CuponClienteRepo cuponClienteRepo, AdministradorRepo administradorRepo,
                               PQRSRepo pqrsRepo, CiudadRepo ciudadRepo) {
        this.clienteRepo = clienteRepo;
        this.emailServicio = emailServicio;
        this.peliculaRepo = peliculaRepo;
        this.compraRepo = compraRepo;
        this.cuponClienteRepo = cuponClienteRepo;
        this.administradorRepo = administradorRepo;
        this.pqrsRepo = pqrsRepo;
        this.ciudadRepo = ciudadRepo;
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
    public Cliente obtenerClienteEmail(String email) throws Exception {
        Optional<Cliente> guardado = clienteRepo.findByEmail(email);

        if (guardado.isEmpty()){
            throw new Exception("El cliente no existe");
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
    public Object login2(String email, String contrasena) throws Exception {
        Cliente cliente = clienteRepo.comprobarAutenticacion(email, contrasena);
        if(cliente != null){
            return cliente;
        } else {
           Administrador administrador = administradorRepo.comprobarAutenticacionAdmin(email, contrasena);
           if (administrador != null){
               return administrador;
           } else {
               throw new Exception("No existe ningun usuario con el email y contrasena");
           }
        }
    }

    @Override
    public Cliente findByEmail(String email) throws Exception {
        Optional<Cliente> guardado = clienteRepo.findByEmail(email);

        if (guardado.isEmpty()){
            throw new Exception("El cliente no existe");
        }
        return guardado.get();
    }

    @Override
    public Cliente registrarCliente(Cliente cliente) throws Exception {
        boolean correoExiste = esRepetido(cliente.getEmail());

        if (correoExiste){
            throw new Exception("El correo ya se encuentra registrado");
        }
        emailServicio.enviarEmail("Registro en unicine", "Hola debe ir al siguiente enlace para activar la cuenta  http://localhost:57851/#/unicine/usuario/activar-cuenta", cliente.getEmail());

        return clienteRepo.save(cliente);
    }

    public boolean esRepetido(String email){
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
    public boolean eliminarCliente(String cedula) throws Exception {
        Optional<Cliente> guardado = clienteRepo.findById(cedula);

        if (guardado.isEmpty()){
            throw new Exception("el cliente no existe");
        } else {
            if (guardado.get().getCompras().size() <= 0){
                if (guardado.get().getPqrs().size() <= 0){
                    clienteRepo.delete(guardado.get());
                    return true;
                }else{
                    throw new Exception("No se puede eliminar cliente ya que tiene relacionado pqrs");
                }
            }else {
                throw new Exception("No se puede eliminar ya que el cliente tiene relacionado compras");
            }

        }
    }

    @Override
    public List<Cliente> listarClientes() {
        return clienteRepo.findAll();
    }

    @Override
    public List<Compra> listarHistorialCompra(String email) {

        List<Compra> historial = clienteRepo.obtenerCompras(email);

        return historial;
    }

    @Override
    public Compra registrarCompra(Compra compra) throws Exception {

        String columnaO = ""; String filaO = "";
        LocalDate ahora = LocalDate.now();
        List<SillasOcupadasDTO> listaSillas = compraRepo.obtenerSillasOcupadas2(compra.getFuncionSala().getSala().getIdSala());

        for(int i=0; i < listaSillas.size(); i++){
            for(int z = 0; z < compra.getListaEntradas().size(); z++){
                columnaO = listaSillas.get(i).getColumna(); filaO = listaSillas.get(i).getFila();
                if(columnaO.equals(compra.getListaEntradas().get(z).getColumnaSilla()) &&
                        filaO.equals(compra.getListaEntradas().get(z).getFilaSilla())){
                    throw new Exception("La silla " + columnaO + " , " + filaO + " ya ha sido seleccionada");
                }
            }
        }
        if(compra.getCuponCliente().getCupon().getFechaVencimiento().compareTo(ahora) < 0 ){
            throw new Exception("El cupon se encuentra vencido");
            // se validaria si se encuentra en estado 2 que seria no disponible
        }else if (compra.getCuponCliente().getIsDisponible() == 2){
            throw new Exception("El cupon no esta disponible");
        }

        emailServicio.enviarEmail("Se ha realizado una compra " + compra.getFechaCompra(),
                "Hola ha comprado por un total " + compra.getTotal(), compra.getCliente().getEmail());

        return compraRepo.save(compra);
    }

    @Override
    public List<Pelicula> buscarPelicula(String nombre) {


        List<Pelicula> peliculas = peliculaRepo.buscarPelicula(nombre, EstadoPelicula.CARTELERA);

        return peliculas;
    }

    @Override
    public CuponCliente redimirCupon(CuponCliente cuponCliente) {
        return cuponClienteRepo.save(cuponCliente);
    }

    @Override
    public boolean cambiarContrasena(String email, String contrasena) throws Exception {
        boolean cambio = false;
        Optional<Cliente> cliente = clienteRepo.findByEmail(email);

        if (cliente.isEmpty()){
            throw new Exception("El correo no se encuentra registrado");
        } else {
            cliente.get().setContrasena(contrasena);
            clienteRepo.save(cliente.get());
            emailServicio.enviarEmail("Se cambio contraseña", "Hola se acaba de actualizar la contraseña de su cuenta", cliente.get().getEmail());
            cambio = true;
        }
        return cambio;
    }

    @Override
    public List<FuncionSala> obtenerFuncionesDisponiblesPelicula(Integer idPelicula) {
        return peliculaRepo.obtenerFuncionPorIdpelicula(idPelicula);
    }

    @Override
    public List<Pelicula> obtenerPeliculasPorCiudad(String nombreCiudad) {
        return peliculaRepo.obtenerPeliculasCiudad(nombreCiudad);
    }

    @Override
    public List<Pelicula> obtenerPeliculasPorTeatro(String nombreTeatro) {
        return peliculaRepo.obtenerPeliculasTeatro(nombreTeatro);
    }

    @Override
    public List<Pelicula> obtenerPeliculaPreventa(Integer idCiudad) {
        return peliculaRepo.obtenerPeliculaPreventaCiudad(idCiudad, EstadoPelicula.PREVENTA);
    }

    @Override
    public List<Pelicula> obtenerPeliculaCartelera(Integer idCiudad) {
        return peliculaRepo.obtenerPeliculaCarteleraCiudad(idCiudad, EstadoPelicula.CARTELERA);
    }

    @Override
    public PQRS registrarPQRS(PQRS pqrs) {
        return pqrsRepo.save(pqrs);
    }

    @Override
    public List<PQRS> listarPQRS() {
        return pqrsRepo.findAll();
    }

    @Override
    public List<PQRS> obtenerPQRSEmailCliente(String email) {
        return pqrsRepo.obtenerPQRSCliente(email);
    }

    @Override
    public boolean obtenerMembresiaCliente(String email, String contrasena) throws Exception {
        Cliente cliente = clienteRepo.comprobarAutenticacion(email, contrasena);
        if (cliente == null){
            return false;
        }else {
            if (cliente.getMembresia().equals(true)){
                throw new Exception("El cliente ya cuenta con una membresia");
            }else {
                cliente.setMembresia(true);
                clienteRepo.save(cliente);
                return true;
            }
        }
    }

    @Override
    public boolean activarCuentaCliente(String email) throws Exception {
        Optional<Cliente> buscar = clienteRepo.findByEmail(email);
        if (buscar.isEmpty()){
            throw new Exception("No existe este correo para activar la cuenta");
        }else {
            buscar.get().setEstado(true);
            clienteRepo.save(buscar.get());
            return true;
        }
    }

    @Override
    public List<Ciudad> listarCiudades() {
        return ciudadRepo.findAll();
    }

    @Override
    public List<SillasOcupadasDTO> listaSillasOcupadasPorSala(Integer idSala) {
        return compraRepo.obtenerSillasOcupadas2(idSala);
    }
}
