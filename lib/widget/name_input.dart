import 'package:flutter/material.dart';

class NameInput extends StatelessWidget {
  final TextEditingController controller;

  const NameInput({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: 'Nombre', border: OutlineInputBorder()),
      validator: (value) {
        if (value == null || value.isEmpty) return 'El nombre es obligatorio';
        if (value.length < 3 || value.length > 10) return 'Debe tener entre 3 y 10 caracteres';
        return null;
      },
    );
  }
}
