import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:uni_cine/ui/layouts/unicine_layout_page.dart';
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
    return Builder(builder: (context) {
      return Consumer(
        builder: (context, ref, _) {
          final ctrl = ref.watch(functionProvider);

          return MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => ctrl.changeColorDateFunction(),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ctrl.colorButtonDate,
                ),
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
              ),
            ),
          );
        },
      );
    });
  }
}
