import 'package:flutter/material.dart';
import 'package:uni_cine/ui/shared/cards/white_card.dart';
import 'package:uni_cine/ui/shared/inputs/custom_input_data.dart';
import 'package:uni_cine/ui/shared/total_purchase_box.dart';
import 'package:uni_cine/ui/shared/widgets/logoUnicine.dart';

class PurchaseDetailCard extends StatelessWidget {
  final String? selectCoupon;
  final List<String> coupons;

  const PurchaseDetailCard(
      {super.key, this.selectCoupon, required this.coupons});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) => (constraints.maxWidth > 720)
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

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: WhiteCard(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LogoUnicine(
                uniColor: Colors.grey,
                showIcon: false,
                letterSize: 40,
              ),
              const Center(
                child: Text(
                  'Detalle Compra',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                children: const [
                  CustomInputData(
                      data: 'Nombre cliente ', nameColumn: 'Nombre cliente'),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: size.width / 1.68,
                            // height: 180,
                            child: Row(
                              children: const [
                                CustomInputData(
                                  data: 'Confitería',
                                  nameColumn: 'Confitería',
                                ),
                                SizedBox(width: 10),
                                CustomInputData(
                                  data: 'Método de pago',
                                  nameColumn: 'pago',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: size.width / 1.68,
                        height: 170,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomInputData(
                              height: 105,
                              data: 'Total de cupones redimidos',
                              nameColumn: 'cupones',
                            ),
                            const SizedBox(width: 10),
                            Column(
                              children: [
                                TotalPurchaseBox(
                                  width: size.width / 3.4,
                                  showText: false,
                                  text: 'Subtotal Compra',
                                ),
                                TotalPurchaseBox(
                                  width: size.width / 3.4,
                                  showText: false,
                                  text: 'Total Compra',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: size.width / 15),
                  Expanded(
                    child: Container(
                      height: 170,
                      width: 170,
                      color: Colors.grey,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
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
    return SingleChildScrollView(
      child: SizedBox(
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const LogoUnicine(
              uniColor: Colors.grey,
              showIcon: false,
              letterSize: 40,
            ),
            const Center(
              child: Text(
                'Detalle Compra',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
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
            const CustomInputData(
                height: 105,
                data: 'Total de cupones redimidos',
                nameColumn: 'cupones'),
            const SizedBox(height: 10),
            Row(
              children: [
                Column(
                  children: [
                    TotalPurchaseBox(
                      showText: false,
                      text: 'Subtotal Compra',
                      width: size.width / 1.5,
                    ),
                    TotalPurchaseBox(
                      showText: false,
                      text: 'Total Compra',
                      width: size.width / 1.5,
                    ),
                  ],
                ),
                const Spacer(),
                const SizedBox(width: 5),
                Container(
                  height: size.width / 4.5,
                  width: size.width / 4.5,
                  color: Colors.grey,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
