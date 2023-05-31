import 'dart:convert';

import 'package:donuz_dart_sdk/modules/gifts/gift_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../json/gift/get_gifts_json.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';
import '../../../mocks/gift/gift_repository_mock.dart';
import '../../../mocks/user/user_cases/get_logged_user_token_mock.dart';

void main() {
  var repository = GiftRepositoryMock();
  var findEstablishmentByIdMock = FindEstablismentByIdMock();
  var getLoggedUserTokenMock = GetLoggedUserTokenMock();

  var findGifts = FindGiftsImpl(
      repository, findEstablishmentByIdMock, getLoggedUserTokenMock);
  group("FindGifts", () {
    test("Deve retornar os presentes disponiveis para o usuario", () async {
      when(
        () => findEstablishmentByIdMock.currentId(),
      ).thenAnswer(
        (_) async => '2234',
      );
      when(
        () => getLoggedUserTokenMock(),
      ).thenAnswer(
        (_) async => "123",
      );
      when(
        () => repository.findGifts(appId: "2234", tokenCliente: "123"),
      ).thenAnswer(
        (_) async => GiftsModel.fromJson(
          jsonDecode(getGiftsJson),
        ),
      );

      var response = await findGifts();
      expect(response, isNotNull);
    });
  });
}
