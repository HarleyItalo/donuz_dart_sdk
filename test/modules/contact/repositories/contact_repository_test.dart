import 'dart:convert';
import 'package:donuz_dart_sdk/modules/common/common_module.dart';
import 'package:donuz_dart_sdk/modules/contact/models/contact_model.dart';
import 'package:donuz_dart_sdk/modules/contact/repositories/contact_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../json/default_response_json.dart';

import '../../../mocks/common/services/http_service_mock.dart';

void main() async {
  HttpService httpService = HttpServiceMock();
  var repository = ContactRepositoryImpl(httpService);
  group("ContactRepository", () {
    test("Deve enviar um email de contato com o adminstrador do sistema",
        () async {
      var contact = ContactModel(
        to: "teste@test.com",
        subject: "Assunto",
        nome: "Nome",
        assunto: "Assunto",
        mensagem: "Mensagem",
      );
      when(
        () => httpService.post(
          "contact",
          contact.toJson(),
          appId: "2234",
        ),
      ).thenAnswer(
        (_) async => jsonDecode(defaultResponseJson),
      );
      var response = repository.makeContact(contact: contact, appId: '2234');
      expect(response, isNotNull);
    });
  });
}
