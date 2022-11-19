import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:uni_cine/router/router.dart';
import 'package:uni_cine/ui/layouts/administrator_layout_page.dart';
import 'package:uni_cine/ui/shared/appbar/custom_app_menu.dart';
import 'package:uni_cine/ui/views/unicine/movie_description/list_date_function.dart';
import 'package:uni_cine/utils/custom_colors.dart';
import 'package:uni_cine/utils/custom_labels.dart';
import 'package:video_player/video_player.dart';

class FunctionProgram extends StatefulWidget {
  const FunctionProgram({
    Key? key,
  }) : super(key: key);

  @override
  State<FunctionProgram> createState() => _FunctionProgramState();
}

class _FunctionProgramState extends State<FunctionProgram> {
  late VideoPlayerController controller;
  final int hours = 4;

  @override
  void initState() {
    super.initState();
    _loadVideoPlayer();
  }

  void _loadVideoPlayer() {
    controller = VideoPlayerController.network(
        movieProvider.read.movieFunction?.trailer ?? '');
    controller.addListener(() {
      setState(() {});
    });
    controller.initialize().then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late VideoPlayerController controller;
    controller = VideoPlayerController.network(
        movieProvider.read.movieFunction?.trailer ?? '');

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
            child: Column(
              children: [
                SizedBox(
                  height: 300,
                  child: AspectRatio(
                    aspectRatio: controller.value.aspectRatio,
                    child: VideoPlayer(controller),
                  ),
                ),
                Text("Duración: ${controller.value.duration}"),
                VideoProgressIndicator(
                  controller,
                  allowScrubbing: true,
                  colors: const VideoProgressColors(
                    backgroundColor: Colors.redAccent,
                    playedColor: Colors.green,
                    bufferedColor: Colors.purple,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          if (controller.value.isPlaying) {
                            controller.pause();
                          } else {
                            controller.play();
                          }

                          setState(() {});
                        },
                        icon: Icon(controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow)),
                    IconButton(
                        onPressed: () {
                          controller.seekTo(const Duration(seconds: 0));

                          setState(() {});
                        },
                        icon: const Icon(Icons.stop))
                  ],
                )
              ],
            )

            // FadeInImage.assetNetwork(
            //   placeholder: 'assets/images/placeholder_video.jpg',
            //   image: 'assets/images/placeholder_video.jpg',
            //   imageErrorBuilder: (context, error, stackTrace) => const Icon(
            //     Icons.error,
            //     size: 64,
            //   ),
            // ),
            ),
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
          onTap: () => navigateTo(Flurorouter.roomUnicineRoute),
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
