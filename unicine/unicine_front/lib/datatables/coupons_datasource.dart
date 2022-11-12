import 'package:flutter/material.dart';
import 'package:uni_cine/models/administrator/coupon.dart';
import 'package:uni_cine/ui/layouts/administrator_layout_page.dart';
import 'package:uni_cine/ui/views/administrator/manage_coupon/form_coupons.dart';
import 'package:uni_cine/utils/util.dart';

class CouponsDTS extends DataTableSource {
  final List<Coupon> coupons;
  final BuildContext context;

  CouponsDTS(this.coupons, this.context);

  @override
  DataRow getRow(int index) {
    final coupon = coupons[index];

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(coupon.idCupon.toString())),
        DataCell(Text(coupon.valorDescuento.toString())),
        DataCell(Text(coupon.descripcion!)),
        DataCell(Text(getStringDateFromDateTime(coupon.fechaVencimiento!))),
        DataCell(
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.edit_outlined,
                ),
                onPressed: () {
                  FormCoupons(id: coupon.idCupon);
                  couponProvider.read.editSelectCoupon(coupon);
                  couponProvider.read.isUpdateCoupon();
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.delete_outline,
                  color: Colors.red.withOpacity(0.8),
                ),
                onPressed: () {
                  final dialog = showMessageAlert(
                    context,
                    '¿Está seguro de eliminar?',
                    '${coupon.descripcion}',
                    coupon.idCupon!,
                  );

                  showDialog(context: context, builder: (_) => dialog);
                },
              )
            ],
          ),
        ),
      ],
    );
  }

  AlertDialog showMessageAlert(
      BuildContext context, String title, String content, int id) {
    return AlertDialog(
      alignment: Alignment.center,
      icon: Icon(
        Icons.error_outline,
        color: Colors.red.withOpacity(0.8),
        size: 80,
      ),
      title: Text(title),
      content: Text('¿Borrar definitivamente $content?'),
      actions: [
        TextButton(
          child: const Text('No'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Si, borrar'),
          onPressed: () async {
            await couponProvider.read.deleteCoupon(context, id).then((value) {
              Navigator.of(context).pop();
            });
          },
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => coupons.length;

  @override
  int get selectedRowCount => 0;
}
