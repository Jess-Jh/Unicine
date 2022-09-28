import 'package:fluro/fluro.dart';
import 'package:uni_cine/router/administrator_handlers.dart';
import 'package:uni_cine/router/administrator_theater_handlers.dart';
import 'package:uni_cine/router/unicine_handlers.dart';
import 'package:uni_cine/router/no_page_found_handlers.dart';
import 'package:uni_cine/router/route_handlers.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute     = '/';

  // Auth Router
  static String loginRoute    = '/auth/login';
  static String registerRoute = '/auth/register';
  
  static String administratorRoute    = '/administradorTeatro';
  // Administrator 
  static String moviesRoute           = '/administrador/peliculas';
  static String theatersRoute         = '/administrador/teatros';
  static String confectionariesRoute  = '/administrador/confiterias';
  static String couponsRoute          = '/administrador/cupones';

  // Administrator Theater
  static String administratorTheaterRoute = '/administradorTeatro';
  static String roomRoute                 = '/administradorTeatro/salas';
  static String hourRoute                 = '/administradorTeatro/horarios';
  static String functionRoute             = '/administradorTeatro/funciones';

  // User 
  static String unicineRoute     = '/unicine';
  static String billboardRoute   = '/unicine/cartelera';



  static void configureRoutes() {

    // Auth Routes
    router.define( rootRoute,     handler: UnicineHandlers.login,    transitionDuration: const Duration(milliseconds: 300), transitionType: TransitionType.fadeIn);
    router.define( loginRoute,    handler: UnicineHandlers.login,    transitionDuration: const Duration(milliseconds: 300), transitionType: TransitionType.fadeIn);
    router.define( registerRoute, handler: UnicineHandlers.register, transitionDuration: const Duration(milliseconds: 300), transitionType: TransitionType.fadeIn);

    // User Routes
    router.define( billboardRoute, handler: UnicineHandlers.billboard, transitionDuration: const Duration(milliseconds: 300), transitionType: TransitionType.fadeIn);


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


    // Stateful Routes
    // router.define('/',  handler: counterHandler, transitionDuration: const Duration(milliseconds: 300), transitionType: TransitionType.fadeIn);
    router.define('/stateful', handler: counterHandler, transitionDuration: const Duration(milliseconds: 300), transitionType: TransitionType.fadeIn);

    // Meedu Routes
    router.define('/stateful/:base', handler: counterHandler, transitionDuration: const Duration(milliseconds: 300), transitionType: TransitionType.fadeIn);
    router.define('/meedu', handler: counterMeeduHandler, transitionDuration: const Duration(milliseconds: 300), transitionType: TransitionType.fadeIn);

    // 404 - Not Page Found
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
