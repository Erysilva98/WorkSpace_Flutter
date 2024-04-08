import 'package:flutter/material.dart';
import '../controller/endereco_controller.dart';
import '../model/endereco_model.dart';

class EnderecoView extends StatefulWidget {
  const EnderecoView({Key? key}) : super(key: key);

  @override
  State<EnderecoView> createState() => _EnderecoViewState();
}

class _EnderecoViewState extends State<EnderecoView> {
  final TextEditingController _cepController = TextEditingController();
  late Future<EnderecoModel> _futureEndereco;
  bool _isLoading = false; // Flag para controle de exibição do indicador de carregamento

  @override
  void initState() {
    super.initState();
    _futureEndereco = Future.value(EnderecoModel(
      cep: '',
      logradouro: '',
      complemento: '',
      bairro: '',
      localidade: '',
      uf: '',
      ibge: '',
    ));
  }

  Future<void> _buscarEndereco() async {
    setState(() => _isLoading = true);
    // Simula o carregamento antes de renderizar a tabela
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _futureEndereco = EnderecoController().fetchEndereco(_cepController.text);
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta CEP'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _cepController,
              decoration: const InputDecoration(hintText: 'Digite o CEP'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: _isLoading ? null : _buscarEndereco,
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('Buscar', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<EnderecoModel>(
                future: _futureEndereco,
                builder: (context, snapshot) {
                  if (_isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text("Erro ao buscar dados"));
                  } else if (snapshot.hasData) {
                    final dados = snapshot.data!;
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text('Campo')),
                          DataColumn(label: Text('Valor')),
                        ],
                        rows: [
                          if (dados.cep.isNotEmpty) DataRow(
                            cells: [DataCell(Text('CEP')), DataCell(Text(dados.cep))]),
                          if (dados.logradouro.isNotEmpty) DataRow(
                            cells: [DataCell(Text('Logradouro')), DataCell(Text(dados.logradouro))]),
                          if (dados.complemento.isNotEmpty) DataRow(
                            cells: [DataCell(Text('Complemento')), DataCell(Text(dados.complemento))]),
                          if (dados.bairro.isNotEmpty) DataRow(
                            cells: [DataCell(Text('Bairro')), DataCell(Text(dados.bairro))]),
                          if (dados.localidade.isNotEmpty) DataRow(
                            cells: [DataCell(Text('Localidade')), DataCell(Text(dados.localidade))]),
                          if (dados.uf.isNotEmpty) DataRow(
                            cells: [DataCell(Text('UF')), DataCell(Text(dados.uf))]),
                          if (dados.ibge.isNotEmpty) DataRow(
                            cells: [DataCell(Text('IBGE')), DataCell(Text(dados.ibge))]),
                        ],
                      ),
                    );
                  }
                  return Container(); // Retorna um container vazio se não houver dados
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
