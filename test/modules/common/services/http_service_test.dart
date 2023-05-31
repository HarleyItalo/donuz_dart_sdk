import 'package:donuz_dart_sdk/modules/common/common_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import '../../../mocks/common/base_config_mock.dart';
import '../../../mocks/common/fake_uri_mock.dart';
import '../../../mocks/common/http_client_mock.dart';

void main() {
  http.Client clientMock = HttpClientMock();
  BaseConfig config = BaseConfigMock("2234", 'alksdjlaksd');
  var httpService = HttpService(clientMock, config);

  setUpAll(() {
    registerFallbackValue(FakeUriMock());
  });
  group("HttpService", () {
    test("Deve realizar um get", () async {
      when(
        () => clientMock.get(any(), headers: httpService.getHeaders()),
      ).thenAnswer((_) async => http.Response(
          '{"status":200, "mensagem":"Requisicao finalizada com sucesso"}',
          200));
      var response = await httpService.get("");
      expect(response, isNotNull);
      expect(response['status'], 200);
    });
    test("Deve falhar a fazer um get", () async {
      when(
        () => clientMock.get(any(), headers: httpService.getHeaders()),
      ).thenThrow(Exception());
      var response = await httpService.get("");
      expect(response, isEmpty);
    });
    test("Deve realizar um post", () async {
      when(
        () => clientMock.post(any(),
            body: '{}', headers: httpService.getHeaders()),
      ).thenAnswer((_) async => http.Response(
          '{"status":200, "mensagem":"Requisicao finalizada com sucesso"}',
          200));
      var response = await httpService.post("", {});
      expect(response, isNotNull);
    });
    test("Deve falhar ao realizar um post", () async {
      when(
        () => clientMock.post(any(),
            body: '{}', headers: httpService.getHeaders()),
      ).thenThrow(Exception());
      var response = await httpService.post("", {});
      expect(response, isEmpty);
    });
    test("Remove os valores nulos", () {
      var response = httpService.removeNullValues({"test": null});
      expect(response, isEmpty);
    });

    test("Gera um header com todos os valores", () {
      var response = httpService.getHeaders(
          useDonuzToken: false,
          appId: "2234",
          tokenCliente: "xpto",
          headers: <String, String>{"chinelo": "canela"});
      expect(response["estabelecimento"], '2234');
      expect(response["chinelo"], "canela");
    });

    test("Deve realizar um put", () async {
      when(
        () => clientMock.put(any(),
            body: '{}', headers: httpService.getHeaders()),
      ).thenAnswer((_) async => http.Response(
          '{"status":200, "mensagem":"Requisicao finalizada com sucesso"}',
          200));
      var response = await httpService.put("", {});
      expect(response, isNotNull);
    });
    test("Deve falhar realizar um put", () async {
      when(
        () => clientMock.put(any(),
            body: '{}', headers: httpService.getHeaders()),
      ).thenThrow(Exception());
      var response = await httpService.put("", {});
      expect(response, isEmpty);
    });

    test("Deve realizar um delete", () async {
      when(
        () => clientMock.delete(any(), headers: httpService.getHeaders()),
      ).thenAnswer((_) async => http.Response(
          '{"status":200, "mensagem":"Requisicao finalizada com sucesso"}',
          200));
      var response = await httpService.delete("");
      expect(response, isNotNull);
      expect(response['status'], 200);
    });
    test("Deve falhar a fazer um get", () async {
      when(
        () => clientMock.delete(any(), headers: httpService.getHeaders()),
      ).thenThrow(Exception());
      var response = await httpService.delete("");
      expect(response, isEmpty);
    });
  });
}
