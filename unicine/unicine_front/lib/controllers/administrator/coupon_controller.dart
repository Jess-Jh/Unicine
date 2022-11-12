import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:uni_cine/models/administrator/coupon.dart';
import 'package:uni_cine/repositories/api/unicine_api.dart';
import 'package:uni_cine/utils/util.dart';
import 'package:uni_cine/widgets/dialogs.dart';

class CouponController extends SimpleNotifier {
  final GlobalKey<FormState> formCouponKey = GlobalKey<FormState>();
  List<Coupon> coupons = [];
  Coupon? editCoupon;
  bool loading = true;
  bool isEdit = false;
  bool chageDate = false;

  // Inputs
  int idCoupon = 0;
  String valorDescuento = '0';
  DateTime? fechaVencimiento;
  String descripcion = '';
  String criterio = '';

  bool validateForm(formCouponKey) {
    if (formCouponKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  void editSelectCoupon(Coupon coupon) {
    editCoupon = coupon;
    notify();
    Timer(const Duration(milliseconds: 200),
        () => formCouponKey.currentState?.reset());
  }

  void _cleanInputs() {
    if (loading == false) {
      editCoupon = null;
      notify();
      Timer(const Duration(milliseconds: 200),
          () => formCouponKey.currentState?.reset());
    }
  }

  void isUpdateCoupon() {
    isEdit = !isEdit;
    notify();
  }

  void getCoupons() async {
    var res = await UnicineApi.httpGet('/lista-cupones');

    for (final i in res['cupones']) {
      coupons.add(Coupon.fromMap(i));
      coupons.toList();
    }
    loading = false;
    notify();
  }

  Future<void> newCoupon(BuildContext context) async {
    Coupon coupon = Coupon(
      idCupon: idCoupon,
      valorDescuento: double.parse(valorDescuento),
      fechaVencimiento: fechaVencimiento,
      descripcion: descripcion,
      criterio: criterio,
    );

    try {
      await UnicineApi.post('/crear-cupon', coupon.toJson()).then((json) {
        final newCoupon = Coupon.fromMap(json['cupon']);
        coupons.add(newCoupon);
        loading = false;
        Dialogs.showSnackbarTop(
          context,
          json['mensaje'],
          isError: false,
        );
        _cleanInputs();
        notify();
        return;
      }).catchError((e) => throw e);
    } catch (e) {
      Dialogs.showSnackbarTop(
        context,
        e.toString(),
        isError: true,
      );
      log(runtimeType, 'Error en newCoupon CouponController $e');
    }
  }

  Future<void> updateCoupon(BuildContext context) async {
    try {
      if (editCoupon == null && editCoupon!.idCupon == null) {
        return;
      }
      isUpdateCoupon();
      for (int i = 0; i < coupons.length; i++) {
        if (coupons[i].idCupon == editCoupon!.idCupon) {
          editCoupon = Coupon(
            idCupon: editCoupon?.idCupon,
            valorDescuento: double.parse(valorDescuento) == 0
                ? editCoupon?.valorDescuento
                : double.parse(valorDescuento),
            fechaVencimiento: editCoupon?.fechaVencimiento ?? fechaVencimiento,
            descripcion:
                descripcion == '' ? editCoupon?.descripcion : descripcion,
            criterio: criterio == '' ? editCoupon?.criterio : criterio,
          );
          coupons[i] = editCoupon!;
        }
      }

      await UnicineApi.put('/actualizar-cupon', editCoupon!.toJson())
          .then((json) {
        loading = false;
        Dialogs.showSnackbarTop(
          context,
          json['mensaje'],
          isError: false,
        );
        _cleanInputs();
        notify();
      }).catchError((e) => throw e);
    } catch (e) {
      Dialogs.showSnackbarTop(
        context,
        e.toString(),
        isError: true,
      );
      log(runtimeType, 'Error en updateCoupon CouponController $e');
    }
  }

  Future<void> deleteCoupon(BuildContext context, int id) async {
    try {
      await UnicineApi.delete('/eliminar-cupon/$id', {}).then((json) {
        coupons.removeWhere((coupon) => coupon.idCupon == id);
        loading = false;
        Dialogs.showSnackbarTop(
          context,
          json['mensaje'],
          isError: false,
        );

        _cleanInputs();
        notify();
      }).catchError((e) => throw e);
    } catch (e) {
      Dialogs.showSnackbarTop(
        context,
        e.toString(),
        isError: true,
      );
      log(runtimeType, 'Error en deleteCoupon CouponController $e');
    }
  }

  void onChangeDate(DateTime date) {
    fechaVencimiento = date;
    chageDate = true;
    notify();

    Timer(const Duration(milliseconds: 200),
        () => formCouponKey.currentState?.reset());
  }
}
