import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import '../constants.dart';

Future<bool> signIn(userName, password) async {
  String target = AUTH_URL + '?userName=$userName&password=$password';
  Response response = await get(target);
  String authData = response.body;
  return jsonDecode(authData)["authenticated?"];
}

Future<bool> signUp(userName, password) async {
  String target = REGISTER_URL + '?userName=$userName&password=$password';
  Response response = await get(target);
  String authData = response.body;
  return jsonDecode(authData)["userCreated"];
}
