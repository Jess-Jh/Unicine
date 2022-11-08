import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:uni_cine/models/administrator/movie.dart';
import 'package:uni_cine/ui/layouts/administrator_layout_page.dart';
import 'package:uni_cine/ui/shared/inputs/custom_form_input.dart';
import 'package:uni_cine/ui/shared/buttons/custom_outlined_button.dart';
import 'package:uni_cine/ui/shared/inputs/custom_inputs.dart';

class FormMovies extends StatelessWidget {
  final Movie? movie;

  const FormMovies({super.key, this.movie});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) => (constraints.maxWidth > 520)
          ? _TabletDesktopForm(movie)
          : _MobileForm(movie),
    );
  }
}

class _TabletDesktopForm extends ConsumerWidget {
  final GlobalKey<FormState> formMovieKey = GlobalKey<FormState>();
  final Movie? movie;

  _TabletDesktopForm(this.movie);

  @override
  Widget build(BuildContext context, ref) {
    final ctrl = ref.watch(movieProvider);

    return SizedBox(
      height: 260,
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formMovieKey,
        child: Column(
          children: [
            Row(
              children: [
                CustomFormInput(
                  inputForm: TextFormField(
                    initialValue: movie?.nombre ?? '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingrese el nombre de la película';
                      }
                      return null;
                    },
                    onChanged: (value) => ctrl.nombre = value,
                    keyboardType: TextInputType.name,
                    style: const TextStyle(fontSize: 13),
                    decoration: CustomInputs.loginInputDecoration(
                      hint: 'Ingrese el nombre de la película',
                      label: 'Nombre',
                      icon: Icons.movie_creation_outlined,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                CustomFormInput(
                  inputForm: TextFormField(
                    initialValue: movie?.imagen ?? '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingrese la url de la imagen';
                      }
                      return null;
                    },
                    onChanged: (value) => ctrl.urlImagen = value,
                    style: const TextStyle(fontSize: 13),
                    decoration: CustomInputs.loginInputDecoration(
                      hint: 'Ingrese la url de la imagen',
                      label: 'Imagen',
                      icon: Icons.image_outlined,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                CustomFormInput(
                  inputForm: TextFormField(
                    initialValue: movie?.trailer ?? '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingrese la url del tráiler';
                      }
                      return null;
                    },
                    onChanged: (value) => ctrl.trailer = value,
                    style: const TextStyle(fontSize: 13),
                    decoration: CustomInputs.loginInputDecoration(
                      hint: 'Ingrese la url del tráiler',
                      label: 'Tráiler',
                      icon: Icons.video_call_outlined,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                CustomFormInput(
                  inputForm: TextFormField(
                    initialValue: movie?.genero ?? '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingrese el género';
                      }
                      return null;
                    },
                    onChanged: (value) => ctrl.genero = value,
                    style: const TextStyle(fontSize: 13),
                    decoration: CustomInputs.loginInputDecoration(
                      hint: 'Ingrese el género',
                      label: 'Género',
                      icon: Icons.person_outline_rounded,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                CustomFormInput(
                  inputForm: TextFormField(
                    initialValue: movie?.reparto ?? '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingrese el reparto';
                      }
                      return null;
                    },
                    onChanged: (value) => ctrl.reparto = value,
                    style: const TextStyle(fontSize: 13),
                    decoration: CustomInputs.loginInputDecoration(
                      hint: 'Ingrese el reparto',
                      label: 'Reparto',
                      icon: Icons.people,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                CustomFormInput(
                  inputForm: TextFormField(
                    initialValue: movie?.estadoPelicula ?? '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Seleccione el estado';
                      }
                      return null;
                    },
                    onChanged: (value) => ctrl.estado = value,
                    style: const TextStyle(fontSize: 13),
                    decoration: CustomInputs.loginInputDecoration(
                      hint: 'Seleccione el estado',
                      label: 'Estado',
                      icon: Icons.not_started_outlined,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            CustomFormInput(
              inputForm: TextFormField(
                initialValue: movie?.sinopsis ?? '',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese la sinopsis';
                  }
                  return null;
                },
                onChanged: (value) => ctrl.sinopsis = value,
                style: const TextStyle(fontSize: 13),
                decoration: CustomInputs.loginInputDecoration(
                  hint: 'Ingrese la sinopsis',
                  label: 'Sinopsis',
                  icon: Icons.not_started_outlined,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomOutlinedButton(
                    onPressed: () async {
                      final validForm = ctrl.validateForm(formMovieKey);
                      if (!validForm) return;

                      if (movie == null) {
                        // crear
                        await ctrl.newMovie(context);
                        if (ctrl.loading == false) {
                          // ignore: use_build_context_synchronously
                          // Dialogs.showSnackbarTop(
                          //   context,
                          //   'Se registró la película con éxito',
                          //   isError: false,
                          // );
                        }
                      } else {
                        // Actualizar
                      }
                    },
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
      ),
    );
  }
}

class _MobileForm extends ConsumerWidget {
  final GlobalKey<FormState> formMovieKey = GlobalKey<FormState>();
  final Movie? movie;

  _MobileForm(this.movie);

  @override
  Widget build(BuildContext context, ref) {
    final ctrl = ref.watch(movieProvider);
    return SizedBox(
      height: 520,
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formMovieKey,
        child: Column(
          children: [
            CustomFormInput(
              inputForm: TextFormField(
                initialValue: movie?.nombre ?? '',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese el nombre de la película';
                  }
                  return null;
                },
                onChanged: (value) => ctrl.nombre = value,
                keyboardType: TextInputType.name,
                style: const TextStyle(fontSize: 13),
                decoration: CustomInputs.loginInputDecoration(
                  hint: 'Ingrese el nombre de la película',
                  label: 'Nombre',
                  icon: Icons.movie_creation_outlined,
                ),
              ),
            ),
            const SizedBox(height: 10),
            CustomFormInput(
              inputForm: TextFormField(
                initialValue: movie?.imagen ?? '',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese la url de la imagen';
                  }
                  return null;
                },
                onChanged: (value) => ctrl.urlImagen = value,
                style: const TextStyle(fontSize: 13),
                decoration: CustomInputs.loginInputDecoration(
                  hint: 'Ingrese la url de la imagen',
                  label: 'Imagen',
                  icon: Icons.image_outlined,
                ),
              ),
            ),
            const SizedBox(height: 10),
            CustomFormInput(
              inputForm: TextFormField(
                initialValue: movie?.trailer ?? '',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese la url del tráiler';
                  }
                  return null;
                },
                onChanged: (value) => ctrl.trailer = value,
                style: const TextStyle(fontSize: 13),
                decoration: CustomInputs.loginInputDecoration(
                  hint: 'Ingrese la url del tráiler',
                  label: 'Tráiler',
                  icon: Icons.video_call_outlined,
                ),
              ),
            ),
            const SizedBox(height: 15),
            CustomFormInput(
              inputForm: TextFormField(
                initialValue: movie?.genero ?? '',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese el género';
                  }
                  return null;
                },
                onChanged: (value) => ctrl.genero = value,
                style: const TextStyle(fontSize: 13),
                decoration: CustomInputs.loginInputDecoration(
                  hint: 'Ingrese el género',
                  label: 'Género',
                  icon: Icons.person_outline_rounded,
                ),
              ),
            ),
            const SizedBox(height: 10),
            CustomFormInput(
              inputForm: TextFormField(
                initialValue: movie?.reparto ?? '',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese el reparto';
                  }
                  return null;
                },
                onChanged: (value) => ctrl.reparto = value,
                style: const TextStyle(fontSize: 13),
                decoration: CustomInputs.loginInputDecoration(
                  hint: 'Ingrese el reparto',
                  label: 'Reparto',
                  icon: Icons.people,
                ),
              ),
            ),
            const SizedBox(height: 10),
            CustomFormInput(
              inputForm: TextFormField(
                initialValue: movie?.estadoPelicula ?? '',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Seleccione el estado';
                  }
                  return null;
                },
                onChanged: (value) => ctrl.estado = value,
                style: const TextStyle(fontSize: 13),
                decoration: CustomInputs.loginInputDecoration(
                  hint: 'Seleccione el estado',
                  label: 'Estado',
                  icon: Icons.not_started_outlined,
                ),
              ),
            ),
            const SizedBox(height: 15),
            CustomFormInput(
              inputForm: TextFormField(
                initialValue: movie?.sinopsis ?? '',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese la sinopsis';
                  }
                  return null;
                },
                onChanged: (value) => ctrl.sinopsis = value,
                style: const TextStyle(fontSize: 13),
                decoration: CustomInputs.loginInputDecoration(
                  hint: 'Ingrese la sinopsis',
                  label: 'Sinopsis',
                  icon: Icons.not_started_outlined,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomOutlinedButton(
                    onPressed: () {
                      final validForm = ctrl.validateForm(formMovieKey);
                      if (!validForm) return;
                    },
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
      ),
    );
  }
}
