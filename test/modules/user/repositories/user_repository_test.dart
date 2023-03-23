import 'dart:convert';

import 'package:donuz_dart_sdk/modules/user/user_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../json/default_response_json.dart';
import '../../../json/user/user_data_json.dart';
import '../../../mocks/common/services/http_service_mock.dart';

void main() async {
  final httpService = HttpServiceMock();
  var userRepository = UserRepositoryImpl(httpService);
  group("LoginRepository", () {
    test("deve buscar as informacoes do usuario", () async {
      when(() => httpService.get("client/12345678909", appId: "2234"))
          .thenAnswer((invocation) async => jsonDecode(userDataJson));
      var response = await userRepository.getUser(
        appId: "2234",
        userInfo: '12345678909',
      );

      expect(response, isNotNull);
    });
    test("deve falhar ao buscar as informacoes do usuario", () async {
      var response = await userRepository.getUser(
        appId: "2234",
      );

      expect(response, isNull);
    });

    test("deve registrar um usuario", () async {
      var userData = User().toJson();
      userData['origem_cadastro_cliente'] = 'app';
      when(() => httpService.post("client", userData, appId: "2234"))
          .thenAnswer((invocation) async => jsonDecode(userDataJson));
      var response = await userRepository.registerUser(
        user: User(),
        appId: "2234",
      );

      expect(response, isNotNull);
    });
    test("deve atualizar um usuario", () async {
      var user = UserModel.fromJson(jsonDecode(userDataJson)).client;
      when(() => httpService.put("client", user!.toJson(), appId: "2234"))
          .thenAnswer((invocation) async => jsonDecode(userDataJson));
      var response = await userRepository.updateUser(
        user: user!,
        appId: "2234",
      );
      expect(response, isNotNull);
    });
    test("deve deletar um usuario", () async {
      when(() => httpService.delete("client/1234",
              appId: "2234", tokenCliente: '123'))
          .thenAnswer((invocation) async => jsonDecode(userDataJson));
      var response = await userRepository.deleteUser(
        userId: "1234",
        appId: "2234",
        token: '123',
      );
      expect(response, isNotNull);
    });

    test("deve enviar um sms para um usuario", () async {
      when(
        () => httpService.post(
          "sms/sendToAnonymous",
          {
            "celular": "00000000000",
          },
          appId: "2234",
        ),
      ).thenAnswer((invocation) async => jsonDecode(defaultResponseJson));
      var response = await userRepository.sendSmsBeforeRegistration(
        phoneNumber: "00000000000",
        appId: "2234",
      );
      expect(response, isNotNull);
    });
  });
}
