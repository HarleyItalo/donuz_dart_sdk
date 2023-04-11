import 'dart:convert';

import 'package:donuz_dart_sdk/modules/common/common_module.dart';
import 'package:donuz_dart_sdk/modules/redemption/redemption_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../json/redemptions/redemptions_json.dart';
import '../../../json/redemptions/rescue_json.dart';
import '../../../mocks/common/services/http_service_mock.dart';

void main() async {
  HttpService httpService = HttpServiceMock();
  var repository = RescueRepositoryImpl(httpService);
  group("RedemptionRepository", () {
    test("Deve buscar todos os resgates do cliente", () async {
      when(
        () => httpService.get(
          "redeemptions",
          appId: "2234",
          tokenCliente: '123',
        ),
      ).thenAnswer((_) async => jsonDecode(redemptionsJson));

      var response = await repository.getRescuesFromClient(
        tokenCliente: "123",
        appId: "2234",
      );
      expect(response, isNotNull);
      expect(response, isNotEmpty);
      expect(response, isA<List<Rescue>>());
    });
    test("Deve retornar uma lista vazia de premios", () async {
      when(() => httpService.get("redeemptions",
          appId: "2234", tokenCliente: "123")).thenAnswer((_) async => {});

      var response = await repository.getRescuesFromClient(
        tokenCliente: '123',
        appId: "2234",
      );
      expect(response, isNull);
    });

    test("Deve resgatar um premio", () async {
      when(
        () => httpService.post(
            "redeemptions",
            {
              "id_premio": 123,
              "quantidade": 1,
            },
            appId: "2234",
            tokenCliente: "123"),
      ).thenAnswer(
        (_) async => jsonDecode(rescueJson),
      );
      var response = await repository.makeRescue(
          idPrize: 123, quantity: 1, appId: "2234", tokenCliente: "123");
      expect(response, isNotNull);
      expect(response.rescue, isNotNull);
    });
  });
}
