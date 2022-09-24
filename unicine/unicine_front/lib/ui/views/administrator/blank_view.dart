import 'package:flutter/material.dart';

import 'package:uni_cine/ui/shared/cards/white_card.dart';
import 'package:uni_cine/ui/shared/custom_labels.dart';

class BlankView extends StatelessWidget {
  const BlankView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            'Blank view',
            style: CustomLabels.h1,
          ),
          const SizedBox(height: 10),
          const WhiteCard(
            title: 'Theaters',
            child: Text('Hola mundo'),
          )
        ],
      ),
    );
  }
}
