import 'package:flutter/material.dart';
import 'package:uni_cine/ui/shared/custom_labels.dart';

class ImageBox extends StatelessWidget {
  const ImageBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 350,
      width: 405,
      child: Column(
        children: [
          SizedBox(
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/placeholder_movie.jpg',
              image: 'assets/images/placeholder_movie.jpg',
              imageErrorBuilder: (context, error, stackTrace) => const Icon(
                Icons.error,
                size: 64,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Nombre película', style: CustomLabels.h3),
                const SizedBox(width: 5),
                Text('película', style: CustomLabels.h3n),
                const Spacer(),
                Text('Duración', style: CustomLabels.h3),
                const SizedBox(width: 5),
                Text('duración', style: CustomLabels.h3n),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Género', style: CustomLabels.h4),
                const SizedBox(width: 5),
                Text('genero', style: CustomLabels.h4n),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
