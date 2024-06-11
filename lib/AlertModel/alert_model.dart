import 'package:flutter/material.dart';

Future<void> showAlertDialog({
  required BuildContext context,
  required String text,
  required String description,
  required String buttonText1,
  required String buttonText2,
  VoidCallback? onTapped,
  VoidCallback? onTapped1,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        content: Text(
          description,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        actions: [
          TextButton(
            onPressed: onTapped,
            child: Text(
              buttonText1,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          TextButton(
            onPressed: onTapped1,
            child: Text(
              buttonText2,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
        ],
      );
    },
  );
}
