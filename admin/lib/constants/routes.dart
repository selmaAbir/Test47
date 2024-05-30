import 'package:flutter/material.dart';

class Routes {
  static final Routes instance = Routes._internal();

  Routes._internal();

  void push({required Widget widget, required BuildContext context}) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
  }
}