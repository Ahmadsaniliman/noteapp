
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  final String text;
  const CustomAppBar({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        const SizedBox(height: 25),
        const Icon(
          FontAwesomeIcons.lock,
          size: 100,
        ),
      ],
    );
  }
}
