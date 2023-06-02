import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final Color? color;
  final Color? textColor;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.width,
    required this.height,
    required this.text,
    required this.onPressed, 
    this.color, 
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Color buttonColor = color ?? Colors.transparent;
    Color txtColor = textColor ?? Colors.black;

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
          foregroundColor: MaterialStateProperty.all<Color>(txtColor),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 16,
            fontWeight: FontWeight.w700   
          ),
        ),
      ),
    );
  }
}