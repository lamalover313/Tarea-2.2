import 'package:flutter/material.dart';
import 'login_page.dart';
import 'custum_inputs.dart';
import 'widget/password_input.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void _register() {
    final name = nameController.text;
    final email = emailController.text;
    final phone = phoneController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Las contraseñas no coinciden')));
      return;
    }

    if (_formKey.currentState!.validate()) {
      print('Nombre: $name');
      print('Correo: $email');
      print('Teléfono: $phone');
      print('Contraseña: $password');
      Navigator.pop(context); 
      }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomInput(
            controller: nameController,
            labelText: 'Nombre Completo',
            hintText: 'Ingrese su nombre',
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null || value.isEmpty) return 'Ingrese su nombre';
              if (value.length < 3 || value.length > 10) return 'Nombre debe tener entre 3 y 10 caracteres';
              return null;
            },
          ),
          SizedBox(height: 15),
          CustomInput(
            controller: emailController,
            labelText: 'Correo',
            hintText: 'Ingrese su correo',
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) return 'Ingrese su correo';
              if (!value.contains('@unah.edu.hn') && !value.contains('@unah.hn')) return 'Correo inválido';
              return null;
            },
          ),
          SizedBox(height: 15),
          CustomInput(
            controller: phoneController,
            labelText: 'Teléfono',
            hintText: 'Ingrese su teléfono',
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.isEmpty) return 'Ingrese su teléfono';
              if (!RegExp(r'^[3|9]\d{7}$').hasMatch(value)) return 'Teléfono inválido';
              return null;
            },
          ),
          SizedBox(height: 15),
          PasswordInput(  
            controller: passwordController,
            labelText: 'Contraseña',
            hintText: 'Ingrese su contraseña',
          ),
          SizedBox(height: 15),
          PasswordInput(  
            controller: confirmPasswordController,
            labelText: 'Confirmar Contraseña',
            hintText: 'Repita su contraseña',
            validator: (value) {
              if (value == null || value.isEmpty) return 'Repita su contraseña';
              if (value != passwordController.text) return 'Las contraseñas no coinciden';
              return null;
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _register,
            child: Text('Registrarse', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}