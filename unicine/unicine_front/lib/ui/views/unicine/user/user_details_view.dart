import 'package:flutter/material.dart';
import 'package:uni_cine/ui/views/custom_card_view.dart';
import 'package:uni_cine/ui/views/unicine/user/user_details.dart';

class UserDetailsView extends StatelessWidget {
  const UserDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 45.0),
      child: CustomCardView(
        title: 'Información Personal',
        sizeLetter: 30,
        formView: UserDetails(),
      ),
    );
  }
}
