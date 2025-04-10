import 'dart:convert';
import 'package:http/http.dart' as http;
import '../entities/user.dart';

abstract class IFetchUserService {
  Future<User> fetchUser(int id);
}

class FetchUserService implements IFetchUserService {
  @override
  Future<User> fetchUser(int id) async {
    final response = await http.get(
      Uri.parse('https://reqres.in/api/users/$id'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      dynamic userData;

      if (jsonData['data'] is List) {
        final List dataList = jsonData['data'];
        userData = dataList.firstWhere(
          (element) => element['id'] == id,
          orElse: () => null,
        );
      } else {
        userData = jsonData['data'];
      }

      if (userData != null) {
        return User.fromJson(userData);
      } else {
        throw Exception('Usuário não encontrado.');
      }
    } else {
      throw Exception('Erro ao buscar usuário.');
    }
  }
}
