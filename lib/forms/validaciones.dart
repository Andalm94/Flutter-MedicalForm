String? validarNumeroDeTelefono(String? value) {
  if (value == null || value.isEmpty) {
    return 'Campo obligatorio';
  }

  // Expresión regular para validar números de teléfono
  const pattern = r'^\d{10}$'; // Asumiendo que el número debe tener 10 dígitos
  final regExp = RegExp(pattern);

  if (!regExp.hasMatch(value)) {
    return 'Número de teléfono inválido';
  }

  return null;
}

String? validarEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Campo obligatorio';
  }

  // Expresión regular para validar direcciones de email
  const pattern = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';
  final regExp = RegExp(pattern);

  if (!regExp.hasMatch(value)) {
    return 'Email inválido';
  }

  return null;
}

String? validarNombreApellido(String? value) {
  if (value == null || value.isEmpty) {
    return 'Campo obligatorio';
  }

  // Expresión regular para validar nombre y apellido
  const pattern = r'^([a-zA-Z]+\s)*[a-zA-Z]+$';
  final regExp = RegExp(pattern);

  if (!regExp.hasMatch(value)) {
    return 'Ingrese un nombre válido';
  }

  return null;
}

String? validarSoloNumeros(String? value) {
  if (value == null || value.isEmpty) {
    return 'Campo obligatorio';
  }

  // Expresión regular para validar solo números
  const pattern = r'^\d+$';
  final regExp = RegExp(pattern);

  if (!regExp.hasMatch(value)) {
    return 'Ingrese solo números';
  }

  return null;
}

String? validarSoloNumerosNoObligatorio(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  }

  // Expresión regular para validar solo números
  const pattern = r'^\d+$';
  final regExp = RegExp(pattern);

  if (!regExp.hasMatch(value)) {
    return 'Ingrese solo números';
  }

  return null;
}

String? validadorGenerico(String? value) {
  if (value == null || value.isEmpty) {
    return 'Campo obligatorio';
  }

  // Expresión regular para validar caracteres alfanuméricos y espacios
  const pattern = r'^[a-zA-Z0-9\s]+$';
  final regExp = RegExp(pattern);

  if (!regExp.hasMatch(value)) {
    return 'Ingrese un valor válido';
  }

  return null;
}

String? validadorGenericoNoObligatorio(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  }

  // Expresión regular para validar caracteres alfanuméricos y espacios
  const pattern = r'^[a-zA-Z0-9\s]+$';
  final regExp = RegExp(pattern);

  if (!regExp.hasMatch(value)) {
    return 'Ingrese un valor válido';
  }

  return null;
}
