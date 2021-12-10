import 'package:flutter/material.dart';

Widget MyAppBar() {
  return AppBar(
    title: Row(
      children: [
        Text(
          'Flutter News Apps',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
  );
}
