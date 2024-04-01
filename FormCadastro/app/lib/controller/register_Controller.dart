import 'package:app/model/user.dart';

class RegisterController {
  User? createUser(String name, String email, String password) {
    // Aqui você pode incluir lógica adicional antes de criar o usuário
    return User(name: name, email: email, password: password);
  }
}
