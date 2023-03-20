import 'dart:convert';

import 'package:donuz_dart_sdk/modules/common/models/base_response_donuz_model.dart';
import 'package:donuz_dart_sdk/modules/user/user_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../json/user/user_data_json.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';
import '../../../mocks/user/repositories/user_repository_mock.dart';
import '../../../mocks/user/user_cases/make_login_mock.dart';

void main() {
  group("RegisterUser", () {
    var makeLoginMock = MakeLoginMock();
    var findEstablishmentByIdMock = FindEstablismentByIdMock();
    var userRepositoryMock = UserRepositoryMock();

    var registerUser = RegisterUserImpl(
      userRepositoryMock,
      findEstablishmentByIdMock,
      makeLoginMock,
    );
    test("Deve registrar um usuario", () async {
      var userData = UserModel.fromJson(jsonDecode(userDataJson));
      userData.client?.senha = "123";

      when(
        () => findEstablishmentByIdMock.currentId(),
      ).thenAnswer(
        (_) async => '2234',
      );
      when(() => makeLoginMock(password: '123', username: '12345678909'))
          .thenAnswer(
        (_) async => LoginModel(),
      );
      when(
        () => userRepositoryMock.registerUser(
            user: userData.client!, appId: "2234"),
      ).thenAnswer((_) async => BaseResponseDonuzModel(
          status: 201, mensagem: "Requisicao finalizada com sucesso"));

      var response = await registerUser(user: userData.client!);
      expect(response, isNotNull);
    });
  });
}
