/**
import 'package:flutter/material.dart';
import 'widget/name_input.dart';
import 'widget/email_input.dart';
import 'widget/phone_input.dart';
import 'widget/password_input.dart';
import 'widget/register_button.dart';

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
    if (_formKey.currentState!.validate()) {
      if (passwordController.text == confirmPasswordController.text) {
        print('Nombre: ${nameController.text}');
        print('Correo: ${emailController.text}');
        print('Teléfono: ${phoneController.text}');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Las contraseñas no coinciden')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          NameInput(controller: nameController),
          EmailInput(controller: emailController),
          PhoneInput(controller: phoneController),
          PasswordInput(
            passwordController: passwordController,
            confirmPasswordController: confirmPasswordController,
          ),
          RegisterButton(onPressed: _register),
        ],
      ),
    );
  }
}
**/
