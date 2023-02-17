import 'package:donuz_dart_sdk/modules/establishment/establishment_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../mocks/establishment/repositories/establishment_repository_mock.dart';

void main() async {
  final establishmentRepositoryMock = EstablishmentRepositoryMock();
  final searchMyLocales = SearchMyLocalesImpl(establishmentRepositoryMock);

  group("Search My Locales", () {
    test("Deve retornar os estabelecimentos passando o Token de autenticacao",
        () async {
      when(() => establishmentRepositoryMock.findMyLocals("token"))
          .thenAnswer((_) async => <Estabelecimento>[]);
      var response = await searchMyLocales("token");
      expect(response, isNotNull);
    });
  });
}
