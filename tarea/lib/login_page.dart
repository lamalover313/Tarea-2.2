import 'package:flutter/material.dart';
import 'home_page.dart';
import 'register_page.dart';
import 'custum_inputs.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  final Map<String, String> registeredUsers = {
    'martinez.manuel@unah.edu.hn': '20222030928',
  };

  void _login() {
    final email = emailController.text;
    final password = passwordController.text;

    if (registeredUsers.containsKey(email)) {
      if (registeredUsers[email] == password) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage(email: email)),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Contraseña incorrecta')));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Correo no registrado')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inicio de Sesión')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(Icons.login, size: 100, color: Colors.blue),
            SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomInput(
                    controller: emailController,
                    labelText: 'Correo institucional',
                    hintText: 'Ingrese su correo',
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icons.email,
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Ingrese su correo';
                      if (!value.contains('@unah.edu.hn') && !value.contains('@unah.hn')) return 'Correo inválido';
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  CustomInput(
                    controller: passwordController,
                    labelText: 'Contraseña',
                    hintText: 'Ingrese su contraseña',
                    obscureText: !_isPasswordVisible,
                    prefixIcon: Icons.lock,
                    suffixIcon: IconButton(
                      icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Ingrese su contraseña';
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _login();
                      }
                    },
                    child: Text('Iniciar Sesión'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: Text('¿No tienes cuenta? Regístrate aquí'),
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