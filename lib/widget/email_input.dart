import 'package:flutter/material.dart';

class EmailInput extends StatelessWidget {
  final TextEditingController controller;

  const EmailInput({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: 'Correo', border: OutlineInputBorder()),
      validator: (value) {
        if (value == null || value.isEmpty) return 'El correo es obligatorio';
        final emailRegex = RegExp(r'^[^@]+@unah\.(edu\.)?hn$');
        if (!emailRegex.hasMatch(value)) return 'Correo institucional inválido';
        return null;
      },
    );
  }
}
