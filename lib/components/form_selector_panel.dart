import 'package:flutter/material.dart';
import 'package:medic_app/components/panels.dart';

class FormSelectorPanel extends StatefulWidget {
  final String formTitle;
  final bool obligatorio;
  final bool? formularioValidado;
  const FormSelectorPanel({super.key, required this.formTitle, required this.obligatorio, this.formularioValidado});

  @override
  State<FormSelectorPanel> createState() => _FormSelectorPanelState();
}

class _FormSelectorPanelState extends State<FormSelectorPanel> {
  late bool completed;
  @override
  Widget build(BuildContext context) {
    return PrimaryCard(
      height: 70,
      width: 350,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          //TITULO DEL FORMULARIO
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.formTitle, style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),

          widget.obligatorio ? 
          Padding(
            padding: const EdgeInsets.only(right: 32.0),
            child: Icon(Icons.add_task_sharp, color: widget.formularioValidado! ? Colors.green : Colors.grey, size: 48),
          ) : const SizedBox(),
        ],
      ),
    );
  }
}