import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


import '../models/repository.dart';
import '../models/starred.dart';
import '../models/user.dart';

class UserController extends GetxController {
  var _usuario = User().obs;
  var _repositories = <Repository>[].obs;
  var _starred = <Starred>[].obs;

  User get usuario => _usuario.value;
  List<Repository> get repositories => _repositories;
  List<Starred> get starred => _starred;

  Future<void> searchUser() async {
    try {
      final username = 'emerson3'; //Coloque o nome do seu usuário aqui, como padrão virá o meu.
      print("Buscando dados do usuário...");
      await fetchUserData(username);
      await fetchUserRepositories(username);
      await fetchUserStarred(username);
      print("Dados do usuário carregados com sucesso.");
    } catch (error) {
      print('Erro na busca do usuário: $error');
      throw error;
    }
  }

  Future<void> fetchUserData(username) async {
    final userResponse = await http.get(Uri.parse('https://api.github.com/users/$username'));
    final data = jsonDecode(userResponse.body);
    _usuario.value = User.fromJson(data);
  }

  Future<void> fetchUserRepositories(username) async {
    final repositoriesResponse = await http.get(Uri.parse('https://api.github.com/users/$username/repos'));
    final repositoriesData = jsonDecode(repositoriesResponse.body) as List;

    _repositories.assignAll(repositoriesData
        .map((repoData) => Repository.fromJson(repoData))
        .toList());
  }

  Future<void> fetchUserStarred(username) async {
    final starredResponse = await http.get(Uri.parse('https://api.github.com/users/$username/starred'));
    final starredData = jsonDecode(starredResponse.body) as List;

    _starred.assignAll(starredData
        .map((starredData) => Starred.fromJson(starredData))
        .toList());
  }
}
