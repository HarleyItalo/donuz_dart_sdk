import 'dart:convert';
import 'package:donuz_dart_sdk/modules/establishment/establishment_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../json/establisment/settings_json.dart';
import '../../../mocks/common/services/http_service_mock.dart';

void main() {
  var httpServiceMock = HttpServiceMock();
  SettingsRepository settingsRepository =
      SettingsRepositoryImpl(httpServiceMock);
  group("SettingsRepository", () {
    test("Deve buscar as configuracoes", () async {
      when(
        () => httpServiceMock.get("settings/cadastro", appId: '2234'),
      ).thenAnswer(
        (_) async => jsonDecode(settingsJson),
      );
      var response = await settingsRepository.findSetting(appId: '2234');
      expect(response, isNotNull);
    });
    test("Deve buscar as configuracoes", () async {
      when(
        () => httpServiceMock.get("settings/meus-dados", appId: '2234'),
      ).thenAnswer(
        (_) async => jsonDecode(settingsJson),
      );
      var response =
          await settingsRepository.findSetting(appId: '2234', isLogged: true);
      expect(response, isNotNull);
    });

    test("Deve buscar as configuracoes custom", () async {
      when(
        () => httpServiceMock.get("custom/config",
            headers: {"custom-key": "abc"}, appId: '2234'),
      ).thenAnswer(
        (_) async => jsonDecode(settingsJson),
      );
      var response =
          await settingsRepository.getCustomConfig(appId: '2234', key: 'abc');

      expect(response, isNotNull);
    });

    test("Deve adicionar as configuracoes custom", () async {
      when(
        () => httpServiceMock.post("custom/config", {"obj": []},
            headers: {"custom-key": "abc"}, appId: '2234'),
      ).thenAnswer(
        (_) async => jsonDecode(settingsJson),
      );
      var response = await settingsRepository.setCustomConfig(
        appId: '2234',
        key: 'abc',
        data: {"obj": []},
      );

      expect(response, isNotNull);
    });
  });
}
