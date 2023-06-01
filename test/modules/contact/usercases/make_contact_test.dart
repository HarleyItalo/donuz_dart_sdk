import 'package:donuz_dart_sdk/modules/contact/models/contact_model.dart';
import 'package:donuz_dart_sdk/modules/contact/usercases/make_contact.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../mocks/contact/repositories/contact_repository_mock.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';

void main() async {
  final contactRepositoryMock = ContactRepositoryMock();
  final findEstablismentByIdMock = FindEstablismentByIdMock();
  final makeContact =
      MakeContactImpl(contactRepositoryMock, findEstablismentByIdMock);

  group("GetPrizes", () {
    test("Deve Buscar todos os premios de um estabelecimento", () async {
      var contact = ContactModel(
        to: "teste@test.com",
        subject: "Assunto",
        nome: "Nome",
        assunto: "Assunto",
        mensagem: "Mensagem",
      );
      when(() => contactRepositoryMock.makeContact(
          contact: contact, appId: "2234")).thenAnswer((_) async => true);
      when(() => findEstablismentByIdMock.currentId())
          .thenAnswer((_) async => "2234");

      var response = await makeContact(
        contact: contact,
      );
      expect(response, isNotNull);
      expect(response, isA<bool>());
    });
  });
}
