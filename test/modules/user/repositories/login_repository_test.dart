import 'dart:convert';

import 'package:donuz_dart_sdk/modules/common/services/storage_service.dart';
import 'package:donuz_dart_sdk/modules/user/constants/login_constants.dart';
import 'package:donuz_dart_sdk/modules/user/repositories/login_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../json/user/login_success_json.dart';
import '../../../mocks/common/services/http_service_mock.dart';

void main() async {
  final httpService = HttpServiceMock();
  SharedPreferences.setMockInitialValues({});
  final storageService = StorageService(await SharedPreferences.getInstance());
  final LoginRepository loginRepository =
      LoginRepositoryImpl(httpService, storageService);

  group("LoginRepository", () {
    test("Deve falhar ao fazer o login", () async {
      when(() => httpService.post(
          "clients/login",
          {
            "login": "teste",
            "senha": "teste123",
            "player_id": null,
          },
          appId: '2234')).thenAnswer((_) async {
        return <String, dynamic>{};
      });
      var response = await loginRepository.makeLogin(
          appId: "2234", username: 'teste', password: 'teste123');
      expect(response, isNull);
    });
    test("Deve ter sucesso ao login", () async {
      when(() => httpService.post(
          "clients/login",
          {
            "login": "teste",
            "senha": "teste123",
            "player_id": null,
          },
          appId: '2234')).thenAnswer((_) async {
        return jsonDecode(loginSuccessJson);
      });
      var response = await loginRepository.makeLogin(
          appId: "2234", username: 'teste', password: 'teste123');
      expect(response, isNotNull);
    });
    test("Deve fazer o logout", () async {
      var response = await loginRepository.makeLogout();
      expect(response, true);
    });

    test("Deve retornar nulo por nao encontrar um token", () async {
      var response = await loginRepository.getLoggedUserToken();
      expect(response, isNull);
    });
    test("Deve retornar o token", () async {
      SharedPreferences.setMockInitialValues({loginTokenKey: "token"});
      final storageService =
          StorageService(await SharedPreferences.getInstance());
      final LoginRepository loginRepository =
          LoginRepositoryImpl(httpService, storageService);
      var response = await loginRepository.getLoggedUserToken();
      expect(response, isNotNull);
    });
  });
}