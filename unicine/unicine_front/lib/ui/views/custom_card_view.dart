import 'package:flutter/material.dart';

import 'package:uni_cine/ui/shared/cards/white_card.dart';

class CustomCardView extends StatelessWidget {
  final String title;
  final Widget formView;
  final Widget? tableView;

  const CustomCardView(
      {super.key, required this.title, required this.formView, this.tableView});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        const SizedBox(height: 10),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          direction: Axis.horizontal,
          children: [
            WhiteCard(
              title: title,
              child: formView,
            ),
            if (tableView != null) tableView!,
          ],
        )
      ],
    );
  }
}
