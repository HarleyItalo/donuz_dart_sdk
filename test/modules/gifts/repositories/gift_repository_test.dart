import 'dart:convert';

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
  });
}
