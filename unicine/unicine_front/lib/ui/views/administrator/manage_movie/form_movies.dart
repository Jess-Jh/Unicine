import 'package:flutter/material.dart';
import 'package:uni_cine/ui/shared/inputs/custom_form_input.dart';
import 'package:uni_cine/ui/shared/buttons/custom_outlined_button.dart';

class FormMovies extends StatelessWidget {
  const FormMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (_, constraints) => (constraints.maxWidth > 520)
            ? _TabletDesktopForm()
            : _MobileForm());
  }
}

class _TabletDesktopForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: Column(
        children: [
          Row(
            children: const [
              CustomFormInput(hint: 'Ingrese el nombre de la película', label: 'Nombre', icon: Icons.movie_creation_outlined),
              SizedBox(width: 10),
              CustomFormInput(hint: 'Ingrese la url de la imagen', label: 'Imagen', icon: Icons.image_outlined),
              SizedBox(width: 10),
              CustomFormInput(hint: 'Ingrese la url del tráiler', label: 'Tráiler', icon: Icons.video_call_outlined),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: const [
              CustomFormInput(hint: 'Ingrese el género', label: 'Género', icon: Icons.person_outline_rounded),
              SizedBox(width: 10),
              CustomFormInput(hint: 'Ingrese el reparto', label: 'Reparto', icon: Icons.people),
              SizedBox(width: 10),
              CustomFormInput(hint: 'Seleccione el estado', label: 'Estado', icon: Icons.not_started_outlined),
            ],
          ),
          const SizedBox(height: 15),
          const CustomFormInput(hint: 'Ingrese la sinopsis', label: 'Sinopsis', icon: Icons.text_snippet_outlined),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CustomOutlinedButton(
                  onPressed: () {},
                  text: 'Guardar',
                  width: 300,
                  height: 8,
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: CustomOutlinedButton(
                  onPressed: () {},
                  text: 'Actualizar',
                  width: 300,
                  height: 8,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MobileForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        children: [
          const CustomFormInput(hint: 'Ingrese el nombre de la película', label: 'Nombre', icon: Icons.movie_creation_outlined),
          const SizedBox(height: 10),
          const CustomFormInput(hint: 'Ingrese la url de la imagen', label: 'Imagen', icon: Icons.image_outlined),
          const SizedBox(height: 10),
          const CustomFormInput(hint: 'Ingrese la url del tráiler', label: 'Tráiler', icon: Icons.video_call_outlined),
          const SizedBox(height: 15),
          const CustomFormInput(hint: 'Ingrese el género', label: 'Género', icon: Icons.person_outline_rounded),
          const SizedBox(height: 10),
          const CustomFormInput(hint: 'Ingrese el reparto', label: 'Reparto', icon: Icons.people),
          const SizedBox(height: 10),
          const CustomFormInput(hint: 'Seleccione el estado', label: 'Estado', icon: Icons.not_started_outlined),
          const SizedBox(height: 15),
          const CustomFormInput(hint: 'Ingrese la sinopsis', label: 'Sinopsis', icon: Icons.text_snippet_outlined),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CustomOutlinedButton(
                  onPressed: () {},
                  text: 'Guardar',
                  width: 300,
                  height: 8,
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: CustomOutlinedButton(
                  onPressed: () {},
                  text: 'Actualizar',
                  width: 300,
                  height: 8,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
