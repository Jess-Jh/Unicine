import 'package:flutter/material.dart';
import 'package:uni_cine/router/router.dart';
import 'package:uni_cine/ui/shared/appbar/custom_app_menu.dart';
import 'package:uni_cine/ui/views/unicine/movie_description/list_date_function.dart';
import 'package:uni_cine/utils/custom_colors.dart';
import 'package:uni_cine/utils/custom_labels.dart';

class FunctionProgram extends StatelessWidget {
  const FunctionProgram({
    Key? key,
  }) : super(key: key);

  final int hours = 4;

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
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/images/placeholder_video.jpg',
            image: 'assets/images/placeholder_video.jpg',
            imageErrorBuilder: (context, error, stackTrace) => const Icon(
              Icons.error,
              size: 64,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
          width: 600,
          height: 50,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Nombre Teatro',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const Text(
            'Dirección teatro',
            style: TextStyle(
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
              itemCount: hours,
              itemBuilder: (context, hours) => _hourBox(),
            ),
          ),
        ],
      ),
    );
  }

  _hourBox() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => navigateTo(Flurorouter.roomUnicineRoute),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          alignment: Alignment.center,
          height: 25,
          width: 65,
          color: CustomColors.themeWhite,
          child: Text(
            '15:30',
            style: CustomLabels.h3,
          ),
        ),
      ),
    );
  }
}
