import 'package:flutter/material.dart';

class CustomDialogs {
  static Future<void> show(
    BuildContext context,
    String message, {
    String title = 'Atenção',
    String buttonText = 'OK',
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              buttonText,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
