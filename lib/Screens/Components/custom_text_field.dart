import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final String hintText;
  const CustomTextField({
    super.key,
    required this.text,
    required this.hintText,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(),
          ),
          height: 50,
          width: double.infinity,
          child: TextField(
            
            controller: controller,
            decoration: InputDecoration(
              
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                hintText: hintText,
                border: InputBorder.none),
          ),
        ),
      ],
    );
  }
}
