import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String email;

  HomePage({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {

            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hola, $email', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text('soy un feed de actividades... QUIZAS.'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {

              },
              child: Text('Realizar una acción'),
            ),
          ],
        ),
      ),
    );
  }
}
