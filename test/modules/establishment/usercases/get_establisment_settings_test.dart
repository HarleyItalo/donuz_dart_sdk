import 'dart:convert';

import 'package:donuz_dart_sdk/modules/establishment/establishment_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../json/establisment/settings_json.dart';

import '../../../mocks/establishment/repositories/settings_repository_mock.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';
import '../../../mocks/user/user_cases/get_logged_user_token_mock.dart';

void main() async {
  final settingsRepositoryMock = SettingsRepositoryMock();
  final findEstablismentByIdMock = FindEstablismentByIdMock();
  final getLoggedUserTokenMock = GetLoggedUserTokenMock();
  final getEstablishmentSettings = GetEstablishmentSettingsImpl(
    settingsRepositoryMock,
    findEstablismentByIdMock,
    getLoggedUserTokenMock,
  );

  group("GetEstablismentSettings", () {
    test("Deve buscar as configuracoes de um estabelecimento", () async {
      when(
        () => getLoggedUserTokenMock(),
      ).thenAnswer((_) async => "123");
      when(
        () => settingsRepositoryMock.findSetting(appId: "2234", isLogged: true),
      ).thenAnswer((_) async =>
          SettingsModel.fromJson(jsonDecode(settingsJson)).configuracoes);
      when(() => findEstablismentByIdMock.currentId())
          .thenAnswer((_) async => "2234");

      var response = await getEstablishmentSettings();
      expect(response, isNotNull);
      expect(response, isA<Configuracoes>());
    });
  });
}
