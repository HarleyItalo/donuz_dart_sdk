import 'package:donuz_dart_sdk/modules/establishment/establishment_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../mocks/establishment/repositories/establishment_repository_mock.dart';

void main() async {
  final establishmentRepositoryMock = EstablishmentRepositoryMock();
  final searchBySlug = SearchBySlugImpl(establishmentRepositoryMock);

  group("Search by slug", () {
    test("Deve retornar os estabelecimentos baseados em um slug passado.",
        () async {
      when(() => establishmentRepositoryMock.findBySlug("qualquer"))
          .thenAnswer((_) async => <Estabelecimento>[]);
      var response = await searchBySlug("qualquer");
      expect(response, isNotNull);
    });
    test(
        "Deve retornar uma lista vazia caso nao tenha sido passado nenhum texto",
        () async {
      when(() => establishmentRepositoryMock.findBySlug(""))
          .thenAnswer((_) async => <Estabelecimento>[]);
      var response = await searchBySlug("");
      expect(response, isNotNull);
    });
  });
}
