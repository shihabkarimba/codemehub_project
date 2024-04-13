import 'package:flutter/material.dart';

import '../main.dart';

showSnackBar({required String msg}) {
  return ScaffoldMessenger.of(navigatorKey.currentContext!)
      .showSnackBar(SnackBar(
    content: Text(
      msg,
      style: const TextStyle(color: Colors.white),
    ),
  ));
}
