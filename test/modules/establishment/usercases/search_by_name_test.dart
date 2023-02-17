import 'package:donuz_dart_sdk/modules/establishment/establishment_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../mocks/establishment/repositories/establishment_repository_mock.dart';

void main() async {
  final establishmentRepositoryMock = EstablishmentRepositoryMock();
  final searchByName = SearchByNameImpl(establishmentRepositoryMock);

  group("Search by Name", () {
    test("Deve retornar os estabelecimentos baseados em um texto passado.",
        () async {
      when(() => establishmentRepositoryMock.findByName("qualquer"))
          .thenAnswer((_) async => <Estabelecimento>[]);
      var response = await searchByName("qualquer");
      expect(response, isNotNull);
    });
    test(
        "Deve retornar uma lista vazia caso nao tenha sido passado nenhum texto",
        () async {
      when(() => establishmentRepositoryMock.findByName(""))
          .thenAnswer((_) async => <Estabelecimento>[]);
      var response = await searchByName("");
      expect(response, isNotNull);
    });
  });
}
