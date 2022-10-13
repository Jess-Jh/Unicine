import 'package:flutter/material.dart';
import 'package:uni_cine/ui/shared/combo_box/combo_box_filter.dart';
import 'package:uni_cine/utils/custom_colors.dart';

class MovieAndTicketsCount extends StatelessWidget {
  final String selectedTickets;
  final int cantTickets;

  const MovieAndTicketsCount(
      {super.key, required this.selectedTickets, required this.cantTickets});

  @override
  Widget build(BuildContext context) {
    final aux = List<int>.generate(cantTickets, (i) => i + 1);
    final List<String> tickets = [
      for (int i = 0; i < aux.length; i++) aux[i].toString()
    ];
    return Container(
      padding: const EdgeInsets.all(20),
      width: 250,
      height: 220,
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
                listItems: tickets,
                itemSelected: selectedTickets,
                colorBox: Colors.white,
                buttonHeight: 25,
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: const [
              Text(
                'Nombre Pelicula',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 15),
              Text(
                'Fecha y hora',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Cine', style: TextStyle(color: Colors.grey[400])),
                  const Text(
                    'Nombre teatro',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Compra',
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                  const Text(
                    'Código compra',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Sillas',
            style: TextStyle(color: Colors.grey[400]),
          ),
          const Text(
            'Lista Sillas',
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
