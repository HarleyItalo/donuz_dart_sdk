import 'package:donuz_dart_sdk/modules/user/user_module.dart';
import 'package:donuz_dart_sdk/modules/user/usercases/make_login_only_key.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';
import '../../../mocks/user/repositories/login_repository_mock.dart';

void main() {
  group("MakeLogin", () {
    var repository = LoginRepositoryMock();
    var establishmentId = FindEstablismentByIdMock();
    var makeLogin = MakeLoginOnlyKeyImpl(repository, establishmentId);
    test("deve fazer login", () async {
      when(
        () => repository.makeLoginOnlyKey(key: "usuario", appId: "2234"),
      ).thenAnswer((_) async {
        return LoginModel(status: 200, mensagem: "OK", token: "123");
      });

      when(
        () => establishmentId.currentId(),
      ).thenAnswer((_) async => "2234");

      var response = await makeLogin(
        key: "usuario",
      );
      expect(response?.status, 200);
    });
    test("deve falhar ao login", () async {
      var response = await makeLogin(
        key: "",
      );
      expect(response, isNull);
    });

    test("deve falhar ao login", () async {
      when(
        () => establishmentId.currentId(),
      ).thenAnswer((_) async => null);
      var response = await makeLogin(
        key: "usuario",
      );
      expect(response, isNull);
    });
  });
}
