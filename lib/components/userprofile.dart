import 'package:estudo/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserProfile extends StatelessWidget {
  final User user;

  UserProfile(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 20, bottom: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 45,
            backgroundImage: NetworkImage(
              user.avatar ?? '',
            ),
          ),
          SizedBox(width: 10),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.vertical,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  user.username ?? 'Nome de usuário inválido!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold, // Texto em negrito
                    fontSize: 19, // Tamanho do texto em negrito
                    fontFamily: 'OpenSans',
                  ),
                ),
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 220),
                child: Text(
                  user.description ?? '',
                  style: TextStyle(
                    fontSize: 19,
                    color: Color(0xFF586069),
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
