import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:uni_cine/utils/custom_colors.dart';

class NotificationsService {
  static GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey();

  static showSnackbarError(String message) {
    // final snackbar = SnackBar(
    //     backgroundColor: Colors.red.withOpacity(0.9),
    //     content:
    //     );

    // messengerKey.currentState!.showSnackBar(showSnackbarTop(context,));
  }

  static void showSnackbarTop(
    BuildContext? context,
    String message, {
    Color? backgroundColor,
    Color? textColor,
    IconData? icon,
    Color? iconColor,
    bool isError = true,
  }) {
    if (context == null) return;
    showTopSnackBar(
      context,
      curve: Curves.decelerate,
      animationDuration: const Duration(milliseconds: 300),
      // CustomSnackBar.error(message: message),
      Material(
        child: Container(
          constraints: const BoxConstraints(minHeight: 50),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: backgroundColor ?? CustomColors.principal,
            borderRadius: BorderRadius.circular(6),
            boxShadow: const [
              BoxShadow(
                color: Color(0x66000000),
                blurRadius: 16,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(
                icon ??
                    (isError
                        ? Icons.error_outline_sharp
                        : Icons.check_circle_outline_rounded),
                color: iconColor ??
                    (isError
                        ? const Color(0xFFEC3737)
                        : const Color(0xFF2CB03A)),
                size: 23,
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.71,
                child: Text(
                  message,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: textColor ??
                        (isError
                            ? const Color(0xFFEC3737)
                            : const Color(0xFF2CB03A)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
