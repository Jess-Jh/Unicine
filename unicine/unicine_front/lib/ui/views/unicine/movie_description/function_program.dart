import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:uni_cine/router/router.dart';
import 'package:uni_cine/ui/layouts/administrator_layout_page.dart';
import 'package:uni_cine/ui/shared/appbar/custom_app_menu.dart';
import 'package:uni_cine/ui/views/unicine/movie_description/list_date_function.dart';
import 'package:uni_cine/utils/custom_colors.dart';
import 'package:uni_cine/utils/custom_labels.dart';
import 'package:uni_cine/utils/util.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class FunctionProgram extends StatefulWidget {
  const FunctionProgram({
    Key? key,
  }) : super(key: key);

  @override
  State<FunctionProgram> createState() => _FunctionProgramState();
}

class _FunctionProgramState extends State<FunctionProgram> {
  final YoutubePlayerController _controller2 = YoutubePlayerController();

  final int hours = 4;

  @override
  void initState() {
    super.initState();

    _controller2.onInit = () {
      // bool autoPlay = true;
      // if(autoPlay) {
      final url = movieProvider.read.movieFunction?.trailer;
      log(runtimeType, url);
      _controller2.loadVideoById(
          videoId: url?.replaceFirst('https://youtu.be/', '') ?? '',
          startSeconds: 0);
      // } else {
      //   _controller.cueVideoById(videoId: 'K18cpp_-gP8', startSeconds: 30);
      // }
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            alignment: Alignment.center,
            width: 600,
            height: 370,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 220, 218, 218),
            ),
            child: YoutubePlayerScaffold(
              controller: _controller2,
              aspectRatio: 16 / 9,
              builder: (context, player) {
                return Scaffold(
                  body: player,
                );
              },
            )),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
          width: 600,
          height: 50,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5), topRight: Radius.circular(5)),
            color: CustomColors.themeWhite,
            border: Border.all(color: CustomColors.principal, width: 2),
          ),
          child: const ListDateFunction(),
        ),
        _descriptionFunction(hours)
      ],
    );
  }

  _descriptionFunction(hours) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: CustomColors.principal,
      width: 600,
      height: 160,
      child: Consumer(builder: (context, ref, _) {
        final ctrl = ref.watch(movieProvider);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ctrl.theater?.nombre ?? '',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              ctrl.theater?.direccion ?? '',
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'HORARIOS DISPONIBLES',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 600,
              height: 25,
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: ctrl.functionsDates.length,
                itemBuilder: (context, i) => _hourBox(i),
              ),
            ),
          ],
        );
      }),
    );
  }

  _hourBox(int i) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Consumer(builder: (context, ref, _) {
        final ctrl = ref.watch(movieProvider);

        return GestureDetector(
          onTap: () {
            navigateTo(Flurorouter.roomUnicineRoute);
            ctrl.hourFunction = ctrl.functionsDates[i];
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            alignment: Alignment.center,
            height: 25,
            width: 65,
            color: CustomColors.themeWhite,
            child: Text(
              ctrl.functionsDates[i].hora ?? '',
              style: CustomLabels.h3,
            ),
          ),
        );
      }),
    );
  }
}
