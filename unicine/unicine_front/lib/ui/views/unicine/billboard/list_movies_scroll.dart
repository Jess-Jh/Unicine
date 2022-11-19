import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:uni_cine/models/administrator/movie.dart';
import 'package:uni_cine/router/router.dart';
import 'package:uni_cine/ui/layouts/administrator_layout_page.dart';
import 'package:uni_cine/ui/shared/appbar/custom_app_menu.dart';
import 'package:uni_cine/ui/views/unicine/billboard/image_box.dart';

class ListMoviesScroll extends ConsumerWidget {
  final String placeholder;
  final double? width;
  final List<Movie>? listMovies;

  const ListMoviesScroll({
    Key? key,
    required this.placeholder,
    this.width,
    this.listMovies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final ctrl = ref.watch(movieProvider);

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
          itemCount: ctrl.movies.length,
          itemBuilder: (context, i) => MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                ctrl.movieFunction = ctrl.movies[i];
                print('yapped');
                ctrl.getFunctionsMovie();
                navigateTo(Flurorouter.movieDescriptionRoute);
              },
              child: ImageBox(
                img: ctrl.movies[i].imagen ?? placeholder,
                width: width,
                nameMovie: ctrl.movies[i].nombre,
                gener: ctrl.movies[i].genero,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
