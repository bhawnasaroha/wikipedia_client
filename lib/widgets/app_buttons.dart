import 'package:flutter/material.dart';

class AppButtons {
  static Widget primaryButton(
      {required Function onPressed, required String buttonText}) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      child: Text(
        buttonText,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          const StadiumBorder(),
        ),
      ),
    );
  }
}
