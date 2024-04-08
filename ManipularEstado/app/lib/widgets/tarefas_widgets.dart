import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/providers/tarefas_provider.dart';
import 'package:app/model/tarefas_model.dart';

class TarefasWidget extends StatelessWidget {
  final TarefasModel tarefa;

  TarefasWidget({required this.tarefa});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        tarefa.titulo,
        style: TextStyle(
          decoration: tarefa.concluido ? TextDecoration.lineThrough : null,
        ),
      ),
      leading: Checkbox(
        value: tarefa.concluido,
        onChanged: (bool? newValue) {
          Provider.of<TarefasProvider>(context, listen: false).alterarParaConcluido(tarefa);
        },
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          Provider.of<TarefasProvider>(context, listen: false).removerTarefa(tarefa);
        },
      ),
    );
  }
}
