import 'package:flutter/material.dart';
import 'view/endereco_view.dart';

void main() {
  runApp(const MyCep());
}

class MyCep extends StatelessWidget {
  const MyCep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consulta CEP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const EnderecoView(),
    );
  }
}
