import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

import 'package:uni_cine/main.dart';
import 'package:uni_cine/controllers/login/auth_controller.dart';
import 'package:uni_cine/router/router.dart';
import 'package:uni_cine/ui/views/unicine/confectionery/confectionery_view.dart';

import 'package:uni_cine/ui/views/unicine/login/login_view.dart';
import 'package:uni_cine/ui/views/unicine/membership/membership_view.dart';
import 'package:uni_cine/ui/views/unicine/movie_description/movie_description_view.dart';
import 'package:uni_cine/ui/views/unicine/pqrs/pqrs_view.dart';
import 'package:uni_cine/ui/views/unicine/purchase_detail/purchase_detail_view.dart';
import 'package:uni_cine/ui/views/unicine/login/register_view.dart';
import 'package:uni_cine/ui/views/unicine/billboard/billboard_view.dart';
import 'package:uni_cine/ui/views/unicine/purchase_detail/purchase_details_card.dart';
import 'package:uni_cine/ui/views/unicine/room_unicine/room_unicine_view.dart';
import 'package:uni_cine/ui/views/unicine/user/activate_count.dart';
import 'package:uni_cine/ui/views/unicine/user/change_password.dart';
import 'package:uni_cine/ui/views/unicine/user/user_details_view.dart';

class UnicineHandlers {
  static Handler login               = Handler(handlerFunc: ((context, parameters) => ValidateView(view: LoginView(), view2: BillboardView(), routeName: Flurorouter.loginRoute )));
  static Handler register            = Handler(handlerFunc: ((context, parameters) => ValidateView(view: RegisterView(), view2: BillboardView(), routeName: Flurorouter.registerRoute )));
  static Handler billboard           = Handler(handlerFunc: ((context, parameters) => ValidateView(view2: BillboardView(), routeName: Flurorouter.billboardRoute )));
  static Handler roomUnicine         = Handler(handlerFunc: ((context, parameters) => ValidateView(view2: const RoomUnicineView(), routeName: Flurorouter.roomUnicineRoute )));
  static Handler confectionery       = Handler(handlerFunc: ((context, parameters) => ValidateView(view2: ConfectioneryView(), routeName: Flurorouter.confectioneryRoute )));
  static Handler movieDescription    = Handler(handlerFunc: ((context, parameters) => ValidateView(view2: const MovieDescriptionView(), routeName: Flurorouter.movieDescriptionRoute )));
  static Handler purchaseDetail      = Handler(handlerFunc: ((context, parameters) => ValidateView(view2: PurchaseDetailView(), routeName: Flurorouter.purchaseDetailRoute )));
  static Handler membership          = Handler(handlerFunc: ((context, parameters) => ValidateView(view2: const MembershipView(), routeName: Flurorouter.membershipRoute )));
  static Handler pqrs                = Handler(handlerFunc: ((context, parameters) => ValidateView(view2: const PQRSView(), routeName: Flurorouter.pqrsRoute )));
  static Handler userDetails         = Handler(handlerFunc: ((context, parameters) => ValidateView(view2: UserDetailsView(), routeName: Flurorouter.userDetailsRoute )));
  static Handler purchaseDetailsCard = Handler(handlerFunc: ((context, parameters) => ValidateView(view2: PurchaseDetailsCard(), routeName: Flurorouter.purchaseDetailsCardRoute )));
  static Handler userActivateCount   = Handler(handlerFunc: ((context, parameters) => ValidateView(view: const ActivateCount(), view2: BillboardView(), routeName: Flurorouter.userActivateCountRoute )));
  static Handler userChangePassword  = Handler(handlerFunc: ((context, parameters) => ValidateView(view: const ChangePasswordUser(), view2: BillboardView(), routeName: Flurorouter.userChangePasswordRoute )));
}

class ValidateView extends ConsumerWidget {
  final Widget? view;
  final Widget view2;
  final String routeName;
  const ValidateView({Key? key, this.view, required this.view2, required this.routeName}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {

    final ctrl = ref.watch(authProvider);
    sideMenuProvider.read.setCurrentPageUrl(routeName);

    if (ctrl.authStatus == AuthStatus.notAuthenticated) {
      return view ?? LoginView();
    } else {
      return view2;
    }
  }
}

