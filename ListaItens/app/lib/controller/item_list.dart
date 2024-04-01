import 'package:flutter/material.dart';
import 'package:app/model/item_model.dart';
import 'package:app/view/item_screen.dart';

class ItemsList extends StatelessWidget {
  const ItemsList({Key? key}) : super(key: key);

  static final List<Item> items = [
    Item(title: 'Flutter', imageUrl: 'assets/flutter.png'),
    Item(title: 'Flutter', imageUrl: 'assets/flutter.png'),
    Item(title: 'Flutter', imageUrl: 'assets/flutter.png'),
    // Adicione mais itens conforme necessário
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Itens'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 8.0), // Margem entre cada item
            child: ListTile(
              leading: Image.asset(item.imageUrl),
              title: Text(item.title),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemScreen(item: item),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
