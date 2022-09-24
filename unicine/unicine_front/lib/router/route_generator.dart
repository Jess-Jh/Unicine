// import 'package:flutter/cupertino.dart';

// // Para saber si esta e la web y hacer las transiciones animadas
// import 'package:flutter/foundation.dart' show kIsWeb;

// import 'package:uni_cine/ui/views/counter_meedu_view.dart';
// import 'package:uni_cine/ui/views/counter_view.dart';
// import '../ui/views/view_404.dart';

// class RouteGenerator {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case '/stateful':
//         return _fadeRoute(const CounterView(base: '5'), '/stateful');

//       case '/meedu':
//         return _fadeRoute(CounterMeeduView(base: '15'), '/meedu');

//       default:
//         return _fadeRoute(const View404(), '/404');
//     }
//   }

//   static PageRoute _fadeRoute(Widget child, String routeName) {
//     return PageRouteBuilder(
//         settings: RouteSettings(name: routeName),
//         pageBuilder: (_, __, ___) => child,
//         transitionDuration: const Duration(milliseconds: 200),
//         transitionsBuilder: (_, animation, __, ___) =>
//             // Si esta en la web se anima con opacidad si es movil con una transición
//             (kIsWeb)
//                 ? FadeTransition(
//                     opacity: animation,
//                     child: child,
//                   )
//                 : CupertinoPageTransition(
//                     primaryRouteAnimation: animation,
//                     secondaryRouteAnimation: __,
//                     linearTransition: true,
//                     child: child));
//   }
// }
