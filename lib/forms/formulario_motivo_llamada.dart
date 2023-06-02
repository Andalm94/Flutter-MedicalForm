import 'package:flutter/material.dart';
import 'package:medic_app/components/custom_button_row.dart';
import 'package:medic_app/components/custom_radio_button.dart';
import 'package:medic_app/components/panels.dart';
import 'package:medic_app/components/text_input_medium.dart';
import 'package:medic_app/core/form_motivo_llamada.dart';
import 'package:medic_app/forms/validaciones.dart';

class FormularioMotivoLlamada extends StatefulWidget {
  final FormMotivoLlamada formMotivoLlamada; 
  const FormularioMotivoLlamada({Key? key, required this.formMotivoLlamada}) : super(key: key);

  @override
  _FormularioMotivoLlamadaState createState() => _FormularioMotivoLlamadaState();
}

class _FormularioMotivoLlamadaState extends State<FormularioMotivoLlamada> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _motivoLlamadaController = TextEditingController();
  final TextEditingController _motivoConsultaController = TextEditingController();
  String? _codigoDeSalida;

  @override
  void dispose() {
    _motivoLlamadaController.dispose();
    _motivoConsultaController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _motivoLlamadaController.text = widget.formMotivoLlamada.motivoLlamada ?? '';
    _motivoConsultaController.text = widget.formMotivoLlamada.motivoConsulta ?? '';
    _codigoDeSalida = widget.formMotivoLlamada.codigoDeSalida ?? 'azul';
  }

  @override
  Widget build(BuildContext context) {



    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Theme.of(context).colorScheme.background,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
    
              Expanded(
                child: SecondaryPanel(
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          TextInputMedium(nombre: 'Motivo de llamada:', controller: _motivoLlamadaController, validator: validadorGenerico),
                          TextInputMedium(nombre: 'Motivo de consulta:', controller: _motivoConsultaController, validator: validadorGenerico),
                          
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Código de salida:',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          
                          CustomRadioButton(
                            nombre: 'Rojo',
                            value: _codigoDeSalida == 'rojo',
                            onChanged: (value) {
                              setState(() {
                                _codigoDeSalida = !value! ? 'rojo' : null;
                              });
                            },
                          ),
                          CustomRadioButton(
                            nombre: 'Amarillo',
                            value: _codigoDeSalida == 'amarillo',
                            onChanged: (value) {
                              setState(() {
                                _codigoDeSalida = !value! ? 'amarillo' : null;
                              });
                            },
                          ),
                          CustomRadioButton(
                            nombre: 'Verde',
                            value: _codigoDeSalida == 'verde',
                            onChanged: (value) {
                              setState(() {
                                _codigoDeSalida = !value! ? 'verde' : null;
                              });
                            },
                          ),
                          CustomRadioButton(
                            nombre: 'Azul',
                            value: _codigoDeSalida == 'azul',
                            onChanged: (value) {
                              setState(() {
                                _codigoDeSalida = !value! ? 'azul' : null;
                              });
                            },
                          ),
    
                        ],
                      ),
                    ),
                  ),
                ),
              ),
    
    
              CustomButtonRow(
                leftButtonText: 'Volver', 
                onLeftButtonPressed: () { 
                  Navigator.pop(context, widget.formMotivoLlamada);
                },
                
                rightButtonText: 'Guardar' , 
                onRightButtonPressed: (){
                  if(_formKey.currentState!.validate()){
    
                    widget.formMotivoLlamada.codigoDeSalida = _codigoDeSalida;
                    widget.formMotivoLlamada.motivoConsulta = _motivoConsultaController.text;
                    widget.formMotivoLlamada.motivoLlamada = _motivoLlamadaController.text;
                    widget.formMotivoLlamada.formularioValidado = true;
                    Navigator.pop(context, widget.formMotivoLlamada);
                  }
                },
              ),
    
    
            ],
          ),
        ),
      ),
    );
  }
}
