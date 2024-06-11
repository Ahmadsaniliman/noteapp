import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GoogleButton extends StatelessWidget {
  final VoidCallback onTapped;
  const GoogleButton({
    super.key,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all()),
      child: IconButton(
        onPressed: onTapped,
        icon: const Icon(
          FontAwesomeIcons.google,
          color: Colors.black,
        ),
      ),
    );
  }
}
