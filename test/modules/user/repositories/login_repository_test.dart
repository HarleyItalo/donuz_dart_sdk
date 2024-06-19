import 'dart:convert';

import 'package:donuz_dart_sdk/modules/common/common_module.dart';
import 'package:donuz_dart_sdk/modules/user/user_module.dart';
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

    test("Deve retornar nulo por nao encontrar um userId", () async {
      var response = await loginRepository.getLoggedUserId();
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

    test("Deve retornar o userId", () async {
      SharedPreferences.setMockInitialValues({clientIdKey: "123123"});

      final storageService =
          StorageService(await SharedPreferences.getInstance());

      final LoginRepository loginRepository =
          LoginRepositoryImpl(httpService, storageService);

      var response = await loginRepository.getLoggedUserId();

      expect(response, isNotNull);
    });
    test("Deve enviar a requisicao de redefinicao de senha", () async {
      when(() => httpService.post(
          "clients/forgotPassword",
          {
            "email": "teste@teste.com",
          },
          appId: '2234')).thenAnswer((_) async {
        return jsonDecode(loginSuccessJson);
      });
      var response = await loginRepository.rememberPassword(
          email: "teste@teste.com", appId: "2234");
      expect(response, isNotNull);
    });
  });
}
