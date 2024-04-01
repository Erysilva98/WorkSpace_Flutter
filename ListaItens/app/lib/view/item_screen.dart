import 'package:flutter/material.dart';
import 'package:app/model/item_model.dart';

class ItemScreen extends StatelessWidget {
  final Item? item; // Altere para aceitar nulo

  const ItemScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    // Adicione lógica para tratar o caso em que `item` é nulo, se necessário
    if (item == null) {
      return Scaffold(
        appBar: AppBar(title: Text('Item não especificado')),
        body: Center(child: Text('Nenhum item selecionado')),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(item!.title),
      ),
      body: Column(
        children: [
          Image.asset(item!.imageUrl), 
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(item!.title, style: const TextStyle(fontSize: 24)),
          ),
        ],
      ),
    );
  }
}
