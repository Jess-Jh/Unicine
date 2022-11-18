import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:uni_cine/ui/layouts/administrator_layout_page.dart';
import 'package:uni_cine/utils/custom_labels.dart';
import 'package:uni_cine/utils/custom_network_image.dart';

class MovieData extends ConsumerWidget {
  const MovieData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final ctrl = ref.watch(movieProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 250,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 242, 241, 241),
              borderRadius: BorderRadius.circular(10)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CustomNetworkImage(
              height: 350,
              imageUrl: ctrl.movieFunction?.imagen ?? '',
              fit: BoxFit.cover,
              placeholder: Image.asset('assets/images/placeholder_movie2.png'),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          ctrl.movieFunction?.nombre ?? '',
          style: CustomLabels.h3,
        ),
        const SizedBox(height: 30),
        Text(
          'Reparto',
          style: CustomLabels.h4,
        ),
        const SizedBox(height: 10),
        Text(
          ctrl.movieFunction?.nombre ?? '',
          style: CustomLabels.h4n,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        const SizedBox(height: 30),
        Text(
          'Sinopsis',
          style: CustomLabels.h4,
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 250,
          child: Text(
            ctrl.movieFunction?.sinopsis ?? '',
            style: CustomLabels.h4n,
            maxLines: 10,
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
