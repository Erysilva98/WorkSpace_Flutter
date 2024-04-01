import 'package:flutter/material.dart';
import 'package:app/view/register_Screen.dart';

void main() {
  runApp(
    const FormCard()
  );
}

class FormCard extends StatelessWidget {
  const FormCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulário de Cadastro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const RegisterScreen(),
    );
  }
}