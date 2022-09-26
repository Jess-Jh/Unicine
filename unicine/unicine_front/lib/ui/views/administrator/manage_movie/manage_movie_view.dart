import 'package:flutter/material.dart';

import 'package:uni_cine/ui/views/administrator/manage_movie/form_movies.dart';
import 'package:uni_cine/ui/views/administrator/manage_movie/table_movies.dart';
import 'package:uni_cine/ui/views/manage_view.dart';

class ManageMovieView extends StatelessWidget {
  const ManageMovieView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ManageView(
      title: 'Detalle Película',
      formView: FormMovies(),
      tableView: TableMovies(),
    );
  }
}
