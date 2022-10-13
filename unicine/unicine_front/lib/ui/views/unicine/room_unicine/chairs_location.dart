import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class ChairsLocation extends StatelessWidget {
  final List<dynamic> chairs;

  const ChairsLocation({super.key, required this.chairs});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(
              width: 850,
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 23,
                    mainAxisSpacing: 6,
                    crossAxisSpacing: 6),
                itemCount: chairs.length,
                itemBuilder: (_, i) {
                  return (chairs[i] == 0)
                      ? const Text('')
                      : (chairs[i] == 1)
                          ? const Icon(Icons.chair_outlined)
                          : Center(
                              child: Text(
                                chairs[i].toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
