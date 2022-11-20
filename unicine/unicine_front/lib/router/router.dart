import 'package:fluro/fluro.dart';
import 'package:uni_cine/router/administrator_handlers.dart';
import 'package:uni_cine/router/administrator_theater_handlers.dart';
import 'package:uni_cine/router/unicine_handlers.dart';
import 'package:uni_cine/router/no_page_found_handlers.dart';

class Flurorouter {

  static const _domain = '/unicine';

  static final FluroRouter router = FluroRouter();

  static String rootRoute                 = '/unicine';

  // Auth Router
  static String loginRoute                = '$_domain/auth/login';
  static String registerRoute             = '$_domain/auth/register';
  
  static String administratorRoute        = '$_domain/administrador';
  // Administrator 
  static String moviesRoute               = '$_domain/administrador/peliculas';
  static String theatersRoute             = '$_domain/administrador/teatros';
  static String confectionariesRoute      = '$_domain/administrador/confiterias';
  static String couponsRoute              = '$_domain/administrador/cupones';

  // Administrator Theater
  static String administratorTheaterRoute = '$_domain/administradorTeatro';
  static String roomRoute                 = '$_domain/administradorTeatro/salas';
  static String hourRoute                 = '$_domain/administradorTeatro/horarios';
  static String functionRoute             = '$_domain/administradorTeatro/funciones';

  // User 
  static String unicineRoute              = '$_domain/usuario/';
  static String billboardRoute            = '$_domain/usuario/cartelera';
  static String roomUnicineRoute          = '$_domain/usuario/sala';
  static String confectioneryRoute        = '$_domain/usuario/confiteria';
  static String movieDescriptionRoute     = '$_domain/usuario/descripcion-pelicula';
  static String purchaseDetailRoute       = '$_domain/usuario/detalle-compra';
  static String membershipRoute           = '$_domain/usuario/membresia';
  static String pqrsRoute                 = '$_domain/usuario/pqrs';
  static String userDetailsRoute          = '$_domain/usuario/detalle-usuario';
  static String userActivateCountRoute    = '$_domain/usuario/activar-cuenta';
  static String userChangePasswordRoute   = '$_domain/usuario/cambiar-contrasena';


  static void configureRoutes() {

    // Auth Routes
    router.define( rootRoute,     handler: UnicineHandlers.login,    transitionDuration: const Duration(milliseconds: 300), transitionType: TransitionType.fadeIn);
    router.define( loginRoute,    handler: UnicineHandlers.login,    transitionDuration: const Duration(milliseconds: 300), transitionType: TransitionType.fadeIn);
    router.define( registerRoute, handler: UnicineHandlers.register, transitionDuration: const Duration(milliseconds: 300), transitionType: TransitionType.fadeIn);

    // User Routes
    router.define( billboardRoute,          handler: UnicineHandlers.billboard, transitionDuration: const Duration(milliseconds: 300), transitionType: TransitionType.fadeIn);
    router.define( roomUnicineRoute,        handler: UnicineHandlers.roomUnicine, transitionDuration: const Duration(milliseconds: 300), transitionType: TransitionType.fadeIn);
    router.define( confectioneryRoute,      handler: UnicineHandlers.confectionery, transitionDuration: const Duration(milliseconds: 300), transitionType: TransitionType.fadeIn);
    router.define( movieDescriptionRoute,   handler: UnicineHandlers.movieDescription, transitionDuration: const Duration(milliseconds: 300), transitionType: TransitionType.fadeIn);
    router.define( purchaseDetailRoute,     handler: UnicineHandlers.purchaseDetail, transitionDuration: const Duration(milliseconds: 300), transitionType: TransitionType.fadeIn);
    router.define( membershipRoute,         handler: UnicineHandlers.membership, transitionDuration: const Duration(milliseconds: 300), transitionType: TransitionType.fadeIn);
    router.define( pqrsRoute,               handler: UnicineHandlers.pqrs, transitionDuration: const Duration(milliseconds: 300), transitionType: TransitionType.fadeIn);
    router.define( userDetailsRoute,        handler: UnicineHandlers.userDetails, transitionDuration: const Duration(milliseconds: 300), transitionType: TransitionType.fadeIn);
    router.define( userActivateCountRoute,  handler: UnicineHandlers.userActivateCount, transitionDuration: const Duration(milliseconds: 300), transitionType: TransitionType.fadeIn);
    router.define( userChangePasswordRoute, handler: UnicineHandlers.userChangePassword, transitionDuration: const Duration(milliseconds: 300), transitionType: TransitionType.fadeIn);


    // Administrator Routes
    router.define(administratorRoute,   handler: AdministratorHandlers.manageMovies,  transitionDuration: const Duration(milliseconds: 300), transitionType: TransitionType.fadeIn);
    router.define(moviesRoute,          handler: AdministratorHandlers.manageMovies,  transitionDuration: const Duration(milliseconds: 300), transitionType: TransitionType.fadeIn);
    router.define(theatersRoute,        handler: AdministratorHandlers.manageTheaters, transitionDuration: const Duration(milliseconds: 300), transitionType: TransitionType.fadeIn);
    router.define(confectionariesRoute, handler: AdministratorHandlers.manageConfectionaries, transitionDuration: const Duration(milliseconds: 300), transitionType: TransitionType.fadeIn);
    router.define(couponsRoute,         handler: AdministratorHandlers.manageCoupons, transitionDuration: const Duration(milliseconds: 300), transitionType: TransitionType.fadeIn);

    // Administrator Theater Routes
    router.define(administratorTheaterRoute, handler: AdministratorTheaterHandlers.manageRooms,  transitionDuration: const Duration(milliseconds: 300), transitionType: TransitionType.fadeIn);
    router.define(roomRoute,                 handler: AdministratorTheaterHandlers.manageRooms,   transitionDuration: const Duration(milliseconds: 300), transitionType: TransitionType.fadeIn);
    router.define(hourRoute,                 handler: AdministratorTheaterHandlers.manageHours,   transitionDuration: const Duration(milliseconds: 300), transitionType: TransitionType.fadeIn);
    router.define(functionRoute,             handler: AdministratorTheaterHandlers.manageFunctions,   transitionDuration: const Duration(milliseconds: 300), transitionType: TransitionType.fadeIn);

    // 404 - Not Page Found
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
