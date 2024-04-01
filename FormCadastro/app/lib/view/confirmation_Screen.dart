import 'package:flutter/material.dart';
import 'package:app/model/user.dart';

class ConfirmationScreen extends StatelessWidget {
  final User user;

  const ConfirmationScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmação'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nome: ${user.name}'),
            Text('E-mail: ${user.email}'),
            // A senha não será exibida por questões de segurança
          ],
        ),
      ),
    );
  }
}
