import 'package:flutter/material.dart';

class MyTextField1 extends StatelessWidget {
  final String label;
  final IconData icons;
  final ValueChanged<String> onchange;
  final String? Function(dynamic value) validators;
  const MyTextField1(
      {Key? key,
      required this.label,
      required this.icons,
      required this.onchange,
      required this.validators,
      }):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            onChanged: onchange,
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
            validator: validators,
          ),
        ),
      ],
    );
  }
}
