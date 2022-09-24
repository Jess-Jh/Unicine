import 'package:flutter/animation.dart';
import 'package:flutter_meedu/meedu.dart';

class SideMenuController extends SimpleNotifier {
  static late AnimationController menuController;
  static bool isOpen = false;

  String _currentPage = '';

  String get currentPage => _currentPage;

  void setCurrentPageUrl(String routeName) {
    _currentPage = routeName;
    Future.delayed(const Duration(milliseconds: 100), () => notify());
  }

  static Animation<double> movement = Tween<double>(begin: -200, end: 0)
      .animate(
          CurvedAnimation(parent: menuController, curve: Curves.easeInOut));

  static Animation<double> opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: menuController, curve: Curves.easeInOut));

  static void openMenu() {
    isOpen = true;
    menuController.forward();
  }

  static void closeMenu() {
    isOpen = false;
    menuController.reverse();
  }

  static void toggleMenu() {
    (isOpen) ? menuController.reverse() : menuController.forward();

    isOpen = !isOpen;
  }
}
