import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';

import 'package:uni_cine/ui/shared/custom_flat_button.dart';
import '../../controllers/counter_controller.dart';

final counterProvider = SimpleProvider(
  (ref) => CounterController(ref.arguments),
);

class CounterMeeduView extends ConsumerWidget {
  final String base;

  CounterMeeduView({Key? key, required this.base}) : super(key: key) {
    counterProvider.setArguments(base);
  }

  @override
  Widget build(BuildContext context, ref) {
    final ctrl = ref.watch(counterProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        const Text('Contador Meedu', style: TextStyle(fontSize: 20)),
        FittedBox(
          fit: BoxFit.contain,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Contador: ${ctrl.counter}',
              style: const TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomFlatButton(
              text: 'Incrementar',
              onPressed: () => ctrl.increment(),
            ),
            CustomFlatButton(
              text: 'Decrementar',
              onPressed: () => ctrl.decrement(),
            ),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
