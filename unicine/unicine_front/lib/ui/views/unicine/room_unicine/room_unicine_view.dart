import 'package:flutter/material.dart';
import 'package:uni_cine/ui/shared/buttons/custom_outlined_button.dart';
import 'package:uni_cine/ui/views/unicine/room_unicine/chairs_location.dart';
import 'package:uni_cine/ui/shared/type_init_chairs.dart';
import 'package:uni_cine/ui/views/unicine/room_unicine/movie_and_tickets_box.dart';
import 'package:uni_cine/ui/views/unicine/room_unicine/screen_room.dart';
import 'package:uni_cine/ui/shared/total_purchase_box.dart';

class RoomUnicineView extends StatelessWidget {
  List<dynamic> chairs = TypeInitChars.initChairs();
  RoomUnicineView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String? selectedTickets = '1';

    int cantChairs = _enabledChairs(chairs);

    return (size.width >= 720)
        ? _TabletDesktopRoom(cantChairs: cantChairs, chairs: chairs, size: size)
        : _MobileRoom(cantChairs: cantChairs, chairs: chairs, size: size);
  }

  int _enabledChairs(List chairs) {
    int cantChairs = 0;
    for (var chair in chairs) {
      if (chair == 1) cantChairs++;
    }
    return cantChairs;
  }
}

class _TabletDesktopRoom extends StatelessWidget {
  final List<dynamic> chairs;
  final String? selectedTickets = '1';
  final int cantChairs;
  final Size size;

  const _TabletDesktopRoom(
      {required this.chairs, required this.cantChairs, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const ScreenRoom(),
                    const SizedBox(height: 80),
                    Center(
                        child: ChairsLocation(chairs: chairs, cantColums: 23)),
                    const SizedBox(height: 35),
                    _typeChair(context),
                    const SizedBox(height: 55),
                    Row(
                      children: [
                        CustomOutlinedButton(
                          width: size.width / 3.3,
                          text: '+ Agregar Confitería',
                          onPressed: () {},
                        ),
                        const SizedBox(width: 15),
                        CustomOutlinedButton(
                          width: size.width / 3.3,
                          text: 'Realizar Pago',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(width: 60),
                SizedBox(
                  height: size.height / 1.3,
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height / 3.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FadeInImage.assetNetwork(
                            placeholder: 'assets/images/placeholder_movie2.png',
                            image: 'assets/images/placeholder_movie2.png',
                            imageErrorBuilder: (context, error, stackTrace) =>
                                const Icon(
                              Icons.error,
                              size: 64,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      MovieAndTicketsBox(
                        selectedTickets: selectedTickets!,
                        cantTickets: cantChairs,
                      ),
                      const SizedBox(height: 20),
                      const TotalPurchaseBox(height: 40),
                    ],
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

class _MobileRoom extends StatelessWidget {
  final List<dynamic> chairs;
  final String? selectedTickets = '1';
  final int cantChairs;
  final Size size;

  const _MobileRoom(
      {required this.chairs, required this.cantChairs, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          height: size.width < 410 ? 710 : 800,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ScreenRoom(),
              const SizedBox(height: 80),
              Center(
                  child: ChairsLocation(
                chairs: chairs,
                cantColums: 23,
              )),
              const SizedBox(height: 35),
              _typeChair(context),
              const SizedBox(height: 35),
              MovieAndTicketsBox(
                selectedTickets: selectedTickets!,
                cantTickets: cantChairs,
                width: 600,
              ),
              const SizedBox(height: 20),
              const TotalPurchaseBox(width: 600),
              const SizedBox(height: 20),
              CustomOutlinedButton(
                width: 600,
                text: '+ Agregar Confitería',
                onPressed: () {},
              ),
              const SizedBox(height: 15),
              CustomOutlinedButton(
                width: 600,
                text: 'Realizar Pago',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_typeChair(BuildContext context) {
  final size = MediaQuery.of(context).size;
  return size.width > 720
      ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.chair, color: Colors.blue),
            const SizedBox(width: 5),
            const Text(
              'Seleccionada',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 30),
            const Icon(Icons.chair_outlined),
            const SizedBox(width: 5),
            const Text(
              'Disponible',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 30),
            Icon(Icons.chair, color: Colors.red[600]),
            const SizedBox(width: 5),
            const Text(
              'Vendida',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        )
      : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.chair, color: Colors.blue, size: 20),
            const SizedBox(width: 5),
            const Text(
              'Seleccionada',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            ),
            const SizedBox(width: 20),
            const Icon(Icons.chair_outlined, size: 20),
            const SizedBox(width: 5),
            const Text(
              'Disponible',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            ),
            const SizedBox(width: 20),
            Icon(Icons.chair, color: Colors.red[600], size: 20),
            const SizedBox(width: 5),
            const Text(
              'Vendida',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            ),
          ],
        );
}
