import 'package:flutter/material.dart';
import 'package:uni_cine/ui/views/unicine/billboard/custom_app_bar.dart';

// ignore: must_be_immutable
class BillboardView extends StatelessWidget {

  // Selección de ciudades
  List<String> ciudades = ['Pereira','Armenia','Cali','Medellín','Villavicencio','Bogotá'];
  List<String> filtroBusqueda = ['Películas','Teatros'];

  // Filtro de películas
  String? selectCity = 'Pereira';
  String? selectFilter = 'Películas';

  BillboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Column(
        children: [
          CustomAppBar(selectCity: selectCity, ciudades: ciudades, size: size, filtroBusqueda: filtroBusqueda, selectFilter: selectFilter),
        ],
      ),
      );
  }
}


