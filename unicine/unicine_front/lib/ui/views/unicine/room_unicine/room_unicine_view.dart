import 'package:flutter/material.dart';

class RoomUnicineView extends StatefulWidget {
  const RoomUnicineView({super.key});

  @override
  State<RoomUnicineView> createState() => _RoomUnicineViewState();
}

class _RoomUnicineViewState extends State<RoomUnicineView> {
  List<List<dynamic>> chairs = [];
  List<String> letters = ['A', 'B', 'C', 'D', 'E', 'F'];

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(child: const Text('Room unicine')),
        Container(
          color: Colors.green,
          height: 320,
          width: 700,
          child: GridView.count(
            crossAxisCount: 20,
            children: chairs.asMap().entries.map((e) {
              int index = e.key;
              dynamic value = e.value.toString();
              print(value.toString());
              return Column(
                children: [
                  // if (value == 0) const Text(' '),
                  // if (value == 1) const Icon(Icons.chair_outlined),
                  // if (value != 0 && value != 1) Text(value.toString()),

                ],
              );
            }).toList(),
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    chairs = [
      [0, 0, 1, 1, 'A', 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 'A', 1, 1, 0, 0],
      [1, 1, 1, 1, 'B', 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 'B', 1, 1, 0, 0],
      [1, 1, 1, 1, 'C', 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 'C', 1, 1, 0, 0],
      [1, 1, 1, 1, 'D', 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 'D', 1, 1, 0, 0],
      [1, 1, 1, 1, 'E', 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 'E', 1, 1, 0, 0],
      [1, 1, 1, 1, 'F', 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 'F', 1, 1, 0, 0],
      [1, 2, 3, 4,   0, 5, 6, 7, 8, 9, 10,0,11,12,13,14,15,16,   0,17,18,19,20]
    ];
  }

  // void initChairs() {
  //   for (int i = 1; i <= 120 + 35; i++) {
  //     chairs.add(const Icon(Icons.chair_outlined));
  //   }
  // }
}
