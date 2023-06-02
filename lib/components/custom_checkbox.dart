import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final String nombre;
  final bool value;
  final ValueChanged<bool?>? onChanged;

  const CustomCheckbox({
    Key? key,
    required this.nombre,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Checkbox(
            value: widget.value,
            onChanged: widget.onChanged,
            activeColor: Colors.blue,
          ),
          Flexible(child: Text(widget.nombre, softWrap: true)),
        ],
      ),
    );
  }
}
