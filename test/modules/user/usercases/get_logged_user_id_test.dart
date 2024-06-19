import 'package:donuz_dart_sdk/modules/user/usercases/get_logged_user_id.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../mocks/user/repositories/login_repository_mock.dart';

void main() {
  group("GetLoggedUserId", () {
    var repository = LoginRepositoryMock();

    var getUserToken = GetLoggedUserIdImpl(repository);
    test("Deve buscar o token do usuario logado", () async {
      when(
        () => repository.getLoggedUserId(),
      ).thenAnswer((_) async => "Token");
      var response = await getUserToken();
      expect(response, isNotNull);
    });
  });
}
