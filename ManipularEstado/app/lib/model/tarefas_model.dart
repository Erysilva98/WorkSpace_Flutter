class TarefasModel {
  String id;
  String titulo;
  bool concluido;

  TarefasModel( {required this.id, required this.titulo, this.concluido = false} );

  void aleterarParaConcluido() {
    concluido = !concluido;
  }
}
