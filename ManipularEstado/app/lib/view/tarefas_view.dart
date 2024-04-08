import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/providers/tarefas_provider.dart';
import 'package:app/widgets/tarefas_widgets.dart'; // Verifique se o nome está correto
import 'package:app/model/tarefas_model.dart';

class TarefasView extends StatelessWidget {
  const TarefasView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
      ),
      body: Consumer<TarefasProvider>(
        builder: (context, tarefasProvider, child) {
          return ListView.builder(
            itemCount: tarefasProvider.tarefa.length,
            itemBuilder: (context, index) {
              final tarefa = tarefasProvider.tarefa[index];
              return TarefasWidget(tarefa: tarefa); // Verifique se este é o nome correto do widget
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              String novaTarefaTitulo = '';
              return AlertDialog(
                title: const Text('Nova Tarefa'),
                content: TextField(
                  autofocus: true,
                  onChanged: (value) {
                    novaTarefaTitulo = value;
                  },
                  decoration: const InputDecoration(hintText: "Digite o título da tarefa"),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      if (novaTarefaTitulo.isNotEmpty) {
                        final novaTarefa = TarefasModel(id: DateTime.now().toIso8601String(), titulo: novaTarefaTitulo);
                        Provider.of<TarefasProvider>(context, listen: false).adicionarTarefa(novaTarefa);
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text('Adicionar'),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
