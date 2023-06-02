import 'package:flutter/material.dart';

class TextInputMedium extends StatelessWidget {
  final String nombre;
  final String? hint;
  final TextEditingController controller;
  final Icon? icon;
  final String? Function(String?)? validator;

  const TextInputMedium({super.key, required this.nombre, this.hint, required this.controller, this.icon, this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8),
          child: Row(
            children: [
              Text(nombre, style: Theme.of(context).textTheme.titleMedium)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextFormField(
            decoration: InputDecoration(
              //labelText: 'Ingrese su nombre',
              hintText: hint,
              prefixIcon: icon,
              border: const OutlineInputBorder(),
              focusColor: Colors.green
            ),
            controller: controller,
            validator: validator,
          ),
        )
      ],
    );
  }
}