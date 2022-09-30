import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:uni_cine/ui/views/unicine/billboard/custom_app_bar.dart';
import 'package:uni_cine/ui/views/unicine/billboard/image_box.dart';

import 'package:uni_cine/ui/shared/custom_labels.dart';

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
      color: Colors.white,
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
            SizedBox(
              height: 400,
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                  },
                ),
                child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: movies,
                    itemBuilder: (context, movies) => const ImageBox()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
