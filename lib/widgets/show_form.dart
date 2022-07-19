// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ShowForm extends StatelessWidget {
  final String hint;
  final IconData iconData;
  final Function(String) changeFunc;
  const ShowForm({
    Key? key,
    required this.hint,
    required this.iconData,
    required this.changeFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: 250,
      child: TextFormField(
        onChanged: changeFunc,
        decoration: InputDecoration(
          suffixIcon: Icon(iconData),
          hintText: hint,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
