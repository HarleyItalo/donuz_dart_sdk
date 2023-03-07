import 'package:donuz_dart_sdk/modules/user/usercases/get_logged_user_token.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../mocks/user/repositories/login_repository_mock.dart';

void main() {
  group("GetLoggedUserToken", () {
    var repository = LoginRepositoryMock();

    var getUserToken = GetLoggedUserTokenImpl(repository);
    test("Deve buscar o token do usuario logado", () async {
      when(
        () => repository.getLoggedUserToken(),
      ).thenAnswer((_) async => "Token");
      var response = await getUserToken();
      expect(response, isNotNull);
    });
  });
}
