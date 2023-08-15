import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/userprofile.dart';
import 'components/changebar.dart';
import 'controllers/usercontroller.dart';
import 'models/repository.dart';
import 'models/starred.dart';
import 'models/user.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Github Profiles',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.black,
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _usuario = User();
  var _repositories = <Repository>[];
  var _starred = <Starred>[];

  final UserController _userController = Get.put(UserController());

  var _isLoading = true;
  var _loadingError = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      await _userController.searchUser();
      setState(() {
        _usuario = _userController.usuario;
        _repositories = _userController.repositories;
        _starred = _userController.starred;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _loadingError = true;
        _isLoading = false;
      });
      print("Erro ao carregar os dados: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.all(10),
          child: Image.asset(
            'assets/github.png',
            width: 24,
            height: 24,
            color: Colors.white,
          ),
        ),
        title: RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 23.0,
              color: Colors.white,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.normal,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'Github ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23.0,
                  fontFamily: 'OpenSans',
                ),
              ),
              TextSpan(
                text: 'Profiles',
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (_loadingError)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Erro ao carregar os dados. Tente novamente mais tarde.",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            if (_isLoading)
              Padding(
                padding: EdgeInsets.all(150.0),
                child: Column(
                  children: [
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                ),
              ),
            if (!_isLoading && !_loadingError)
              Column(
                children: [
                  UserProfile(_usuario),
                  ChangeBar(_repositories, _starred),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
