import 'package:flutter/material.dart';
import 'package:medic_app/components/custom_button.dart';
import 'package:medic_app/components/custom_button_row.dart';
import 'package:medic_app/components/panels.dart';

class CustomPopUp extends StatelessWidget {

  final double? width;
  final double? height;

  final String? titulo;
  final String? descripcion;
  final String? buttonText;
  
  final bool? doubleButton;
  final String? buttonText2;
  final VoidCallback? actionButton2;
  final Color? colorButton1;
  final Color? colorButton2;
  const CustomPopUp({super.key, this.titulo, this.descripcion, this.buttonText, this.doubleButton, this.buttonText2, this.actionButton2, this.colorButton1, this.colorButton2, this.width, this.height});

  @override
  Widget build(BuildContext context) {

    bool has2buttons = doubleButton ?? false;

    return SecondaryPanel(
      width: width ?? 150,
      height: height?? 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Center(child: Text(titulo ?? '', style: Theme.of(context).textTheme.titleMedium)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Center(child: Text(descripcion ?? '', style: Theme.of(context).textTheme.bodyLarge)),
                ),

              ],
            )
          ),

          has2buttons ?
          CustomButtonRow(
            leftButtonText: buttonText ?? '', 
            onLeftButtonPressed: () { 
              Navigator.pop(context);
            },

            rightButtonText: buttonText2 ?? '' , 
            onRightButtonPressed: actionButton2!
          )
          :
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
              width: 150, 
              height: 50,
              color: Colors.blue, 
              text: buttonText ?? '', 
              onPressed: (){Navigator.of(context).pop();}
            ),
          )
        ],
      )
    );
  }
}