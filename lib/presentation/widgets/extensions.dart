import 'package:flutter/material.dart';

extension ScaffoldMessengerStateUTiles on ScaffoldMessengerState {
  void toast(String message) {
    showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
    ));
  }
}
