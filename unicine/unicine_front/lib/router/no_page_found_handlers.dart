import 'package:fluro/fluro.dart';
import 'package:uni_cine/main.dart';

import 'package:uni_cine/ui/views/no_page_found_view.dart';

class NoPageFoundHandlers {
  static Handler noPageFound = Handler(
    handlerFunc: ((context, parameters) {
      sideMenuProvider.read.setCurrentPageUrl('/404');
      return const NoPageFoundView();
    }),
  );
}
