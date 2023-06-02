import 'package:flutter/material.dart';

class CustomRadioButton extends StatefulWidget {
  final String nombre;
  final bool value;
  final ValueChanged<bool?>? onChanged;

  const CustomRadioButton({
    Key? key,
    required this.nombre,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomRadioButtonState createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Radio<bool>(
            value: widget.value,
            groupValue: true,
            onChanged: widget.onChanged,
            activeColor: Colors.blue,
            //overlayColor: MaterialStateProperty.all<Color>(Colors.black),
          ),
          Text(widget.nombre),
        ],
      ),
    );
  }
}
