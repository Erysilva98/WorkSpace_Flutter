import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/providers/tarefas_provider.dart';
import 'package:app/view/tarefas_view.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TarefasProvider(),
      child: MaterialApp(
        home: TarefasView(),
      ),
    );
  }
}
