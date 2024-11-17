import 'package:flutter/material.dart';

class PhoneInput extends StatelessWidget {
  final TextEditingController controller;

  const PhoneInput({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(labelText: 'Teléfono', border: OutlineInputBorder()),
      validator: (value) {
        if (value == null || value.isEmpty) return 'El teléfono es obligatorio';
        final phoneRegex = RegExp(r'^[39][0-9]{7}$');
        if (!phoneRegex.hasMatch(value)) return 'Teléfono inválido';
        return null;
      },
    );
  }
}
