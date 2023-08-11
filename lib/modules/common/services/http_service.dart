import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../common_module.dart';

class HttpService {
  final http.Client _client;
  final BaseConfig config;
  HttpService(
    this._client,
    this.config,
  );

  Future<Map<String, dynamic>> get(
    String url, {
    bool useDonuzToken = true,
    String? appId,
    String? tokenCliente,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _client.get(
        Uri.parse(useDonuzToken ? config.donuzApi + url : url),
        headers: getHeaders(
          useDonuzToken: useDonuzToken,
          appId: appId,
          tokenCliente: tokenCliente,
          headers: headers,
        ),
      );
      return jsonDecode(response.body);
    } on Exception {
      return <String, dynamic>{};
    }
  }

  Future<Map<String, dynamic>> post(
    String url,
    Map<String, dynamic> body, {
    bool useDonuzToken = true,
    String? appId,
    String? tokenCliente,
    Map<String, String>? headers,
  }) async {
    try {
      body = removeNullValues(body);
      final response = await _client.post(
        Uri.parse(useDonuzToken ? config.donuzApi + url : url),
        body: jsonEncode(body),
        headers: getHeaders(
          useDonuzToken: useDonuzToken,
          appId: appId,
          tokenCliente: tokenCliente,
          headers: headers,
        ),
      );
      return jsonDecode(response.body);
    } on Exception {
      return <String, dynamic>{};
    }
  }

  Future<Map<String, dynamic>> put(
    String url,
    Map<String, dynamic> body, {
    bool useDonuzToken = true,
    String? appId,
    String? tokenCliente,
    Map<String, String>? headers,
  }) async {
    try {
      body = removeNullValues(body);
      final response = await _client.put(
        Uri.parse(useDonuzToken ? config.donuzApi + url : url),
        body: jsonEncode(body),
        headers: getHeaders(
          useDonuzToken: useDonuzToken,
          appId: appId,
          tokenCliente: tokenCliente,
          headers: headers,
        ),
      );
      return jsonDecode(response.body);
    } on Exception {
      return <String, dynamic>{};
    }
  }

  Future<Map<String, dynamic>> delete(
    String url, {
    bool useDonuzToken = true,
    String? appId,
    String? tokenCliente,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _client.delete(
        Uri.parse(useDonuzToken ? config.donuzApi + url : url),
        headers: getHeaders(
          useDonuzToken: useDonuzToken,
          appId: appId,
          tokenCliente: tokenCliente,
          headers: headers,
        ),
      );
      return jsonDecode(response.body);
    } on Exception {
      return <String, dynamic>{};
    }
  }

  Future<Map<String, dynamic>> sendFile(
    File image, {
    bool useDonuzToken = true,
    String? appId,
    String? tokenCliente,
    Map<String, String>? headers,
  }) async {
    try {
      var request = MultipartRequest(
        "POST",
        Uri.parse("${config.donuzApi}upload"),
      );
      request.headers.addAll(
        getHeaders(
          tokenCliente: tokenCliente,
          appId: appId,
        ),
      );
      request.files.add(
        MultipartFile(
          'upload',
          image.readAsBytes().asStream(),
          image.lengthSync(),
          filename: image.path.split("/").last,
        ),
      );
      request.fields.addAll({'cliente': 'true'});
      var responseStream = await _client.send(request);
      var result = await http.Response.fromStream(responseStream);
      return jsonDecode(result.body);
    } on Exception {
      return <String, dynamic>{};
    }
  }

  Map<String, String> getHeaders({
    bool useDonuzToken = true,
    String? appId,
    String? tokenCliente,
    Map<String, String>? headers,
  }) {
    headers ??= <String, String>{};
    if (useDonuzToken) headers["token"] = config.donuzToken;
    if (null != appId) headers['estabelecimento'] = appId;
    if (null != tokenCliente) headers["token-cliente"] = tokenCliente;
    headers['content-type'] = 'application/json';
    return headers;
  }

  Map<String, dynamic> removeNullValues(Map<String, dynamic> data) {
    data.removeWhere(
      (i, j) => j == null,
    );
    return data;
  }
}
