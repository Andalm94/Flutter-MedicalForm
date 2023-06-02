import 'package:flutter/material.dart';

class CustomDropdownFormField<T> extends StatelessWidget {
  final String nombre;
  final String? labelText;
  final List<T> options;
  final T? value;
  final void Function(dynamic)? onChanged;
  final String? Function(T?)? validator;

  const CustomDropdownFormField({
    Key? key,
    this.labelText,
    required this.options,
    required this.value,
    required this.onChanged,
    this.validator, required this.nombre,
  }) : super(key: key);

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
          padding: const EdgeInsets.all(8.0),
          child: DropdownButtonFormField<T>(
            value: value,
            items: options.map((T option) {
              return DropdownMenuItem<T>(
                value: option,
                child: Text(option.toString()),
              );
            }).toList(),
            onChanged: onChanged as void Function(dynamic)?,
            decoration: InputDecoration(
              labelText: labelText,
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
            ),
            validator: validator,
          ),
        ),
      ],
    );
  }
}
