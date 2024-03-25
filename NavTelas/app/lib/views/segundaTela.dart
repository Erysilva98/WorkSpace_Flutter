import 'package:flutter/material.dart';

class SegundaTela extends StatelessWidget {
  const SegundaTela({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Segunda Tela'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Voltar para a Primeira Tela'),
        ),
      ),
    );
  }
}