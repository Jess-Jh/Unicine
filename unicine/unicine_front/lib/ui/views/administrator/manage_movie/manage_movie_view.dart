import 'package:flutter/material.dart';

import 'package:uni_cine/ui/shared/cards/white_card.dart';
import 'package:uni_cine/ui/views/administrator/manage_movie/form_movies.dart';
import 'package:uni_cine/ui/views/administrator/manage_movie/table_movies.dart';

class ManageMovieView extends StatelessWidget {
  const ManageMovieView({super.key});

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
              title: 'Detalle Película',
              child: FormMovies(),
            ),
            TableMovies(),
          ],
        )
      ],
    );
  }
}
