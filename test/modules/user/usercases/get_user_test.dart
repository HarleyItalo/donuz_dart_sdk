import 'dart:convert';

import 'package:donuz_dart_sdk/modules/user/models/user_model.dart';
import 'package:donuz_dart_sdk/modules/user/usercases/get_user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../json/user/user_data_json.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';
import '../../../mocks/user/repositories/user_repository_mock.dart';
import '../../../mocks/user/user_cases/get_logged_user_token_mock.dart';

void main() {
  var userRepositoryMock = UserRepositoryMock();
  var findEstablishmentByIdMock = FindEstablismentByIdMock();
  var getLoggedUserTokenMock = GetLoggedUserTokenMock();
  var getUser = GetUserImpl(
      userRepositoryMock, findEstablishmentByIdMock, getLoggedUserTokenMock);
  group("GetUser", () {
    test("Deve buscar o usuario passando o id", () async {
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
        () => userRepositoryMock.getUser(appId: "2234", userInfo: '123'),
      ).thenAnswer((invocation) async =>
          UserModel.fromJson(jsonDecode(userDataJson)).client);
      var response = await getUser();
      expect(response, isNotNull);
      expect(response?.camposAdicionais, isNotNull);
    });

    test("Deve buscar o usuario sem campos adicionais", () async {
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
        () => userRepositoryMock.getUser(appId: "2234", userInfo: '123'),
      ).thenAnswer((invocation) async =>
          UserModel.fromJson(jsonDecode(userDataWithOutAditionals)).client);
      var response = await getUser();
      expect(response, isNotNull);
    });
  });
}
