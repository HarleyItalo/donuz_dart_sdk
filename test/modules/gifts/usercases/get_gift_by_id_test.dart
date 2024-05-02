import 'dart:convert';

import 'package:donuz_dart_sdk/modules/gifts/gift_module.dart';
import 'package:donuz_dart_sdk/modules/gifts/usercases/get_gift_by_id.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../json/gift/get_gift_by_id_json.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';
import '../../../mocks/gift/gift_repository_mock.dart';

void main() {
  var repository = GiftRepositoryMock();
  var findEstablishmentByIdMock = FindEstablismentByIdMock();

  var getGiftById = GetGiftByIdImpl(repository, findEstablishmentByIdMock);
  group("GetGiftById", () {
    test("Deve retornar os presentes disponiveis para o usuario", () async {
      when(
        () => findEstablishmentByIdMock.currentId(),
      ).thenAnswer(
        (_) async => '2234',
      );
      when(
        () => repository.getGiftById(appId: "2234", id: "123"),
      ).thenAnswer(
        (_) async => GiftsModel.fromJson(
          jsonDecode(getGiftByIdJson),
        ),
      );

      var response = await getGiftById("123");
      expect(response, isNotNull);
    });
  });
}
