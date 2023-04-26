import 'dart:convert';

import 'package:donuz_dart_sdk/modules/wallet/wallet_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mocktail/mocktail.dart';

import '../../../json/wallet/balance_json.dart';
import '../../../json/wallet/extract_json.dart';
import '../../../mocks/common/services/http_service_mock.dart';

main() {
  final httpServiceMock = HttpServiceMock();
  final repository = PointsRepositoryImpl(httpServiceMock);
  group("PointsRepository", () {
    test("Deve retornar o saldo do cliente", () async {
      when(
        () => httpServiceMock.get(
          "client/balance",
          appId: '2234',
          tokenCliente: '123',
        ),
      ).thenAnswer(
        (_) async => jsonDecode(balanceJson),
      );
      var response =
          await repository.getBalance(appId: "2234", tokenClient: '123');
      expect(response, isNotNull);
      expect(response.saldo, "0,00");
    });
    test("Deve retornar o extrato do cliente", () async {
      when(
        () => httpServiceMock.get(
          "points",
          appId: '2234',
          tokenCliente: '123',
        ),
      ).thenAnswer(
        (_) async => jsonDecode(extractJson),
      );
      var response =
          await repository.getPoints(appId: "2234", tokenClient: '123');
      expect(response, isNotNull);
      expect(response.pontos, isNotNull);
    });

    test('Deve inserir um ponto', () async {
      var json = {
        "valor": "10.0",
        "descricao": "insercao de teste",
        "cliente": '12345678909',
        "data_de_insercao": DateFormat('yyyy-MM-dd').format(DateTime.now()),
        "regra": null,
        "controle": null,
        "usuario_id": null,
        "filial_id": null,
        "codigo_do_produto": null
      };
      when(
        () => httpServiceMock.post("points", json, appId: '2234'),
      ).thenAnswer(
        (_) async => {
          "status": 200,
          "mensagem": "requisicao finalizada com sucesso",
        },
      );
      var response = await repository.insertPoint(
        userIdentification: '12345678909',
        value: 10.0,
        description: "insercao de teste",
        appId: '2234',
      );
      expect(response, isNotNull);
    });
  });
}
