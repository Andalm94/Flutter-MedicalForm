import 'package:flutter/material.dart';
import 'package:medic_app/components/custom_button.dart';
import 'package:medic_app/components/custom_popup.dart';
import 'package:medic_app/components/panels.dart';
import 'package:medic_app/pages/list_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          color: Theme.of(context).colorScheme.background,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Text(MediaQuery.of(context).size.width.toString(), style: Theme.of(context).textTheme.bodyLarge),
    
              SecondaryPanel(
                height: 400,
                width: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  
                  children:[
    
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(100)
                      ),
                      child: Image.asset('assets/images/med_logo.png', fit: BoxFit.fill)
                    ),
    
    
    
    
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: usernameController,
                        decoration: const InputDecoration(
                          labelText: 'Usuario',
                        ),
                      ),
                    ),
    
                    SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                          labelText: 'Contraseña',
                        ),
                        obscureText: true,
                      ),
                    ),
    
                  ]
    
                )
              ),
    
    
    
              const SizedBox(height: 32.0),
    
              CustomButton(
                color: Colors.green,
                width: 250, 
                height: 50, 
                text: 'Ingresar', 
                onPressed: (){
    
                  if(usernameController.text == 'Pablo' && passwordController.text == 'pass123'){
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => const ListPage(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(1.0, 0.0),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          );
                        },
                      ),
                    );
                  }else{
                    showDialog(
                      context: context, 
                      builder: (BuildContext context){
    
                        return const AlertDialog(
                          backgroundColor: Colors.transparent,
                          contentPadding: EdgeInsets.zero,
                          insetPadding: EdgeInsets.symmetric(horizontal: 30),
                          content: CustomPopUp(
                            titulo: 'Ooops',
                            descripcion: 'Usuario o contraseña incorrectos',
                            buttonText: 'Volver',
                            colorButton1: Colors.blue,
                          )
                        );
                      }
                    );
                  }
    
                }
              )
    
            ],
          ),
        ),
      ),
    );
  }
}
