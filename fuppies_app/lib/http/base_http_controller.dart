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
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['Authorization'] = 'Bearer 129308asdfakdladfklja1w3e4098';
    request.headers['Content-type'] = 'application/json';
    return _inner.send(request);
  }
}
