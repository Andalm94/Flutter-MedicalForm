import 'package:flutter/material.dart';
import 'package:medic_app/components/custom_button_row.dart';
import 'package:medic_app/components/custom_popup.dart';
import 'package:medic_app/components/form_selector_panel.dart';
import 'package:medic_app/components/panels.dart';
import 'package:medic_app/core/form_antecedentes_medicamentos.dart';
import 'package:medic_app/core/form_informacion_paciente.dart';
import 'package:medic_app/core/form_motivo_llamada.dart';
import 'package:medic_app/core/form_ubicacion.dart';
import 'package:medic_app/core/patient.dart';
import 'package:medic_app/forms/formulario_antecedentes_medicamentos.dart';
import 'package:medic_app/forms/formulario_informacion_paciente.dart';
import 'package:medic_app/forms/formulario_motivo_llamada.dart';
import 'package:medic_app/forms/formulario_ubicacion.dart';
import 'package:medic_app/pages/data_page.dart';
import 'package:medic_app/pages/list_page.dart';

class FormPage extends StatefulWidget {
  final Patient paciente;
  const FormPage({super.key, required this.paciente});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {

  FormInformacionPaciente formInformacionPaciente = FormInformacionPaciente();
  FormUbicacion formUbicacion = FormUbicacion();
  FormMotivoLlamada formMotivoLlamada = FormMotivoLlamada();
  FormAntecedentesYMedicamentos formAntecedentesYMedicamentos = FormAntecedentesYMedicamentos();
  
  bool formInfoPacienteValidado = false;
  bool formUbicacionValidado = false;
  bool formMotivoLlamadaValidado = false;



  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          backButton(context);
          return true;
        },
        child: Container(
          color: Theme.of(context).colorScheme.background,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
          
              //PANEL INFO PACIENTE
              PrimaryPanel(
                height: 170,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    //Nombre
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [  
                          Text(
                            widget.paciente.name,
                            style: Theme.of(context).textTheme.titleLarge
                          )
                        ],
                      ),
                    ),
          
