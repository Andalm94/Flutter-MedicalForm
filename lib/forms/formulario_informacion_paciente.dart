import 'package:flutter/material.dart';
import 'package:medic_app/components/custom_button_row.dart';
import 'package:medic_app/components/custom_dropdown.dart';
import 'package:medic_app/components/custom_radio_button.dart';
import 'package:medic_app/components/panels.dart';
import 'package:medic_app/components/text_input_medium.dart';
import 'package:medic_app/core/form_informacion_paciente.dart';
import 'package:medic_app/forms/validaciones.dart';

class FormularioInfoPaciente extends StatefulWidget {
  final FormInformacionPaciente formInformacionPaciente;
  const FormularioInfoPaciente({Key? key, required this.formInformacionPaciente}) : super(key: key);

  @override
  _FormularioInfoPacienteState createState() => _FormularioInfoPacienteState();
}

class _FormularioInfoPacienteState extends State<FormularioInfoPaciente> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _apellidoYNombre = TextEditingController();
  final TextEditingController _edad = TextEditingController();
  final TextEditingController _socio = TextEditingController();
  final TextEditingController _ospp = TextEditingController();
  String? _sexo;
  String? _tipoDNI;
  final TextEditingController _numeroDNI = TextEditingController();
  final TextEditingController _nacionalidad = TextEditingController();




  @override
  void initState() {
    super.initState();
    _apellidoYNombre.text = widget.formInformacionPaciente.apellidoYNombre ?? '';
    _edad.text = widget.formInformacionPaciente.edad ?? ''; 
    _socio.text = widget.formInformacionPaciente.socio ?? '';
    _ospp.text = widget.formInformacionPaciente.ospp ?? '';
    _sexo = widget.formInformacionPaciente.sexo ?? 'M';
    _tipoDNI = widget.formInformacionPaciente.tipoDocumento ?? 'DNI';
    _numeroDNI.text = widget.formInformacionPaciente.numeroDocumento ?? '';
    _nacionalidad.text = widget.formInformacionPaciente.nacionalidad ?? '';
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
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          
                          
                              Row(
                                children: [
                                  Flexible(
                                    flex: 4,
                                    child: TextInputMedium(
                                      nombre: 'Apellido y nombre',
                                      controller: _apellidoYNombre,
                                      validator: validarNombreApellido,
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: TextInputMedium(
                                      nombre: 'Edad',
                                      controller: _edad,
                                      validator: validarSoloNumeros,
                                    ),
                                  ),
                          
                                ],
                              ),
                          
                          
                              Row(
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: TextInputMedium(
                                      nombre: 'Socio',
                                      controller: _socio,
                                      validator: validarSoloNumeros,
                                    ),
                                  ),
                          
                                  Flexible(
                                    flex: 1,
                                    child: TextInputMedium(
                                      nombre: 'O.S.P.P',
                                      controller: _ospp,
                                      validator: validarSoloNumerosNoObligatorio,
                                    ),
                                  ),
                          
                                ],
                              ),
                          
                          
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Sexo:', style: Theme.of(context).textTheme.titleMedium),
                                  ),
                                
                                  CustomRadioButton(
                                    nombre: 'M',
                                    value: _sexo == 'M',
                                    onChanged: (value) {
                                      setState(() {
                                        _sexo = !value! ? 'M' : null;
                                      });
                                    },
                                  ),
                          
                                  CustomRadioButton(
                                    nombre: 'F',
                                    value: _sexo == 'F',
                                    onChanged: (value) {
                                      setState(() {
                                        _sexo = !value! ? 'F' : null;
                                      });
                                    },
                                  ),
                          
                                ],
                              ),
                          
                          
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Documento:', style: Theme.of(context).textTheme.titleMedium),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                   
                                      Container(
                                        width: 120,
                                        child: CustomDropdownFormField<String>(
                                          nombre: 'Tipo',
                                          //labelText: 'DNI',
                                          options: const ['DNI', 'LE', 'LC'],
                                          value: _tipoDNI,
                                          onChanged: (value) {
                                            setState(() {
                                              _tipoDNI = value;
                                            });
                                          },
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'Por favor, selecciona una opción';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                          
                                      Flexible(
                                        flex: 3,
                                        child: TextInputMedium(
                                          nombre: 'Número',
                                          controller: _numeroDNI,
                                          validator: validarSoloNumeros,
                                        ),
                                      ),
                          
                                    ],
                                  ),
                                ],
                              ),
                          
                          
                          
                              TextInputMedium(
                                nombre: 'Nacionalidad',
                                controller: _nacionalidad,
                                validator: validarNombreApellido,
                              ),
                            ],
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
                  Navigator.pop(context, widget.formInformacionPaciente);
                },
                rightButtonText: 'Guardar',
                onRightButtonPressed: () {
                  if(_formKey.currentState!.validate()){
    
                    final formInformacionPacienteAuxiliar = widget.formInformacionPaciente;
    
                    formInformacionPacienteAuxiliar.apellidoYNombre = _apellidoYNombre.text;
                    formInformacionPacienteAuxiliar.edad = _edad.text;
                    formInformacionPacienteAuxiliar.socio = _socio.text;
                    formInformacionPacienteAuxiliar.ospp = _ospp.text;
                    formInformacionPacienteAuxiliar.sexo = _sexo;
                    formInformacionPacienteAuxiliar.tipoDocumento = _tipoDNI;
                    formInformacionPacienteAuxiliar.numeroDocumento = _numeroDNI.text;
                    formInformacionPacienteAuxiliar.nacionalidad = _nacionalidad.text;
                    formInformacionPacienteAuxiliar.formularioValidado = true;
                    
                    Navigator.pop(context, formInformacionPacienteAuxiliar);
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
