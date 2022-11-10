import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:uni_cine/utils/custom_colors.dart';

enum DialogAction { accept, cancel, retry }

class Dialogs {
  static const bool _dialogVisible = false;

  static showLoadingDialog(BuildContext? context, bool visible) {
    if (context == null) return;
    if (visible) {
      Dialogs.loadingDialog(context: context, dismissible: false);
    } else {
      // router.pop();
    }
  }

  static Future<DialogAction> loadingDialog({
    required BuildContext? context,
    bool dismissible = true,
  }) async {
    if (context == null) return DialogAction.cancel;
    final action = await showGeneralDialog<DialogAction>(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: const LoadingDialog(),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 200),
        barrierDismissible: dismissible,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return Container();
        });

    return action ?? DialogAction.cancel;
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
            color: (isError
                ? const Color.fromARGB(255, 176, 44, 44).withOpacity(0.8)
                : const Color(0xFF2CB03A).withOpacity(0.8)),
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
                        ? const Color.fromARGB(255, 255, 255, 255)
                        : const Color.fromARGB(255, 255, 255, 255)),
                size: 23,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  message,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: textColor ??
                        (isError
                            ? const Color.fromARGB(255, 255, 255, 255)
                            : const Color.fromARGB(255, 255, 255, 255)),
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

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: CustomColors.themeWhite,
          borderRadius: BorderRadius.circular(5),
        ),
        child: const Center(
          child: CircularProgressIndicator(
            // backgroundColor: Colors.white,
            strokeWidth: 3,
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1378FF)),
          ),
        ),
      ),
    );
  }
}
