import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:uni_cine/utils/custom_labels.dart';

class ListDateFunction extends StatelessWidget {
  const ListDateFunction({super.key});

  final int cantDates = 5;
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
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
        itemCount: cantDates,
        itemBuilder: (context, cantDates) => _dateFunction(),
      ),
    );
  }

  Widget _dateFunction() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Text(
            'DOM.',
            style: CustomLabels.h4,
          ),
          Text(
            '28 AGO. 2022',
            style: CustomLabels.h4n,
          )
        ],
      ),
    );
  }
}
