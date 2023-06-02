import 'package:flutter/material.dart';

var lightTheme = ThemeData(

  colorScheme: ColorScheme(
    primary: Colors.grey,
    background: Colors.grey.shade300,
    onBackground: Colors.black,
    onPrimary: Colors.black,
    brightness: Brightness.light, 
    error: Colors.red, 
    onError: Colors.black, 
    onSecondary: Colors.white, 
    secondary: Colors.grey.shade200, 
    surface: Colors.blueGrey.shade200,
    onSurface: Colors.black, 
  ),

  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontFamily: 'Quicksand',
      fontSize: 32,
      fontWeight: FontWeight.bold
    ),
    titleMedium: TextStyle(
      fontFamily: 'Quicksand',
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Quicksand',
      fontSize: 16,
      fontWeight: FontWeight.w600    
    ),
    bodySmall: TextStyle(
      color: Colors.black,
      fontFamily: 'Quicksand',
      fontSize: 12,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w500,
    ),
    labelSmall:  TextStyle(
        color: Colors.white,
        fontFamily: 'Quicksand',
        fontSize: 10,
        fontWeight: FontWeight.w800
    ),
  )
);
