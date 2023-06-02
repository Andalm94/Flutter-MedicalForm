class FormAntecedentesYMedicamentos{
  bool? noPoseeAntecedentes;
  bool? seDesconocenAntecedentes;
  bool? diabetesI;
  bool? diabetesII;
  bool? asma;
  bool? cardiopatia; 
  bool? convulsion;
  bool? hta;
  bool? epoc;
  bool? acv;  
  String? alergias;
  String? medicamentos;
  bool? formularioValidado;

FormAntecedentesYMedicamentos({
    this.noPoseeAntecedentes = true,
    this.seDesconocenAntecedentes = false,
    this.diabetesI = false,
    this.diabetesII = false,
    this.asma = false,
    this.cardiopatia = false,
    this.convulsion = false,
    this.hta = false,
    this.epoc = false,
    this.acv = false,
    this.alergias,
    this.medicamentos,
    this.formularioValidado
  });
}
