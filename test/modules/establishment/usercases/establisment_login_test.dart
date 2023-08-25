import 'dart:convert';
import 'package:donuz_dart_sdk/modules/establishment/establishment_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../json/establisment/login_establishment_json.dart';
import '../../../mocks/establishment/repositories/establishment_repository_mock.dart';

void main() async {
  final establishmentRepositoryMock = EstablishmentRepositoryMock();
  final establismentLogin = EstablismentLoginImpl(
    establishmentRepositoryMock,
  );

  group("EstablismentLogin", () {
    test("Deve retornar as informacoes de login", () async {
      when(() => establishmentRepositoryMock.login("teste", 'senha'))
          .thenAnswer((_) async =>
              AdminModel.fromJson(jsonDecode(loginEstablismentJson)));
      var response =
          await establismentLogin(username: "teste", password: "senha");
      expect(response, isNotNull);
    });
  });
}
