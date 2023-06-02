import 'package:flutter/material.dart';
import 'package:medic_app/components/mini_panel.dart';
import 'package:medic_app/components/panels.dart';
import 'package:medic_app/core/patient.dart';

class PatientCard extends StatelessWidget {
  final Patient paciente;

  const PatientCard({Key? key, required this.paciente}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        final isSmallScreen = maxWidth < 380;

        return SecondaryPanel(
          height: 100,
          width: maxWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // NOMBRE Y NRO DE SERVICIO
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        paciente.name,
                        style: Theme.of(context).textTheme.titleMedium,
                        softWrap: true,
                        textAlign: TextAlign.left,
                        maxLines: isSmallScreen ? 2 : 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'N° Servicio: ${paciente.nroServicio}',
                        style: Theme.of(context).textTheme.bodyLarge,
                        softWrap: true,
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),

              // TIPO DE SERVICIO
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Container(
                  width: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: MiniPanel(traslado: paciente.traslado),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: isSmallScreen ? 80 : 110,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('A cobrar:', style: Theme.of(context).textTheme.titleMedium),
                      Text('\$ ${paciente.aCobrar}', style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
