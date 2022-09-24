// Handlers
import 'package:fluro/fluro.dart';

import 'package:uni_cine/ui/views/counter_meedu_view.dart';
import 'package:uni_cine/ui/views/counter_view.dart';
import 'package:uni_cine/ui/views/no_page_found_view.dart';

final counterHandler = Handler(
    handlerFunc: (context, parameters) =>
        CounterView(base: parameters['base']?.first ?? '5'));

final counterMeeduHandler = Handler(handlerFunc: (context, parameters) {
  return CounterMeeduView(base: parameters['q']?.first ?? '15');
});

// 404
final pageNotFound = Handler(handlerFunc: (_, __) => const NoPageFoundView());
