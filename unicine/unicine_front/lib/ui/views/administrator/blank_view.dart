import 'package:flutter/material.dart';

import 'package:uni_cine/ui/shared/cards/white_card.dart';
import 'package:uni_cine/utils/custom_labels.dart';

class BlankView extends StatelessWidget {
  const BlankView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        Text(
          'Blank view',
          style: CustomLabels.h1,
        ),
        const SizedBox(height: 10),
        WhiteCard(
          title: 'Theaters',
          child: const Text('Hola mundo'),
        )
      ],
    );
  }
}
