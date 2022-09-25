import 'package:flutter/material.dart';

import 'package:uni_cine/ui/shared/cards/white_card.dart';
import 'package:uni_cine/ui/views/administrator/manage_theater/form_theaters.dart';
import 'package:uni_cine/ui/views/administrator/manage_theater/table_theaters.dart';

class ManageTheaterView extends StatelessWidget {
  const ManageTheaterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        const SizedBox(height: 10),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          direction: Axis.horizontal,
          children: const [
            WhiteCard(
              title: 'Detalle Teatro',
              child: FormTheaters(),
            ),
            TableTheaters(),
          ],
        )
      ],
    );
  }
}
