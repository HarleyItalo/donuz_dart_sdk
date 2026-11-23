import 'dart:convert';
import 'package:donuz_dart_sdk/modules/common/config/config.dart';
import 'package:donuz_dart_sdk/modules/establishment/establishment_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../json/establisment/login_establishment_json.dart';
import '../../../mocks/common/base_config_mock.dart';
import '../../../mocks/establishment/repositories/establishment_repository_mock.dart';

void main() async {
  final establishmentRepositoryMock = EstablishmentRepositoryMock();
  BaseConfig config = BaseConfigMock("2234", 'alksdjlaksd');
  final establismentLogin = EstablismentLoginImpl(
    establishmentRepositoryMock,
    config,
  );

  group("EstablismentLogin", () {
    test("Deve retornar as informacoes de login", () async {
      when(() => establishmentRepositoryMock.login("teste", 'senha'))
          .thenAnswer((_) async =>
              AdminModel.fromJson(jsonDecode(loginEstablismentJson)));
      var response =
          await establismentLogin(username: "teste", password: "senha");
      expect(config.donuzToken, "123");
      expect(response, isNotNull);
    });
  });
}
