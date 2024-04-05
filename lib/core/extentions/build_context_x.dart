import 'package:flutter/material.dart';

extension BuildContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
  BuildContext get rootContext =>
      Navigator.of(this, rootNavigator: true).context;
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;
  void showSnackBarMsg({required String msg}) {
    ScaffoldMessenger.of(this)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text(msg),
        ),
      );
  }
}
