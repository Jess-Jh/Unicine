import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:uni_cine/ui/views/unicine/billboard/image_box.dart';

class ListMoviesScroll extends StatelessWidget {
  final String img;
  final double? width;
  final String? duration;

  const ListMoviesScroll(
      {Key? key,
      required this.movies,
      required this.img,
      this.width,
      this.duration})
      : super(key: key);

  final int movies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
        ),
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: movies,
          itemBuilder: (context, movies) =>
              ImageBox(img: img, width: width, duration: duration),
        ),
      ),
    );
  }
}
