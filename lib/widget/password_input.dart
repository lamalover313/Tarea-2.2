import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final FormFieldValidator<String>? validator;

  PasswordInput({
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.validator,
  });

  bool _hasUpperCase(String value) {
    for (int i = 0; i < value.length; i++) {
      if (value[i].toUpperCase() == value[i]) {
        return true; 
      }
    }
    return false; 
  }

  bool _hasSpecialChar(String value) {
    const specialChars = ['!', '@', '#', '\$', '%', '^', '&', '*', '(', ')', '-', '_', '=', '+', '{', '}', '[', ']', '|', '\\', ':', ';', '"', '\'', '<', '>', ',', '.', '?', '/'];
    for (int i = 0; i < value.length; i++) {
      if (specialChars.contains(value[i])) {
        return true;  
      }
    }
    return false;  
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Ingrese su contraseña';
        if (value.length < 8) return 'La contraseña debe tener al menos 8 caracteres';
        if (!_hasUpperCase(value)) return 'La contraseña debe contener al menos una mayúscula';
        if (!_hasSpecialChar(value)) return 'La contraseña debe contener al menos un carácter especial';
        return null;
      },
    );
  }
}