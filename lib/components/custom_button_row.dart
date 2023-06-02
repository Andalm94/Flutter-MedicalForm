import 'package:flutter/material.dart';
import 'package:medic_app/components/custom_button.dart';
import 'package:medic_app/components/panels.dart';

class CustomButtonRow extends StatelessWidget {
  final String leftButtonText;
  final String rightButtonText;
  final VoidCallback onLeftButtonPressed;
  final VoidCallback onRightButtonPressed;

  const CustomButtonRow({
    Key? key,
    required this.leftButtonText,
    required this.rightButtonText,
    required this.onLeftButtonPressed,
    required this.onRightButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SecondaryPanel(
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              flex: 1,
              child: CustomButton(
                color: Colors.amber,
                textColor: Colors.black,
                height: 50,
                width: 150,
                text: leftButtonText,
                onPressed: onLeftButtonPressed,
              ),
            ),
            Flexible(
              flex: 1,
              child: CustomButton(
                color: Colors.green.shade400,
                textColor: Colors.black,
                height: 50,
                width: 150,
                text: rightButtonText,
                onPressed: onRightButtonPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
