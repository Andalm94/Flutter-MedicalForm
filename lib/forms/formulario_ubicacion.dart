import 'package:flutter/material.dart';
import 'package:medic_app/components/custom_button_row.dart';
import 'package:medic_app/components/panels.dart';
import 'package:medic_app/components/text_input_medium.dart';
import 'package:medic_app/core/form_ubicacion.dart';
import 'package:medic_app/core/patient.dart';
import 'package:medic_app/forms/validaciones.dart';

class FormularioUbicacion extends StatelessWidget {
  final Patient paciente;
  final FormUbicacion formUbicacion;
  FormularioUbicacion({super.key, required this.paciente, required this.formUbicacion});


  //Controladores del formulario
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _calle = TextEditingController();
  final TextEditingController _numero = TextEditingController();
  final TextEditingController _piso = TextEditingController();
  final TextEditingController _depto = TextEditingController();
  final TextEditingController _casa = TextEditingController();
  final TextEditingController _monoblock = TextEditingController();
  final TextEditingController _barrio = TextEditingController();
  final TextEditingController _entreCalle1 = TextEditingController();
  final TextEditingController _entreCalle2 = TextEditingController();
  final TextEditingController _localidad = TextEditingController();
  final TextEditingController _referencia = TextEditingController();
  final TextEditingController _telefono = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    
    _calle.text = formUbicacion.calle ?? '';
    _numero.text = formUbicacion.numero ?? '';
    _piso.text = formUbicacion.piso ?? '';
    _depto.text = formUbicacion.depto ?? '';
    _casa.text = formUbicacion.casa ?? '';
    _monoblock.text = formUbicacion.monoblock ?? '';
    _barrio.text = formUbicacion.barrio ?? '';
    _entreCalle1.text = formUbicacion.entreCalle1 ?? '';
    _entreCalle2.text = formUbicacion.entreCalle2 ?? '';
    _referencia.text = formUbicacion.referencia ?? '';
    _telefono.text = formUbicacion.telefono ?? '';


    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Theme.of(context).colorScheme.background,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
    
              Expanded(
                flex: 1,
                child: SecondaryPanel(
                  width: MediaQuery.of(context).size.width,   
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                              
                          TextInputMedium(nombre: 'Calle:', hint: 'Ej.: Av. Rivadavia', controller: _calle, validator: validarNombreApellido),
                    
                          Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: TextInputMedium(nombre: 'Numero:', controller: _numero, validator: validarSoloNumeros)
                              ),
                              Flexible(
                                flex: 1,
                                child: TextInputMedium(nombre: 'Piso:', controller: _piso, validator: validarSoloNumeros),
                              ),
                              Flexible(
                                flex: 1,
                                child: TextInputMedium(nombre: 'Depto:', controller: _depto),
                              ),
                            ],
                          ),
                    
                          Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: TextInputMedium(nombre: 'Casa:', controller: _casa)
                              ),
                              Flexible(
                                flex: 1,
                                child: TextInputMedium(nombre: 'Monoblock:', controller: _monoblock),
                              ),
                            ],
                          ),
                          
                    
                          TextInputMedium(nombre: 'Barrio:', controller: _barrio, validator: validadorGenericoNoObligatorio),
                    
                          Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: TextInputMedium(nombre: 'Entre calle:', controller: _entreCalle1, validator: validarNombreApellido)
                              ),
                              Flexible(
                                flex: 1,
                                child: TextInputMedium(nombre: 'y calle:', controller: _entreCalle2, validator: validarNombreApellido)
                              ),
                            ],
                          ),
                          
                          
                          TextInputMedium(nombre: 'Localidad:', hint: 'Ej.: CABA', controller: _localidad, validator: validadorGenerico),
                          TextInputMedium(nombre: 'Referencia:', controller: _referencia, validator: validadorGenericoNoObligatorio),
                          TextInputMedium(nombre: 'Telefono:', controller: _telefono, validator: validarNumeroDeTelefono),
                              
                              
                        
                        
                    
    
                        
                              
                        ],
                      ),
                    ),
                  ),
                ),
              ),
    
    
    
              CustomButtonRow(
                leftButtonText: 'Volver', 
                onLeftButtonPressed: () { 
                  Navigator.pop(context, formUbicacion);
                },
    
                rightButtonText: 'Guardar' , 
                onRightButtonPressed: (){
                  if(_formKey.currentState!.validate()){
    
                    final formUbicacionAuxiliar = formUbicacion;
    
                    formUbicacionAuxiliar.calle = _calle.text;
                    formUbicacionAuxiliar.numero = _numero.text;
                    formUbicacionAuxiliar.piso = _piso.text;
                    formUbicacionAuxiliar.depto = _depto.text;
                    formUbicacionAuxiliar.casa = _casa.text;
                    formUbicacionAuxiliar.monoblock = _monoblock.text;
                    formUbicacionAuxiliar.barrio = _barrio.text;
                    formUbicacionAuxiliar.entreCalle1 = _entreCalle1.text;
                    formUbicacionAuxiliar.entreCalle2 = _entreCalle2.text;
                    formUbicacionAuxiliar.referencia = _referencia.text;
                    formUbicacionAuxiliar.telefono = _telefono.text;
    
                    formUbicacionAuxiliar.formularioValidado = true;
                    Navigator.pop(context, formUbicacionAuxiliar);
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