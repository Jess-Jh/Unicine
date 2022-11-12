import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_meedu/ui.dart';

import 'package:uni_cine/main.dart';
import 'package:uni_cine/controllers/login/auth_controller.dart';
import 'package:uni_cine/router/router.dart';
import 'package:uni_cine/ui/views/administrator/manage_coupon/manage_coupon_view.dart';

import 'package:uni_cine/ui/views/unicine/login/login_view.dart';
import 'package:uni_cine/ui/views/administrator/manage_movie/manage_movie_view.dart';
import 'package:uni_cine/ui/views/administrator/manage_theater/manage_theater_view.dart';
import 'package:uni_cine/ui/views/administrator/manage_confectionery/manage_confectionery_view.dart';

class AdministratorHandlers {
  static Handler manageTheaters        = Handler(handlerFunc: ((context, parameters) => ValidateView(const ManageTheaterView(), Flurorouter.theatersRoute)));
  static Handler manageMovies          = Handler(handlerFunc: ((context, parameters) => ValidateView(ManageMovieView(), Flurorouter.moviesRoute)));
  static Handler manageConfectionaries = Handler(handlerFunc: ((context, parameters) => ValidateView(ManageConfectioneryView(), Flurorouter.confectionariesRoute)));
  static Handler manageCoupons         = Handler(handlerFunc: ((context, parameters) => ValidateView(const ManageCouponView(), Flurorouter.couponsRoute)));
}

class ValidateView extends ConsumerWidget {
  final Widget view;
  final String routeName;
  const ValidateView(this.view, this.routeName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final ctrl = ref.watch(authProvider);
    sideMenuProvider.read.setCurrentPageUrl(routeName);

    if (ctrl.authStatus == AuthStatus.notAuthenticated) {
      return LoginView();
    } else {
      return view;
    }
  }
}
