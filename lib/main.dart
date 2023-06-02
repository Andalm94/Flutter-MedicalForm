import 'package:flutter/material.dart';
import 'package:medic_app/components/styles.dart';
import 'package:medic_app/pages/login_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          body: LoginPage()
        ),
      ),
    );
  }
}


//Text(MediaQuery.of(context).size.width.toString(), style: Theme.of(context).textTheme.bodyLarge),


