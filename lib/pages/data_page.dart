import 'package:flutter/material.dart';
import 'package:medic_app/components/custom_button.dart';
import 'package:medic_app/components/panels.dart';
import 'package:medic_app/core/form_antecedentes_medicamentos.dart';
import 'package:medic_app/core/form_informacion_paciente.dart';
import 'package:medic_app/core/form_motivo_llamada.dart';
import 'package:medic_app/core/form_ubicacion.dart';
import 'package:medic_app/core/patient.dart';
import 'package:medic_app/pages/list_page.dart';

class DataPage extends StatelessWidget {
  final Patient paciente;
  final FormUbicacion formUbicacion;
  final FormAntecedentesYMedicamentos formAntecedentesYMedicamentos;
  final FormMotivoLlamada formMotivoLlamada;
  final FormInformacionPaciente formInformacionPaciente;
  const DataPage({super.key, required this.paciente, required this.formUbicacion, required this.formAntecedentesYMedicamentos, required this.formMotivoLlamada, required this.formInformacionPaciente});

  @override
  Widget build(BuildContext context) {

    formAntecedentesYMedicamentos.noPoseeAntecedentes ?? false;
    formAntecedentesYMedicamentos.asma ?? false;
    formAntecedentesYMedicamentos.acv ?? false;
    formAntecedentesYMedicamentos.cardiopatia ?? false;
    formAntecedentesYMedicamentos.convulsion ?? false;
    formAntecedentesYMedicamentos.diabetesI ?? false;
    formAntecedentesYMedicamentos.diabetesII ?? false;
    formAntecedentesYMedicamentos.epoc ?? false;
    formAntecedentesYMedicamentos.hta ?? false;
    formAntecedentesYMedicamentos.alergias ?? false;
    formAntecedentesYMedicamentos.medicamentos ?? false;

    return SecondaryPanel(
      height: 400,
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text("Formulario Enviado!" ,style: Theme.of(context).textTheme.titleMedium),
          ),
      
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Informacion del Paciente:', style: Theme.of(context).textTheme.bodyLarge),
      
                Text('Nombre: ${formInformacionPaciente.apellidoYNombre}', style: Theme.of(context).textTheme.bodySmall),
                Text('Edad: ${formInformacionPaciente.edad}', style: Theme.of(context).textTheme.bodySmall),
                Text('Sexo: ${formInformacionPaciente.sexo}' , style: Theme.of(context).textTheme.bodySmall),
                Text('Documento: ${formInformacionPaciente.tipoDocumento} ${formInformacionPaciente.numeroDocumento}', style: Theme.of(context).textTheme.bodySmall),
                Text('Nacionalidad: ${formInformacionPaciente.nacionalidad}' , style: Theme.of(context).textTheme.bodySmall),
      
                const SizedBox(height: 20,),

                Text('Motivo de llamada:', style: Theme.of(context).textTheme.bodyLarge),
      
                Text('Codigo de salida: ${formMotivoLlamada.codigoDeSalida}', style: Theme.of(context).textTheme.bodySmall),
                Text('${formMotivoLlamada.motivoLlamada}', style: Theme.of(context).textTheme.bodySmall),
                Text('${formMotivoLlamada.motivoConsulta}', style: Theme.of(context).textTheme.bodySmall),

                const SizedBox(height: 20,),

                Text('Antecedentes y medicamentos:', style: Theme.of(context).textTheme.bodyLarge),
                
                formAntecedentesYMedicamentos.noPoseeAntecedentes! ? Text('No posee antecedentes', style: Theme.of(context).textTheme.bodySmall) :
                formAntecedentesYMedicamentos.seDesconocenAntecedentes! ? Text('Se desconocen antecedentes', style: Theme.of(context).textTheme.bodySmall) :
                Column(
                  children: [
                    formAntecedentesYMedicamentos.asma! ? Text('ASMA', style: Theme.of(context).textTheme.bodySmall) : const SizedBox(),
                    formAntecedentesYMedicamentos.acv! ? Text('ACV', style: Theme.of(context).textTheme.bodySmall) : const SizedBox(),
                    formAntecedentesYMedicamentos.cardiopatia! ? Text('CARDIOPATIAS', style: Theme.of(context).textTheme.bodySmall) : const SizedBox(),
                    formAntecedentesYMedicamentos.convulsion! ? Text('CONVULSION', style: Theme.of(context).textTheme.bodySmall) : const SizedBox(),
                    formAntecedentesYMedicamentos.diabetesI! ? Text('DIABETES I', style: Theme.of(context).textTheme.bodySmall) : const SizedBox(),
                    formAntecedentesYMedicamentos.diabetesII! ? Text('DIABETES II', style: Theme.of(context).textTheme.bodySmall) : const SizedBox(),
                    formAntecedentesYMedicamentos.epoc! ? Text('EPOC', style: Theme.of(context).textTheme.bodySmall) : const SizedBox(),
                    formAntecedentesYMedicamentos.hta! ? Text('HTA', style: Theme.of(context).textTheme.bodySmall) : const SizedBox(),
                  ],
                ),
                formAntecedentesYMedicamentos.alergias != '' ? Text('Alergias: ${formAntecedentesYMedicamentos.alergias ?? 'No posee'} ', style: Theme.of(context).textTheme.bodySmall) : Text('Alergias: Sin alergias', style: Theme.of(context).textTheme.bodySmall),
                formAntecedentesYMedicamentos.medicamentos != '' ? Text('Medicamentos: ${formAntecedentesYMedicamentos.alergias ?? 'No posee'}', style: Theme.of(context).textTheme.bodySmall) : Text('Alergias: Sin medicamentos', style: Theme.of(context).textTheme.bodySmall),
              ],
            )
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
              width: 100, 
              height: 40, 
              color: Colors.blue,
              text: 'Volver', 
              onPressed: (){
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => ListPage(pacienteABorrar: paciente.nroServicio),
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
              }
            ),
          )
        ],
      )
    );
  }
}