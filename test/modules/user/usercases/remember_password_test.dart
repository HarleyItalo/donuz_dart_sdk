import 'package:donuz_dart_sdk/modules/user/user_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';
import '../../../mocks/user/repositories/login_repository_mock.dart';

void main() {
  group("RememberPassword", () {
    var repository = LoginRepositoryMock();
    var establishmentId = FindEstablismentByIdMock();
    var rememberPassword = RememberPasswordImpl(repository, establishmentId);
    test("Deve fazer logout", () async {
      when(
        () => repository.rememberPassword(
            email: "teste@teste.com", appId: "2234"),
      ).thenAnswer((_) async => "");
      when(
        () => establishmentId.currentId(),
      ).thenAnswer((_) async => "2234");
      var response = await rememberPassword(email: "teste@teste.com");
      expect(response, '');
    });
  });
}
