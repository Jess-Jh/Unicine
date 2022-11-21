import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:uni_cine/ui/layouts/administrator_layout_page.dart';
import 'package:uni_cine/ui/shared/combo_box/combo_box_filter.dart';
import 'package:uni_cine/utils/custom_colors.dart';
import 'package:uni_cine/utils/util.dart';

class MovieAndTicketsBox extends ConsumerWidget {
  final String selectedTickets;
  final int cantTickets;
  final double? width;
  final double? height;

  const MovieAndTicketsBox({
    super.key,
    required this.selectedTickets,
    required this.cantTickets,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context, ref) {
    final ctrl = ref.watch(movieProvider);

    final aux = List<int>.generate(cantTickets, (i) => i + 1);
    final List<String> tickets = [
      for (int i = 0; i < aux.length; i++) aux[i].toString()
    ];
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        width: width ?? 250,
        height: height ?? 210,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: CustomColors.principal,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Cantidad de tiquetes: ',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(width: 15),
                ComboBoxFilter(
                  itemSelected: ctrl.cantTicketsFunction == ''
                      ? '1'
                      : ctrl.cantTicketsFunction,
                  onChange: (value) => ctrl.onChangeTickets(value),
                  listItems: tickets,
                  colorBox: Colors.white,
                  buttonHeight: 25,
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                SizedBox(
                  width: 100,
                  child: Text(
                    ctrl.movieFunction?.nombre ?? '',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  getStringDateFromDateTime(
                      ctrl.hourFunction?.fecha ?? DateTime.now()),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Cine',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12,
                        )),
                    Text(
                      ctrl.theater?.nombre ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Compra',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '${Random().nextInt(1000) + 150}'.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Sillas',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 12,
              ),
            ),
            const Text(
              'Lista Sillas',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
