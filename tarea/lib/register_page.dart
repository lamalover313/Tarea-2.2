import 'package:flutter/material.dart';
import 'login_page.dart';
import 'custum_inputs.dart';
import 'widget/password_input.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void _register() {
    if (_formKey.currentState!.validate()) {
      if (passwordController.text == confirmPasswordController.text) {
        print('Nombre: ${nameController.text}');
        print('Correo: ${emailController.text}');
        print('Teléfono: ${phoneController.text}');

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Las contraseñas no coinciden')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Crea una cuenta',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomInput(
                    controller: nameController,
                    labelText: 'Nombre completo',
                    hintText: 'Ingrese su nombre',
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Ingrese su nombre';
                      if (value.length < 3 || value.length > 10) return 'El nombre debe tener entre 3 y 10 caracteres';
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  CustomInput(
                    controller: emailController,
                    labelText: 'Correo electrónico',
                    hintText: 'Ingrese su correo',
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Ingrese su correo';
                      if (!value.contains('@unah.edu.hn') && !value.contains('@unah.hn')) return 'Correo inválido';
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  CustomInput(
                    controller: phoneController,
                    labelText: 'Número de teléfono',
                    hintText: 'Ingrese su teléfono',
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Ingrese su número de teléfono';
                      if (!(value.startsWith('3') || value.startsWith('9'))) return 'El número debe comenzar con 3 o 9';
                      if (value.length != 8) return 'El número debe tener exactamente 8 dígitos';
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  PasswordInput(
                    controller: passwordController,
                    labelText: 'Contraseña',
                    hintText: 'Ingrese su contraseña',
                  ),
                  SizedBox(height: 10),
                  PasswordInput(
                    controller: confirmPasswordController,
                    labelText: 'Confirmar Contraseña',
                    hintText: 'Confirme su contraseña',
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Confirme su contraseña';
                      if (value != passwordController.text) return 'Las contraseñas no coinciden';
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _register,
                    child: Text('Registrarse'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}