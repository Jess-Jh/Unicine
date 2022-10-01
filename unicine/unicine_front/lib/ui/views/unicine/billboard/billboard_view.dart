import 'package:flutter/material.dart';

import 'package:uni_cine/ui/views/unicine/billboard/custom_app_bar.dart';

import 'package:uni_cine/ui/shared/custom_labels.dart';
import 'package:uni_cine/ui/views/unicine/billboard/list_movies_scroll.dart';

// ignore: must_be_immutable
class BillboardView extends StatelessWidget {
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

  BillboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int movies = 20;
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
              movies: movies,
              img: 'assets/images/placeholder_movie.jpg',
              duration: 'duration',
            ),
            Text('Preventa', style: CustomLabels.h2),
            const SizedBox(height: 10),
            const ListMoviesScroll(
              movies: movies,
              width: 170,
              img: 'assets/images/placeholder_movie2.png',
            ),
          ],
        ),
      ),
    );
  }
}
