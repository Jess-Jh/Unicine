import 'package:flutter/material.dart';
import 'package:uni_cine/ui/shared/buttons/custom_outlined_button.dart';
import 'package:uni_cine/ui/shared/combo_box/combo_box_filter.dart';
import 'package:uni_cine/ui/shared/inputs/custom_input_data.dart';
import 'package:uni_cine/ui/shared/total_purchase_box.dart';

class FormPurchase extends StatelessWidget {
  final String? selectCoupon;
  final List<String> coupons;

  const FormPurchase({super.key, this.selectCoupon, required this.coupons});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) => (constraints.maxWidth > 520)
          ? _TabletDesktopForm(coupons: coupons, selectCoupon: selectCoupon)
          : _MobileForm(selectCoupon, coupons),
    );
  }
}

class _TabletDesktopForm extends StatelessWidget {
  final String? selectCoupon;
  final List<String> coupons;

  const _TabletDesktopForm({this.selectCoupon, required this.coupons});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: 360,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              CustomInputData(
                  data: 'Nombre cliente', nameColumn: 'Nombre cliente'),
              SizedBox(width: 10),
              CustomInputData(data: 'Teatro', nameColumn: 'Teatro'),
              SizedBox(width: 10),
              CustomInputData(data: 'Nº Sillas', nameColumn: 'Sillas'),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: const [
              CustomInputData(data: 'Horario', nameColumn: 'Horario'),
              SizedBox(width: 10),
              CustomInputData(data: 'Película', nameColumn: 'Película'),
              SizedBox(width: 10),
              CustomInputData(data: 'Fecha de compra', nameColumn: 'Fecha'),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: const [
              CustomInputData(data: 'Confitería', nameColumn: 'Confitería'),
              SizedBox(width: 10),
              CustomInputData(data: 'Método de pago', nameColumn: 'pago'),
            ],
          ),
          const SizedBox(height: 15),
          const Text('  Cupones Redimibles'),
          const SizedBox(height: 5),
          ComboBoxFilter(
            listItems: coupons,
            itemSelected: selectCoupon!,
            colorBorder: Colors.grey,
            buttonWidth: 440,
          ),
          const SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomOutlinedButton(
                width: size.width / 3.3,
                text: 'Realizar Pago',
                onPressed: () {},
              ),
              SizedBox(width: size.width / 6),
              TotalPurchaseBox(
                height: 40,
                width: size.width / 6,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MobileForm extends StatelessWidget {
  final String? selectCoupon;
  final List<String> coupons;
  const _MobileForm(this.selectCoupon, this.coupons);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: 700,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomInputData(
              data: 'Nombre cliente', nameColumn: 'Nombre cliente'),
          const SizedBox(height: 10),
          const CustomInputData(data: 'Teatro', nameColumn: 'Teatro'),
          const SizedBox(height: 10),
          const CustomInputData(data: 'Nº Sillas', nameColumn: 'Sillas'),
          const SizedBox(height: 10),
          const CustomInputData(data: 'Horario', nameColumn: 'Horario'),
          const SizedBox(height: 10),
          const CustomInputData(data: 'Película', nameColumn: 'Película'),
          const SizedBox(height: 10),
          const CustomInputData(data: 'Fecha de compra', nameColumn: 'Fecha'),
          const SizedBox(height: 10),
          const CustomInputData(data: 'Confitería', nameColumn: 'Confitería'),
          const SizedBox(height: 10),
          const CustomInputData(data: 'Método de pago', nameColumn: 'pago'),
          const SizedBox(height: 10),
          const Text('  Cupones Redimibles'),
          const SizedBox(height: 5),
          ComboBoxFilter(
            listItems: coupons,
            itemSelected: selectCoupon!,
            colorBorder: Colors.grey,
            buttonWidth: 440,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomOutlinedButton(
                fontSize: 12,
                width: 150,
                text: 'Realizar Pago',
                onPressed: () {},
              ),
              const SizedBox(width: 15),
              const TotalPurchaseBox(
                height: 40,
                width: 150,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
