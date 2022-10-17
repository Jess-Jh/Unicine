import 'package:flutter/material.dart';
import 'package:uni_cine/utils/custom_labels.dart';

class MovieData extends StatelessWidget {
  const MovieData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 250,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 242, 241, 241),
              borderRadius: BorderRadius.circular(10)),
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/images/placeholder_movie2.png',
            image: 'assets/images/placeholder_movie2.png',
            imageErrorBuilder: (context, error, stackTrace) => const Icon(
              Icons.error,
              size: 64,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Nombre película',
          style: CustomLabels.h3,
        ),
        const SizedBox(height: 30),
        Text(
          'Reparto',
          style: CustomLabels.h4,
        ),
        const SizedBox(height: 10),
        Text(
          'Descripción del reparto',
          style: CustomLabels.h4n,
        ),
        const SizedBox(height: 30),
        Text(
          'Sinopsis',
          style: CustomLabels.h4,
        ),
        const SizedBox(height: 10),
        Text(
          'Descripción sinopsis',
          style: CustomLabels.h4n,
        ),
      ],
    );
  }
}
