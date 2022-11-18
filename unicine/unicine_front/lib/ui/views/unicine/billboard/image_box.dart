import 'package:flutter/material.dart';
import 'package:uni_cine/utils/custom_labels.dart';
import 'package:uni_cine/utils/custom_network_image.dart';

class ImageBox extends StatelessWidget {
  final String img;
  final double? width;
  final String? nameMovie;
  final String? gener;

  const ImageBox({
    Key? key,
    required this.img,
    this.width,
    this.nameMovie,
    this.gener,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: width ?? 405,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CustomNetworkImage(
              height: 294,
              width: 400,
              fit: BoxFit.cover,
              placeholder: Image.asset('assets/images/placeholder_movie.jpg'),
              imageUrl: img,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              nameMovie ?? '',
              style: CustomLabels.h3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              gener ?? '',
              style: CustomLabels.h4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
