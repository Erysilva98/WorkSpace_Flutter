import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:app/model/tarefas_model.dart';

class TarefasProvider with ChangeNotifier{

  final List<TarefasModel> _tarefasLista = [];

  List<TarefasModel> get tarefa => (_tarefasLista);

  void adicionarTarefa(TarefasModel tarefa) {
    _tarefasLista.add(TarefasModel(id: DateTime.now().toString(), titulo: tarefa.titulo));
    notifyListeners();
  }

  void removerTarefa(TarefasModel tarefa) {
    _tarefasLista.remove(tarefa);
    notifyListeners();
  }

  void alterarParaConcluido(TarefasModel tarefa) {
    tarefa.aleterarParaConcluido();
    notifyListeners();
  }
}