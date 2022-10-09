import 'package:flutter/material.dart';
import 'package:uni_cine/ui/shared/buttons/custom_outlined_button.dart';
import 'package:uni_cine/ui/views/unicine/room_unicine/chairs_location.dart';
import 'package:uni_cine/ui/shared/type_init_chairs.dart';
import 'package:uni_cine/ui/views/unicine/room_unicine/movie_and_tickets_count.dart';

class RoomUnicineView extends StatelessWidget {
  List<dynamic> chairs = TypeInitChars.initChairs();
  RoomUnicineView({super.key});

  @override
  Widget build(BuildContext context) {
    String? selectedTickets = '1';
    int cantChairs = enabledChairs(chairs);

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: ChairsLocation(chairs: chairs)),
                    const SizedBox(height: 35),
                    typeChair(),
                    const SizedBox(height: 55),
                    Row(
                      children: [
                        CustomOutlinedButton(
                          width: 400,
                          text: '+ Agregar Confitería',
                          onPressed: () {},
                        ),
                        const SizedBox(width: 15),
                        CustomOutlinedButton(
                          width: 400,
                          text: 'Realizar Pago',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(width: 60),
                Column(
                  children: [
                    SizedBox(
                      height: 150,
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
                    MovieAndTicketsCount(
                      selectedTickets: selectedTickets,
                      cantTickets: cantChairs,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row typeChair() {
    return Row(
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
    );
  }

  int enabledChairs(List chairs) {
    int cantChairs = 0;
    for (var chair in chairs) {
      if (chair == 1) cantChairs++;
    }
    return cantChairs;
  }
}