                    //Servicio
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('N° Servicio: ${widget.paciente.nroServicio}', style: Theme.of(context).textTheme.bodyLarge)
                        ],
                      ),
                    ),
          
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Los campos obligatorios estan marcados con una tilde.', style: Theme.of(context).textTheme.bodySmall),
                          Text('Completa el formulario con la informacion necesaria y luego presione el boton "Guardar".', style: Theme.of(context).textTheme.bodySmall)
                        ],
                      ),
                    )
          
                  ],
                )
              ),
          
          
          
              Expanded(
                child: SecondaryPanel(
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                  
                        //FORMULARIO INFO PACIENTE
                        GestureDetector(
                          onTap: () async {
                            final FormInformacionPaciente formInformacionPacienteCompletado = await Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => FormularioInfoPaciente(formInformacionPaciente: formInformacionPaciente),
                                transitionsBuilder: (context, animation, secondaryAnimation, child){
                                  return SlideTransition(
                                    position: Tween<Offset>(
                                      begin: const Offset(1.0, 0.0),
                                      end: Offset.zero,
                                    ).animate(animation),
                                    child: child,
                                  );
                                }
                              )
                            );
                            if(formInformacionPacienteCompletado.formularioValidado == true){
                              setState(() {
                                formInformacionPaciente = formInformacionPacienteCompletado;
                                formInfoPacienteValidado = true;
                  
                              });
                            }
                  
                          },
                          child: FormSelectorPanel(
                            formTitle: 'Informacion del paciente',
                            obligatorio: true, 
                            formularioValidado: formInfoPacienteValidado,
                          ),
                        ),
                  
                  
                        //FORMULARIO UBICACION
                        GestureDetector(
                          onTap: () async {
                            final FormUbicacion formUbicacionCompletado = await Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => FormularioUbicacion(paciente: widget.paciente, formUbicacion: formUbicacion),
                                transitionsBuilder: (context, animation, secondaryAnimation, child){
                                  return SlideTransition(
                                    position: Tween<Offset>(
                                      begin: const Offset(1.0, 0.0),
                                      end: Offset.zero,
                                    ).animate(animation),
                                    child: child,
                                  );
                                }
                              )
                            );
                            if(formUbicacionCompletado.formularioValidado == true){
                              setState(() {
                                formUbicacion = formUbicacionCompletado;
                                formUbicacionValidado = true;
                  
                              });
                            }
                  
                          },
                          child: FormSelectorPanel(
                            formTitle: 'Ubicacion',
                            obligatorio: true, 
                            formularioValidado: formUbicacionValidado,
                          ),
                        ),
                  
                  
                  
                  
                        //FORMULARIO MOTIVO DE LLAMADA
                        GestureDetector(
                          onTap: () async {
                            final FormMotivoLlamada formMotivoLlamadaCompletado = await Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => FormularioMotivoLlamada(formMotivoLlamada: formMotivoLlamada),
                                transitionsBuilder: (context, animation, secondaryAnimation, child){
                                  return SlideTransition(
                                    position: Tween<Offset>(
                                      begin: const Offset(1.0, 0.0),
                                      end: Offset.zero,
                                    ).animate(animation),
                                    child: child,
                                  );
                                }
                              )
                            );
                            if(formMotivoLlamadaCompletado.formularioValidado == true){
                              setState(() {
                                formMotivoLlamada = formMotivoLlamadaCompletado;
                                formMotivoLlamadaValidado = true;
                              });
                            }
                  
                          },
                          child: FormSelectorPanel(
                            formTitle: 'Motivo de llamada',
                            obligatorio: true, 
                            formularioValidado: formMotivoLlamadaValidado,
                          ),
                        ),
                  
                  
                        //FORMULARIO ANTECEDENTES Y MEDICAMENTOS
                        GestureDetector(
                          onTap: () async {
                            final FormAntecedentesYMedicamentos formAntecedentesYMedicamentosCompletado = await Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => FormularioAntecedentesYMedicamentos(formAntecedentesYMedicamentos: formAntecedentesYMedicamentos),
                                transitionsBuilder: (context, animation, secondaryAnimation, child){
                                  return SlideTransition(
                                    position: Tween<Offset>(
                                      begin: const Offset(1.0, 0.0),
                                      end: Offset.zero,
                                    ).animate(animation),
                                    child: child,
                                  );
                                }
                              )
                            );
                            if(formAntecedentesYMedicamentosCompletado.formularioValidado == true){
                              setState(() {
                                formAntecedentesYMedicamentos = formAntecedentesYMedicamentosCompletado;
                              });
                            }
                  
                          },
                          child: const FormSelectorPanel(
                            formTitle: 'Antecedentes y medicamentos',
                            obligatorio: false, 
                          ),
                        ),
                  
                  
                  
                  
                      ],
                    ),
                  )
                )
              ),
          
          
              
              //BOTONES:
              //[VOLVER] - [ENVIAR]
              CustomButtonRow(
                leftButtonText: 'Volver', 
                onLeftButtonPressed: (){
                  backButton(context);

                  //Navigator.pop(context);
                }, 
                rightButtonText: 'Enviar', 
                onRightButtonPressed: (){
                  if(formInfoPacienteValidado==false || formUbicacionValidado==false || formMotivoLlamadaValidado==false){
                    showDialog(
                      context: context, 
                      builder: (BuildContext context){
          
                        return const AlertDialog(
                          backgroundColor: Colors.transparent,
                          contentPadding: EdgeInsets.zero,
                          insetPadding: EdgeInsets.symmetric(horizontal: 60),
                          content: CustomPopUp(
                            titulo: 'Faltan campos',
                            descripcion: 'Completa todos los datos necesarios y luego vuelve a intentar.',
                            buttonText: 'De acuerdo',
                          )
                        );
                      }
          
                    );
                  }else{
                    showDialog(
                      context: context, 
                      builder: (BuildContext context){
          
                        return AlertDialog(
                          backgroundColor: Colors.transparent,
                          contentPadding: EdgeInsets.zero,
                          insetPadding: EdgeInsets.symmetric(horizontal: 60),
                          content: DataPage(
                            formAntecedentesYMedicamentos: formAntecedentesYMedicamentos, 
                            formInformacionPaciente: formInformacionPaciente, 
                            formMotivoLlamada: formMotivoLlamada, 
                            formUbicacion: formUbicacion, 
                            paciente: widget.paciente,
                          )
                        );
                      }
          
                    );
                  }
                }
              ),
          
            ],
          )
        ),
      ),
    );
  }
}

void backButton(var context){
  showDialog(
    context: context, 
    builder: (BuildContext context){

      return AlertDialog(
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.zero,
        insetPadding: const EdgeInsets.symmetric(horizontal: 50),
        content: CustomPopUp(
          width: 500,
          height: 300,
          titulo: 'Estas seguro?',
          descripcion: 'Perderas la informacion que no hayas enviado.',
          buttonText: 'Cancelar',
          doubleButton: true,
          buttonText2: "Salir",
          colorButton1: Colors.green,
          colorButton2: Colors.amber,
          actionButton2: (){
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => const ListPage(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(-1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                },
              ),
            );
          },

        )
      );
    }


  );
}