import 'package:donuz_dart_sdk/modules/establishment/establishment_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../mocks/establishment/repositories/establishment_repository_mock.dart';
import '../../../mocks/user/user_cases/get_logged_user_token_mock.dart';

void main() async {
  final establishmentRepositoryMock = EstablishmentRepositoryMock();
  final getLoggedUserTokenMock = GetLoggedUserTokenMock();
  final searchMyLocales =
      SearchMyLocalesImpl(establishmentRepositoryMock, getLoggedUserTokenMock);

  group("Search My Locales", () {
    test("Deve retornar os estabelecimentos passando o Token de autenticacao",
        () async {
      when(() => getLoggedUserTokenMock()).thenAnswer((_) async => "123");
      when(() => establishmentRepositoryMock.findMyLocals("123"))
          .thenAnswer((_) async => <Estabelecimento>[]);
      var response = await searchMyLocales();
      expect(response, isNotNull);
    });
    test("Deve retornar os estabelecimentos passando o Token de autenticacao",
        () async {
      when(() => getLoggedUserTokenMock()).thenAnswer((_) async => null);
      when(() => establishmentRepositoryMock.findMyLocals("123"))
          .thenAnswer((_) async => <Estabelecimento>[]);
      var response = await searchMyLocales();
      expect(response, isEmpty);
    });
  });
}
