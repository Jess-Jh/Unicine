import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class ChairsLocation extends StatelessWidget {
  final List<dynamic> chairs;
  final int cantColums;

  const ChairsLocation({
    super.key,
    required this.chairs,
    required this.cantColums,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return size.width >= 720
        ? _TabletDesktopRoom(chairs: chairs, size: size, cantColums: cantColums)
        : _MobileRoom(chairs: chairs, size: size, cantColums: cantColums);
  }
}

class _TabletDesktopRoom extends StatelessWidget {
  final List<dynamic> chairs;
  final Size size;
  final int cantColums;

  const _TabletDesktopRoom(
      {required this.chairs, required this.size, required this.cantColums});

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
              width: size.width / 1.6,
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: cantColums,
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

class _MobileRoom extends StatelessWidget {
  final List<dynamic> chairs;
  final Size size;
  final int cantColums;
  const _MobileRoom(
      {required this.chairs, required this.size, required this.cantColums});

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                width: size.width / 1.0,
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: cantColums,
                      mainAxisSpacing: 6,
                      crossAxisSpacing: 6),
                  itemCount: chairs.length,
                  itemBuilder: (_, i) {
                    return (chairs[i] == 0)
                        ? const Text(
                            '',
                            style: TextStyle(fontSize: 15),
                          )
                        : (chairs[i] == 1)
                            ? const Icon(Icons.chair_outlined, size: 15)
                            : Center(
                                child: Text(
                                  chairs[i].toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 8,
                                  ),
                                ),
                              );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
