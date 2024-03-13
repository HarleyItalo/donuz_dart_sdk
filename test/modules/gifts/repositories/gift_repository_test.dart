import 'dart:convert';

import 'package:donuz_dart_sdk/modules/common/extensions/enun_extension.dart';
import 'package:donuz_dart_sdk/modules/gifts/models/gift_status_enum.dart';
import 'package:donuz_dart_sdk/modules/gifts/repositories/gift_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../json/gift/get_gifts_json.dart';
import '../../../mocks/common/services/http_service_mock.dart';

void main() {
  var httpServiceMock = HttpServiceMock();
  GiftsRepository giftsRepository = GiftsRepositoryImpl(httpServiceMock);
  group("GiftRepository", () {
    test("deve retornar os presentes disponiveis para um usuário", () async {
      when(
        () => httpServiceMock.get('gifts', appId: '2234', tokenCliente: '123'),
      ).thenAnswer((_) async => jsonDecode(getGiftsJson));
      var response =
          await giftsRepository.findGifts(appId: '2234', tokenCliente: '123');
      expect(response, isNotNull);
    });
    test("deve mudar o status de um presente resgatado para um usuário",
        () async {
      when(
        () => httpServiceMock.put(
            'gifts',
            {
              "id_presente": 123,
              "status": 'utilizado',
              "usuario_id": 10,
            },
            appId: "2234"),
      ).thenAnswer((_) async => jsonDecode(getGiftsJson));
      var response = await giftsRepository.changeGiftStatus(
          giftRedemptionId: 123,
          appId: '2234',
          userId: 10,
          status: GiftStatus.utilizado.enumToString());
      expect(response, isNotNull);
    });
  });
}
