import 'package:flutter/material.dart';

import 'package:uni_cine/ui/shared/cards/white_card.dart';
import 'package:uni_cine/ui/shared/custom_labels.dart';

class ManageTheaterView extends StatelessWidget {
  const ManageTheaterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            'admiistrator view',
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
