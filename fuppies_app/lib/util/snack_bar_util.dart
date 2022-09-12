import 'package:flutter/material.dart';

class SnackBarUtil {
  static showSuccess(BuildContext context, String message) {
    _hideSnackBarThen(context).showSnackBar(
      SnackBar(backgroundColor: Colors.green.shade800, content: Text(message)),
    );
  }

  static showInfo(BuildContext context, String message) {
    _hideSnackBarThen(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  static showError(BuildContext context, String message) {
    _hideSnackBarThen(context).showSnackBar(
      SnackBar(backgroundColor: Colors.red.shade900, content: Text(message)),
    );
  }

  static ScaffoldMessengerState _hideSnackBarThen(BuildContext context) {
    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();

    return messenger;
  }
}
