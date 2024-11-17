import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String email;

  const HomePage({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bienvenido')),
      body: Center(
        child: Card(
          margin: EdgeInsets.all(16.0),
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Inicio de Sesión Exitoso', style: TextStyle(fontSize: 18)),
                SizedBox(height: 10),
                Text('Correo:', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(email, style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}