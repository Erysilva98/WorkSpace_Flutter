import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/endereco_model.dart';

class EnderecoController {
  Future<EnderecoModel> fetchEndereco(String cep) async {
    final url = Uri.parse('https://viacep.com.br/ws/$cep/json/');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body);
      return EnderecoModel.fromJson(jsonMap);
    } else {
      throw Exception('Falha ao buscar o CEP');
    }
  }
}
