import 'dart:convert';

import 'package:donuz_dart_sdk/modules/wallet/wallet_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mocktail/mocktail.dart';

import '../../../json/default_response_json.dart';
import '../../../json/wallet/balance_json.dart';
import '../../../json/wallet/extract_json.dart';
import '../../../json/wallet/punctuable_code_json.dart';
import '../../../json/wallet/ranking_json.dart';
import '../../../json/wallet/rules_json.dart';
import '../../../json/wallet/single_ranking_json.dart';
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
    test("Deve retornar o saldo do cliente por id", () async {
      when(
        () => httpServiceMock.get(
          "client/balance/123",
          appId: '2234',
        ),
      ).thenAnswer(
        (_) async => jsonDecode(balanceJson),
      );
      var response =
          await repository.getBalanceById(appId: "2234", clientId: '123');
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
    test('Deve inserir um codigo pontuavel', () async {
      when(() => httpServiceMock.post(
          'computableCode', {"codigo": "123", "valor": '10'},
          tokenCliente: '123', appId: "2234")).thenAnswer(
        (_) async => jsonDecode(punctuableCodeJson),
      );
      var response = await repository.validadePunctuableCode(
          code: '123', value: '10', tokenClient: '123', appId: '2234');
      expect(response.status, 200);
    });
    test('Deve inserir um qrcode', () async {
      when(() => httpServiceMock.post('qrcode', {"codigo": "123"},
          tokenCliente: '123', appId: "2234")).thenAnswer(
        (_) async => jsonDecode(punctuableCodeJson),
      );
      var response = await repository.validadeQrCode(
        code: '123',
        tokenClient: '123',
        appId: '2234',
      );
      expect(response.status, 200);
    });
    test(
      'Deve buscar o ranking',
      () async {
        when(() => httpServiceMock.get('points/ranking', appId: "2234"))
            .thenAnswer(
          (_) async => jsonDecode(rankingJson),
        );
        var response = await repository.findRanking(
          appId: '2234',
        );
        expect(response.status, 200);
      },
    );

    test(
      'Deve buscar o ranking de um usuario',
      () async {
        when(() => httpServiceMock.get('points/ranking/123', appId: "2234"))
            .thenAnswer(
          (_) async => jsonDecode(singleRankingJson),
        );
        var response =
            await repository.findSingleRanking(appId: '2234', personId: "123");
        expect(response.status, 200);
      },
    );
    test(
      'Deve fazer uma transferência',
      () async {
        when(() => httpServiceMock.post(
              'points/donate',
              {
                "valor": 10,
                "cpf": '12345678909',
                "cpf_origem": '0123456789',
              },
              appId: '2234',
            )).thenAnswer(
          (_) async => jsonDecode(defaultResponseJson),
        );
        var response = await repository.transfer(
          destination: '12345678909',
          source: '0123456789',
          value: 10,
          appId: '2234',
        );
        expect(response.status, 200);
      },
    );
    test(
      'Deve buscar as regras de pontos',
      () async {
        when(() => httpServiceMock.get('points/rules', appId: "2234"))
            .thenAnswer(
          (_) async => jsonDecode(rulesJson),
        );
        var response = await repository.getPointsRule(
          appId: '2234',
        );
        expect(response.status, 200);
      },
    );
  });
}
