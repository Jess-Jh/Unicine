import 'package:fluro/fluro.dart';

import 'package:uni_cine/ui/views/no_page_found_view.dart';
import 'package:uni_cine/ui/layouts/administrator_layout_page.dart';

class NoPageFoundHandlers {
  static Handler noPageFound = Handler(
    handlerFunc: ((context, parameters) {
      sideMenuProvider.read.setCurrentPageUrl('/404');
      return const NoPageFoundView();
    }),
  );
}
