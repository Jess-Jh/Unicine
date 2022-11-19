import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:uni_cine/ui/layouts/administrator_layout_page.dart';
import 'package:uni_cine/ui/layouts/unicine_layout_page.dart';
import 'package:uni_cine/utils/util.dart';

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
      child: Consumer(builder: (context, ref, _) {
        final ctrl = ref.watch(movieProvider);
        return ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: ctrl.loading == false ? ctrl.functionsDates.length : 0,
          itemBuilder: (context, i) => _dateFunction(i),
        );
      }),
    );
  }

  Widget _dateFunction(int i) {
    return Builder(builder: (context) {
      return Consumer(
        builder: (context, ref, _) {
          final ctrl = ref.watch(functionProvider);
          final ctrlMovie = ref.watch(movieProvider);

          return MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
                onTap: () => ctrl.changeColorDateFunction(),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ctrl.colorButtonDate,
                  ),
                  child: ctrlMovie.loading == false
                      ? Text(
                          getStringDateFromDateTime(
                              ctrlMovie.functionsDates[i].fecha!),
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : const SizedBox(),

                  //  Column(
                  //   children: [
                  //     if (ctrlMovie.loading == false) ...[
                  //       Text(
                  //         ctrlMovie.functionsDates[i].fecha?.toString() ?? '',
                  //         style: CustomLabels.h4,
                  //       ),
                  //       Text(
                  //         getStringDateFromDateTime(
                  //             ctrlMovie.functionsDates[i].fecha!),
                  //         style: CustomLabels.h4n,
                  //       )
                  //     ]
                  //   ],
                  // ),
                )),
          );
        },
      );
    });
  }
}
