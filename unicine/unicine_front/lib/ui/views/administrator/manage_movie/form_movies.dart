import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:uni_cine/ui/layouts/administrator_layout_page.dart';
import 'package:uni_cine/ui/shared/buttons/custom_outlined_button.dart';
import 'package:uni_cine/ui/shared/combo_box/combo_box_filter.dart';
import 'package:uni_cine/ui/shared/inputs/custom_inputs.dart';

class FormMovies extends StatelessWidget {
  final int? id;

  const FormMovies({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) => (constraints.maxWidth > 520)
          ? _TabletDesktopForm(id)
          : _MobileForm(id),
    );
  }
}

class _TabletDesktopForm extends ConsumerWidget {
  final int? id;

  const _TabletDesktopForm(this.id);

  @override
  Widget build(BuildContext context, ref) {
    final ctrl = ref.watch(movieProvider);
    // Selección de estado de película
    final List<String> estadoPelicula = ['CARTELERA', 'PREVENTA'];
    // FILTRO
    String? filtroEstado;

    return SizedBox(
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: ctrl.formMovieKey,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: ctrl.editMovie?.nombre ?? '',
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
                Expanded(
                  child: TextFormField(
                    initialValue: ctrl.editMovie?.imagen ?? '',
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
                Expanded(
                  child: TextFormField(
                    initialValue: ctrl.editMovie?.trailer ?? '',
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: ctrl.editMovie?.genero ?? '',
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
                Expanded(
                  child: TextFormField(
                    initialValue: ctrl.editMovie?.reparto ?? '',
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
                ComboBoxFilter(
                  hint: 'Seleccione el estado',
                  colorText: ctrl.notSelected
                      ? const Color(0xffD32F2F)
                      : Theme.of(context).hintColor,
                  buttonHeight: 47,
                  itemSelected:
                      ctrl.estado.isEmpty ? filtroEstado : ctrl.estado,
                  listItems: estadoPelicula,
                  colorBorder: ctrl.notSelected
                      ? const Color(0xffD32F2F)
                      : const Color(0xffBBBBBB),
                  borderRadius: 5,
                  onChange: (item) {
                    ctrl.estado = item ?? '';
                    ctrl.stateMovie(item ?? '');
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextFormField(
              initialValue: ctrl.editMovie?.sinopsis ?? '',
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
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomOutlinedButton(
                    onPressed: () async {
                      final validForm = ctrl.validateForm(ctrl.formMovieKey);
                      if (!validForm) return;
                      if (ctrl.estado == '') {
                        ctrl.isSelectedComboBox();
                        return;
                      } else {
                        ctrl.isSelectedComboBox();
                      }
                      if (ctrl.editMovie == null) {
                        await ctrl.newMovie(context);
                      } else {
                        await ctrl.updateMovie(context);
                      }
                    },
                    text: 'Guardar',
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
  final int? id;

  const _MobileForm(this.id);

  @override
  Widget build(BuildContext context, ref) {
    final ctrl = ref.watch(movieProvider);

    // Selección de estado de película
    final List<String> estadoPelicula = ['CARTELERA', 'PREVENTA'];
    // FILTRO
    String? filtroEstado;
    return SizedBox(
      height: 520,
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: ctrl.formMovieKey,
        child: Column(
          children: [
            TextFormField(
              initialValue: ctrl.editMovie?.nombre ?? '',
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
            const SizedBox(height: 10),
            TextFormField(
              initialValue: ctrl.editMovie?.imagen ?? '',
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
            const SizedBox(height: 10),
            TextFormField(
              initialValue: ctrl.editMovie?.trailer ?? '',
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
            const SizedBox(height: 15),
            TextFormField(
              initialValue: ctrl.editMovie?.genero ?? '',
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
            const SizedBox(height: 10),
            TextFormField(
              initialValue: ctrl.editMovie?.reparto ?? '',
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
            const SizedBox(height: 10),
            ComboBoxFilter(
              hint: 'Seleccione el estado',
              colorText: ctrl.notSelected
                  ? const Color(0xffD32F2F)
                  : Theme.of(context).hintColor,
              buttonHeight: 47,
              itemSelected: ctrl.estado.isEmpty ? filtroEstado : ctrl.estado,
              listItems: estadoPelicula,
              colorBorder: ctrl.notSelected
                  ? const Color(0xffD32F2F)
                  : const Color(0xffBBBBBB),
              borderRadius: 5,
              onChange: (item) {
                ctrl.estado = item ?? '';
                ctrl.stateMovie(item ?? '');
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
              initialValue: ctrl.editMovie?.sinopsis ?? '',
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
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomOutlinedButton(
                    onPressed: () async {
                      final validForm = ctrl.validateForm(ctrl.formMovieKey);
                      if (!validForm) return;
                      if (ctrl.estado == '') {
                        ctrl.isSelectedComboBox();
                        return;
                      } else {
                        ctrl.isSelectedComboBox();
                      }
                      if (ctrl.editMovie == null) {
                        await ctrl.newMovie(context);
                      } else {
                        await ctrl.updateMovie(context);
                      }
                    },
                    text: 'Guardar',
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
