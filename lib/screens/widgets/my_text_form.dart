import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String label;
  final IconData icons;
  final TextEditingController onchange;
  const MyTextField(
      {super.key,
      required this.label,
      required this.icons,
      required this.onchange});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: onchange,
            decoration: InputDecoration(
              hintText: label,
              prefixIcon: Icon(icons),
              filled: true,
              fillColor: Color(0x8cb4dee8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(
                  width: 0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
