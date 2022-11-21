import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:uni_cine/router/router.dart';
import 'package:uni_cine/ui/layouts/administrator_layout_page.dart';
import 'package:uni_cine/ui/shared/appbar/custom_app_menu.dart';
import 'package:uni_cine/ui/shared/buttons/custom_outlined_button.dart';
import 'package:uni_cine/ui/views/unicine/room_unicine/chairs_location.dart';
import 'package:uni_cine/ui/views/unicine/room_unicine/movie_and_tickets_box.dart';
import 'package:uni_cine/ui/views/unicine/room_unicine/screen_room.dart';
import 'package:uni_cine/ui/shared/total_purchase_box.dart';
import 'package:uni_cine/utils/custom_network_image.dart';

class RoomUnicineView extends ConsumerWidget {
  const RoomUnicineView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final ctrl = ref.watch(movieProvider);
    final size = MediaQuery.of(context).size;
    List<dynamic> chairs = ctrl.chairs;
    int columns = ctrl.distributionChairs?.columnas ?? 0;

    int cantChairs = _enabledChairs(chairs);

    return (size.width >= 720)
        ? _TabletDesktopRoom(
            cantChairs: cantChairs,
            chairs: chairs,
            size: size,
            columns: columns)
        : _MobileRoom(
            cantChairs: cantChairs,
            chairs: chairs,
            size: size,
            columns: columns);
  }

  int _enabledChairs(List chairs) {
    int cantChairs = 0;
    for (var chair in chairs) {
      if (chair == 1) cantChairs++;
    }
    return cantChairs;
  }
}

class _TabletDesktopRoom extends ConsumerWidget {
  final List<dynamic> chairs;
  final int cantChairs;
  final Size size;
  final int columns;

  const _TabletDesktopRoom(
      {required this.chairs,
      required this.cantChairs,
      required this.size,
      required this.columns});

  @override
  Widget build(BuildContext context, ref) {
    final ctrl = ref.watch(movieProvider);
    final String selectedTickets = ctrl.cantTicketsFunction ?? '1';

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
                        child: ChairsLocation(
                            chairs: chairs, cantColums: columns)),
                    const SizedBox(height: 35),
                    _typeChair(context),
                    const SizedBox(height: 55),
                    Row(
                      children: [
                        CustomOutlinedButton(
                          width: size.width / 3.3,
                          text: '+ Agregar Confitería',
                          onPressed: () =>
                              navigateTo(Flurorouter.confectioneryRoute),
                        ),
                        const SizedBox(width: 15),
                        CustomOutlinedButton(
                          width: size.width / 3.3,
                          text: 'Realizar Pago',
                          onPressed: () =>
                              navigateTo(Flurorouter.purchaseDetailRoute),
                        ),
                      ],
                    ),
                    const SizedBox(height: 100)
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
                            child: CustomNetworkImage(
                              imageUrl: ctrl.movieFunction?.imagen ??
                                  'assets/images/placeholder_movie2.png',
                              placeholder: Image.asset(
                                  'assets/images/placeholder_movie2.png'),
                              fit: BoxFit.cover,
                            )),
                      ),
                      const SizedBox(height: 15),
                      MovieAndTicketsBox(
                        selectedTickets: selectedTickets,
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
  final int columns;

  const _MobileRoom(
      {required this.chairs,
      required this.cantChairs,
      required this.size,
      required this.columns});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          height: 900,
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
                onPressed: () => navigateTo(Flurorouter.confectioneryRoute),
              ),
              const SizedBox(height: 15),
              CustomOutlinedButton(
                width: 600,
                text: 'Realizar Pago',
                onPressed: () => navigateTo(Flurorouter.purchaseDetailRoute),
              ),
              const SizedBox(height: 100)
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
