import 'dart:convert';
import 'package:donuz_dart_sdk/modules/app/app_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../json/app/app_config_json.dart';
import '../../../mocks/app/repositories/app_config_repository_mock.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';
import '../../../mocks/user/user_cases/get_logged_user_token_mock.dart';

void main() {
  var repository = AppConfigRepositoryMock();
  var findEstablishmentByIdMock = FindEstablismentByIdMock();
  var getLoggedUserTokenMock = GetLoggedUserTokenMock();

  var findAppConfig = FindAppConfigImpl(repository, findEstablishmentByIdMock);
  group("FindAppConfig", () {
    test("Deve retornar a configuracao do aplicativo do estabelecimento",
        () async {
      when(
        () => findEstablishmentByIdMock.currentId(),
      ).thenAnswer(
        (_) async => '2234',
      );
      when(
        () => getLoggedUserTokenMock(),
      ).thenAnswer(
        (_) async => "123",
      );
      when(
        () => repository.findAppConfig(appId: "2234"),
      ).thenAnswer(
        (_) async => AppConfigModel.fromJson(
          jsonDecode(appConfigJson),
        ),
      );

      var response = await findAppConfig();
      expect(response, isNotNull);
    });
  });
}
