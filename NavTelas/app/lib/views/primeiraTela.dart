import 'package:flutter/material.dart';
import 'segundaTela.dart';

class PrimeiraTela extends StatelessWidget {
  const PrimeiraTela({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Primeira Tela'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SegundaTela()),
            );
          },
          child: const Text('Ir para a Segunda Tela'),
        ),
      ),
    );
  }
}