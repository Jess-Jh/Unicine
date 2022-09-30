import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:uni_cine/ui/shared/appbar/custom_app_menu.dart';

import 'package:uni_cine/ui/shared/buttons/custom_flat_button.dart';
import '../../controllers/counter_controller.dart';

final counterProvider = SimpleProvider(
  (ref) => CounterController('5'),
);

class CounterMeeduPage extends ConsumerWidget {
  const CounterMeeduPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final ctrl = ref.watch(counterProvider);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomAppMenu(),
          const Spacer(),
          const Text('Contador Meedu', style: TextStyle(fontSize: 20)),
          FittedBox(
            fit: BoxFit.contain,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Contador: ${ctrl.counter}',
                style:
                    const TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
