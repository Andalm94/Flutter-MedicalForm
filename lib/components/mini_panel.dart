import 'package:flutter/material.dart';

class MiniPanel extends StatelessWidget {
  final bool traslado;
  const MiniPanel({super.key, required this.traslado});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 95,
      decoration: BoxDecoration(
        color: traslado ? Colors.blue : Colors.green,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Center(
        child: Text(
          traslado ? 'TRASLADO' : 'VISITA',
          style: Theme.of(context).textTheme.labelSmall
        ),
      ),
    );
  }
}