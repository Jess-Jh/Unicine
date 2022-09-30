import 'package:flutter/material.dart';
import 'package:uni_cine/ui/shared/combo_box/combo_box_filter.dart';
import 'package:uni_cine/ui/shared/widgets/search_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.selectCity,
    required this.ciudades,
    required this.size,
    required this.filtroBusqueda,
    required this.selectFilter,
  }) : super(key: key);

  final String? selectCity;
  final List<String> ciudades;
  final Size size;
  final List<String> filtroBusqueda;
  final String? selectFilter;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Row(
            children: [
              const Text(
                'Ciudad',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 5),
              ComboBoxFilter(itemSelected: selectCity!, listItems: ciudades),
              const Spacer(),
              if (size.width >= 700) ...[
                const Text(
                  'Filtrar búsqueda por ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ComboBoxFilter(
                    listItems: filtroBusqueda, itemSelected: selectFilter!),
                const SizedBox(width: 5),
                const Expanded(child: SearchText()),
              ],
            ],
          ),
          const SizedBox(height: 5),
          if (size.width < 700) ...[
            Row(
              children: [
                const Text(
                  'Filtrar ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ComboBoxFilter(
                    listItems: filtroBusqueda, itemSelected: selectFilter!),
              ],
            ),
            const SizedBox(height: 5),
            const SearchText(),
          ],
        ],
    );
  }
}
