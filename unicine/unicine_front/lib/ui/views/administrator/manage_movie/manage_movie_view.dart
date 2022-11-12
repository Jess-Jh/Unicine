import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:uni_cine/ui/layouts/administrator_layout_page.dart';

import 'package:uni_cine/ui/views/administrator/manage_movie/form_movies.dart';
import 'package:uni_cine/ui/views/administrator/manage_movie/table_movies.dart';
import 'package:uni_cine/ui/views/custom_card_view.dart';

class ManageMovieView extends ConsumerWidget {
  ManageMovieView({super.key}) {
    movieProvider.read.getMovies();
  }

  @override
  Widget build(BuildContext context, ref) {
    final ctrl = ref.watch(movieProvider);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: CustomCardView(
        isEdit: ctrl.isEdit,
        title: 'Detalle Película',
        formView: const FormMovies(),
        tableView: const TableMovies(),
      ),
    );
  }
}
