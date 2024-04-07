import 'package:flutter/material.dart';
import '../controller/endereco_controller.dart';
import '../model/endereco_model.dart';

class EnderecoView extends StatefulWidget {
  const EnderecoView({Key? key}) : super(key: key);

  @override
  _EnderecoViewState createState() => _EnderecoViewState();
}

class _EnderecoViewState extends State<EnderecoView> {
  final TextEditingController _cepController = TextEditingController();

  late Future<EnderecoModel> _futureEndereco = Future.value(EnderecoModel(
    cep: '',
    logradouro: '',
    complemento: '',
    bairro: '',
    localidade: '',
    uf: '',
  ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Consulta CEP')),
      body: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _cepController,
              decoration: const InputDecoration(hintText: 'Digite o CEP'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _futureEndereco = EnderecoController().fetchEndereco(_cepController.text);
                });
              },
              child: const Text('Buscar'),
            ),
            FutureBuilder<EnderecoModel>(
              future: _futureEndereco,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return const Text("Erro ao buscar dados");
                } else if (snapshot.hasData) {
                  return Text(
                    'CEP: ${snapshot.data!.cep}\n'
                    'Logradouro: ${snapshot.data!.logradouro}\n'
                    'Complemento: ${snapshot.data!.complemento}\n'
                    'Bairro: ${snapshot.data!.bairro}\n'
                    'Localidade: ${snapshot.data!.localidade}\n'
                    'UF: ${snapshot.data!.uf}',
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
