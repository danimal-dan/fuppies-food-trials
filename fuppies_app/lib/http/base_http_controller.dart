import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:fuppies_app/http/auth_credential_provider.dart';
import 'package:http/http.dart' as http;

class BaseHttpController {
  http.BaseClient initClient() {
    return _FuppiesHttpClient(http.Client());
  }

  Uri uriOf(String path, [Map<String, dynamic>? params]) {
    return Uri.http('localhost:8080', path, params);
  }
}

class _FuppiesHttpClient extends http.BaseClient {
  final http.Client _inner;

  _FuppiesHttpClient(this._inner);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    String? credentials = await AuthCredentialProvider.getCredentials();
    if (credentials == null) {
      ErrorDescription("Credentials are empty, cannot make API request");
    }

    request.headers['Authorization'] =
        "Basic ${base64.encode(utf8.encode(credentials!))}";
    request.headers['Content-type'] = 'application/json';
    return _inner.send(request);
  }
}
