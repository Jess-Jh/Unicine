import 'package:flutter/material.dart';
import 'package:uni_cine/ui/views/custom_card_view.dart';
import 'package:uni_cine/ui/views/unicine/pqrs/pqrs_datails.dart';

class PQRSView extends StatelessWidget {
  const PQRSView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 45.0),
      child: CustomCardView(
        title: 'Envíanos tu solicitud PQRS',
        sizeLetter: 26,
        formView: PQRSDetails(),
      ),
    );
  }
}
