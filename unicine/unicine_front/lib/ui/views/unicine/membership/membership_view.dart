import 'package:flutter/material.dart';
import 'package:uni_cine/ui/views/custom_card_view.dart';
import 'package:uni_cine/ui/views/unicine/membership/memberhip_details.dart';

class MembershipView extends StatelessWidget {
  const MembershipView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 45.0),
      child: CustomCardView(
        title: 'Adquiere tu membresía',
        sizeLetter: 30,
        formView: MembershipDetails(),
      ),
    );
  }
}
