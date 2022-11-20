import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:uni_cine/ui/layouts/administrator_layout_page.dart';
import 'package:uni_cine/ui/layouts/unicine_layout_page.dart';

import 'package:uni_cine/ui/views/unicine/billboard/custom_app_bar.dart';

import 'package:uni_cine/utils/custom_labels.dart';
import 'package:uni_cine/ui/views/unicine/billboard/list_movies_scroll.dart';

// ignore: must_be_immutable
class BillboardView extends ConsumerWidget {
  // Selección de ciudades
  List<String> ciudades = [
    'Pereira',
    'Armenia',
    'Cali',
    'Medellín',
    'Villavicencio',
    'Bogotá'
  ];
  List<String> filtroBusqueda = ['Películas', 'Teatros'];

  // Filtro de películas
  String? selectCity = 'Pereira';
  String? selectFilter = 'Películas';

  BillboardView({Key? key}) : super(key: key) {
    movieProvider.read.getMovies();
    clientProvider.read.getClients();
  }

  @override
  Widget build(BuildContext context, ref) {
    final ctrl = ref.watch(movieProvider);
    int moviesCount = ctrl.movies.length;
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              selectCity: selectCity,
              ciudades: ciudades,
              size: size,
              filtroBusqueda: filtroBusqueda,
              selectFilter: selectFilter,
            ),
            const SizedBox(height: 20),
            Text('Cartelera', style: CustomLabels.h1),
            const SizedBox(height: 10),
            const ListMoviesScroll(
              placeholder: 'assets/images/placeholder_movie.jpg',
            ),
            Text('Preventa', style: CustomLabels.h2),
            const SizedBox(height: 10),
            const ListMoviesScroll(
              width: 170,
              placeholder: 'assets/images/placeholder_movie2.png',
            ),
          ],
        ),
      ),
    );
  }
}
