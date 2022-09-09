import 'package:flutter/material.dart';
import 'base_http_controller.dart';
import 'dart:io';

class AuthController {
  AuthController._privateConstructor();

  static final AuthController _instance = AuthController._privateConstructor();
  static final BaseHttpController _http = BaseHttpController();

  factory AuthController() {
    return _instance;
  }

  Future<bool> validateAuthToken() async {
    var client = _http.initClient();
    try {
      var response = await client.get(_http.uriOf('auth'));

      if (response.statusCode != HttpStatus.ok) {
        debugPrint(
            "auth token validation failed ${response.statusCode} - ${response.body}");
        return false;
      }

      return true;
    } finally {
      client.close();
    }
  }
}
