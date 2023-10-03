import 'package:flutter/material.dart';

class ProductField extends StatelessWidget {
  ProductField({
    Key? key,
    required this.text,
    required this.onChanged,
  }) : super(key: key);
  String text;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: text,
          fillColor: Colors.white,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
