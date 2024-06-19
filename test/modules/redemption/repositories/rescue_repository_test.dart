import 'dart:convert';

import 'package:donuz_dart_sdk/modules/common/common_module.dart';
import 'package:donuz_dart_sdk/modules/redemption/redemption_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../json/redemptions/redemptions_by_date_json.dart';
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
    test("Deve retornar uma lista vazia de resgates", () async {
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
              "endereco_entrega_id": null,
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
    test("Deve atualizar o status de um voucher", () async {
      when(
        () => httpService.put(
          "voucher",
          {"id_pedido": 123, "status": 'utilizado', "usuario_id": '123'},
          appId: '2234',
        ),
      ).thenAnswer(
        (_) async => jsonDecode(rescueJson),
      );

      var response = await repository.changeVoucherStatus(
          idRedeemption: 123,
          newStatus: 'utilizado',
          appId: "2234",
          adminUserID: '123');
      expect(response, isNotNull);
      expect(response.rescue, isNotNull);
    });

    test("Deve retornar uma lista vazia de resgates por data", () async {
      var date = DateTime.now();
      var page = 0;
      when(
        () => httpService.get(
          "vouchersBydate?initDate=${date.year}-${date.month}-${date.day}&page=$page",
          appId: "2234",
        ),
      ).thenAnswer((_) async => jsonDecode(redemptionsByDateJson));

      var response = await repository.redemptionsByDate(
        startDate: date,
        appId: "2234",
        page: page,
      );
      expect(response, isNotNull);
    });
    test("Deve retornar um resgate por id", () async {
      var id = "1";

      when(
        () => httpService.get(
          "redeemption/$id",
          appId: "2234",
        ),
      ).thenAnswer((_) async => jsonDecode(rescueJson));

      var response = await repository.getRescueById(
        id: id,
        appId: "2234",
      );
      expect(response, isNotNull);
    });
  });
}
