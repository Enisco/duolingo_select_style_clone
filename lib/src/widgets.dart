import 'package:flutter/material.dart';

TextEditingController scienceController = TextEditingController();
TextEditingController theController = TextEditingController();

TextStyle textStyle = const TextStyle(
  color: Colors.white,
  fontSize: 14,
  fontWeight: FontWeight.w600,
);

Widget customspacer() {
  return const SizedBox(
    width: 15,
  );
}

Widget customContainer(Widget child) {
  return Container(
    width: 80,
    height: 30,
    decoration: BoxDecoration(
        color: Colors.green[900]?.withOpacity(0.5),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        border: Border.all(color: Colors.white54)),
    child: Center(child: child),
  );
}
