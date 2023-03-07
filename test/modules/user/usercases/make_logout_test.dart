import 'package:donuz_dart_sdk/modules/user/user_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../mocks/user/repositories/login_repository_mock.dart';

void main() {
  group("MakeLogout", () {
    var repository = LoginRepositoryMock();

    var makeLogout = MakeLogoutImpl(repository);
    test("Deve fazer logout", () async {
      when(
        () => repository.makeLogout(),
      ).thenAnswer((_) async => true);
      var response = await makeLogout();
      expect(response, true);
    });
  });
}
