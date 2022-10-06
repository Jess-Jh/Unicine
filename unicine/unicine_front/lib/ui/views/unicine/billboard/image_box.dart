import 'package:flutter/material.dart';
import 'package:uni_cine/utils/custom_labels.dart';

class ImageBox extends StatelessWidget {
  final String img;
  final double? width;
  final String? duration;

  const ImageBox({Key? key, required this.img, this.width, this.duration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: width ?? 405,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage.assetNetwork(
              placeholder: img,
              image: img,
              imageErrorBuilder: (context, error, stackTrace) => const Icon(
                Icons.error,
                size: 64,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Text('Nombre película', style: CustomLabels.h3),
                if (duration != null) ...[
                  const Spacer(),
                  Text('Duración', style: CustomLabels.h3),
                ]
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                Text('Género', style: CustomLabels.h4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
