import 'package:flutter/material.dart';
import 'package:medic_app/components/custom_button_row.dart';
import 'package:medic_app/components/custom_checkbox.dart';
import 'package:medic_app/components/panels.dart';
import 'package:medic_app/components/text_input_medium.dart';
import 'package:medic_app/core/form_antecedentes_medicamentos.dart';
import 'package:medic_app/forms/validaciones.dart';

class FormularioAntecedentesYMedicamentos extends StatefulWidget {
  final FormAntecedentesYMedicamentos formAntecedentesYMedicamentos;

  const FormularioAntecedentesYMedicamentos({
    Key? key,
    required this.formAntecedentesYMedicamentos,
  }) : super(key: key);

  @override
  _FormularioAntecedentesYMedicamentosState createState() =>
      _FormularioAntecedentesYMedicamentosState();
}

class _FormularioAntecedentesYMedicamentosState
    extends State<FormularioAntecedentesYMedicamentos> {
  final _formKey = GlobalKey<FormState>();

  void setFieldsFalse(){
    widget.formAntecedentesYMedicamentos.diabetesI =false;
    widget.formAntecedentesYMedicamentos.diabetesII = false;
    widget.formAntecedentesYMedicamentos.asma = false;
    widget.formAntecedentesYMedicamentos.cardiopatia = false;
    widget.formAntecedentesYMedicamentos.convulsion = false;
    widget.formAntecedentesYMedicamentos.hta = false;
    widget.formAntecedentesYMedicamentos.epoc = false;
    widget.formAntecedentesYMedicamentos.acv = false;
  }

  void setSinAntecedentesFalse(){
    widget.formAntecedentesYMedicamentos.noPoseeAntecedentes = false;
    widget.formAntecedentesYMedicamentos.seDesconocenAntecedentes = false;
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
    
    
    
                          Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: CustomCheckbox(
                                  nombre: 'No posee antecedentes',
                                  value: widget.formAntecedentesYMedicamentos.noPoseeAntecedentes ?? false,
                                  onChanged: (value) {
                                    setState(() {
                                      widget.formAntecedentesYMedicamentos.noPoseeAntecedentes = value;
                                      if (value!) {
                                        widget.formAntecedentesYMedicamentos.seDesconocenAntecedentes = false;
                                        setFieldsFalse();
                                      }
                                    });
                                  },
                                ),
                              ),
    
                              Flexible(
                                flex: 1,
                                child: CustomCheckbox(
                                  nombre: 'Se desconocen antecedentes',
                                  value: widget.formAntecedentesYMedicamentos.seDesconocenAntecedentes ?? false,
                                  onChanged: (value) {
                                    setState(() {
                                      widget.formAntecedentesYMedicamentos.seDesconocenAntecedentes = value;
                                      if (value!) {
                                        widget.formAntecedentesYMedicamentos.noPoseeAntecedentes = false;
                                        setFieldsFalse();
                                      }
                                    });
                                  },
                                ),
                              ),
    
                            ],
                          ),
    
                          Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: CustomCheckbox(
                                  nombre: 'Diabetes tipo I',
                                  value: widget.formAntecedentesYMedicamentos.diabetesI ?? false,
                                  onChanged: (value) {
                                    setState(() {
                                      widget.formAntecedentesYMedicamentos.diabetesI = value;
                                      if (value!) {
                                        setSinAntecedentesFalse();
                                      }
                                    });
                                  },
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: CustomCheckbox(
                                  nombre: 'Diabetes tipo II',
                                  value: widget.formAntecedentesYMedicamentos.diabetesII ?? false,
                                  onChanged: (value) {
                                    setState(() {
                                      widget.formAntecedentesYMedicamentos.diabetesII = value;
                                      if (value!) {
                                        setSinAntecedentesFalse();
                                      }
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
    
                          Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: CustomCheckbox(
                                  nombre: 'Asma',
                                  value: widget.formAntecedentesYMedicamentos.asma ?? false,
                                  onChanged: (value) {
                                    setState(() {
                                      widget.formAntecedentesYMedicamentos.asma = value;
                                      if (value!) {
                                        setSinAntecedentesFalse();
                                      }
                                    });
                                  },
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: CustomCheckbox(
                                  nombre: 'Cardiopatía',
                                  value: widget.formAntecedentesYMedicamentos.cardiopatia ?? false,
                                  onChanged: (value) {
                                    setState(() {
                                      widget.formAntecedentesYMedicamentos.cardiopatia = value;
                                      if (value!) {
                                        setSinAntecedentesFalse();
                                      }
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
    
    
                          Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: CustomCheckbox(
                                  nombre: 'Convulsión',
                                  value: widget.formAntecedentesYMedicamentos.convulsion ?? false,
                                  onChanged: (value) {
                                    widget.formAntecedentesYMedicamentos.convulsion = value;
                                    setState(() {
                                      setSinAntecedentesFalse();
                                    });
                                  },
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: CustomCheckbox(
                                  nombre: 'HTA',
                                  value: widget.formAntecedentesYMedicamentos.hta ?? false,
                                  onChanged: (value) {
                                    widget.formAntecedentesYMedicamentos.hta = value;
                                    setState(() {
                                      setSinAntecedentesFalse();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
    
    
                          Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: CustomCheckbox(
                                  nombre: 'EPOC',
                                  value: widget.formAntecedentesYMedicamentos.epoc ??false,
                                  onChanged: (value) {
                                    widget.formAntecedentesYMedicamentos.epoc = value;
                                    setState(() {
                                      setSinAntecedentesFalse();
                                    });
                                  },
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: CustomCheckbox(
                                  nombre: 'ACV',
                                  value: widget.formAntecedentesYMedicamentos.acv ?? false,
                                  onChanged: (value) {
                                    widget.formAntecedentesYMedicamentos.acv = value;
                                    setState(() {
                                      setSinAntecedentesFalse();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          TextInputMedium(
                            nombre: 'Alergias',
                            controller: TextEditingController(
                                text: widget.formAntecedentesYMedicamentos.alergias),
                            validator: validadorGenericoNoObligatorio,
                          ),
                          TextInputMedium(
                            nombre: 'Medicamentos',
                            controller: TextEditingController(
                                text: widget.formAntecedentesYMedicamentos.medicamentos),
                            validator: validadorGenericoNoObligatorio,
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
                  Navigator.pop(context, widget.formAntecedentesYMedicamentos);
                },
                rightButtonText: 'Guardar',
                onRightButtonPressed: () {
                  if (_formKey.currentState!.validate()) {
                    widget.formAntecedentesYMedicamentos.formularioValidado = true;
                    Navigator.pop(context, widget.formAntecedentesYMedicamentos);
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
