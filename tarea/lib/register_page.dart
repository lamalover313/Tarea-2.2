import 'package:flutter/material.dart';
import 'register_form.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Crear Cuenta')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Icon(Icons.account_circle, size: 100, color: Colors.blue),
              SizedBox(height: 20),
              Text('Regístrate', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              RegisterForm(), 
            ],
          ),
        ),
      ),
    );
  }
}