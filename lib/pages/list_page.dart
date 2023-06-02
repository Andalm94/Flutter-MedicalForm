import 'package:flutter/material.dart';
import 'package:medic_app/components/panels.dart';
import 'package:medic_app/components/patient_card.dart';
import 'package:medic_app/core/patient.dart';
import 'package:medic_app/pages/form_page.dart';

class ListPage extends StatefulWidget {
  final int? pacienteABorrar; //Utilizado solo para la version demo. Una vez que los pacientes se obtienen de la DB, borrar este campo
  const ListPage({super.key, this.pacienteABorrar});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Patient> listadoProvisorioDePacientes = [
    Patient('Juan Alvarez', false, 123456, 350),
    Patient('Pedro Martinez', true, 654321, 450),
    Patient('Jose Ferrario', false, 123654, 200),
  ];

  @override
  Widget build(BuildContext context) {


    //Funcion utilizada en demo. Borrar al conectar con DB SQL
    if(widget.pacienteABorrar != null){
      listadoProvisorioDePacientes = removePatientById(widget.pacienteABorrar!, listadoProvisorioDePacientes);
    }


    return SafeArea(
      child: WillPopScope(
        onWillPop: ()async{
          return false;
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            final maxWidth = constraints.maxWidth;
          
            return Container(
              color: Theme.of(context).colorScheme.background,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // PANEL DE USUARIO
                  PrimaryPanel(
                    height: 160,
                    width: maxWidth,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
          
                        // Nombre
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundImage: AssetImage("assets/images/medic_avatar2.jpg"),
                                  radius: 32,
                                ),
                              ),
                              Text(
                                'Hola Pablo!',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ],
                          ),
                        ),
          
                        // Cantidad de pacientes
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                'Tenes 3 pacientes pendientes',
                                style: Theme.of(context).textTheme.titleMedium,
                                softWrap: true,
                                textAlign: TextAlign.left,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          
                  // TARJETAS DE PACIENTES
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: listadoProvisorioDePacientes.length,
                          itemBuilder: ((context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation, secondaryAnimation) =>
                                        FormPage(paciente: listadoProvisorioDePacientes[index]),
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
                              },
                              child: PatientCard(paciente: listadoProvisorioDePacientes[index]),
                            );
                          }),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

//Funcion utilizada en demo. Borrar al conectar con DB SQL
List<Patient> removePatientById(int id, List<Patient> patientsList) {
  List<Patient> updatedList = [];
  for (var patient in patientsList) {
    print('SERVICIO: $id || PACIENTE: ${patient.nroServicio}');
    if (patient.nroServicio != id) {
      updatedList.add(patient);
    }
  }

  return updatedList;

}