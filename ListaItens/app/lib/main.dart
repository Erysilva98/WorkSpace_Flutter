import 'package:flutter/material.dart';
import 'package:app/controller/item_list.dart'; // Ajuste o import conforme a estrutura do seu projeto

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Itens',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ItemsList(),
    );
  }
}
