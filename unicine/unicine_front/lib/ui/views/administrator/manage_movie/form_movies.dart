import 'package:flutter/material.dart';
import 'package:uni_cine/ui/shared/custom_inputs.dart';

class FormMovies extends StatelessWidget {
  const FormMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 40,
                decoration: buildBoxDecoration(),
                child: TextFormField(
                  style: const TextStyle(fontSize: 13),
                  decoration: CustomInputs.loginInputDecoration(
                    hint: 'Ingrese el nombre de la película',
                    label: 'Nombre',
                    icon: Icons.movie_creation_outlined,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 40,
                decoration: buildBoxDecoration(),
                child: TextFormField(
                  style: const TextStyle(fontSize: 13),
                  decoration: CustomInputs.loginInputDecoration(
                    hint: 'Ingrese la url de la imagen',
                    label: 'Imagen',
                    icon: Icons.image_outlined,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 40,
                decoration: buildBoxDecoration(),
                child: TextFormField(
                  style: const TextStyle(fontSize: 13),
                  decoration: CustomInputs.loginInputDecoration(
                    hint: 'Ingrese la url de el tráiler',
                    label: 'Tráiler',
                    icon: Icons.video_call_outlined,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 40,
                decoration: buildBoxDecoration(),
                child: TextFormField(
                  style: const TextStyle(fontSize: 13),
                  decoration: CustomInputs.loginInputDecoration(
                      hint: 'Ingrese el género',
                      label: 'Género',
                      icon: Icons.person_outline_rounded),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 40,
                decoration: buildBoxDecoration(),
                child: TextFormField(
                  style: const TextStyle(fontSize: 13),
                  decoration: CustomInputs.loginInputDecoration(
                    hint: 'Ingrese el reparto',
                    label: 'Reparto',
                    icon: Icons.people,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 40,
                decoration: buildBoxDecoration(),
                child: TextFormField(
                  style: const TextStyle(fontSize: 13),
                  decoration: CustomInputs.loginInputDecoration(
                    hint: 'Seleccione el estado',
                    label: 'Estado',
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Container(
          height: 40,
          decoration: buildBoxDecoration(),
          child: TextFormField(
            style: const TextStyle(fontSize: 13),
            decoration: CustomInputs.loginInputDecoration(
              hint: 'Ingrese la sinopsis',
              label: 'Sinopsis',
              icon: Icons.text_snippet_outlined,
            ),
          ),
        ),
      ],
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.withOpacity(0.1),
      );
}
