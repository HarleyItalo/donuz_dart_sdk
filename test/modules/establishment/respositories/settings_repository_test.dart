import 'dart:convert';

import 'package:donuz_dart_sdk/modules/common/common_module.dart';
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
      var response = await settingsRepository.findSetting('2234', false);
      expect(response, isNotNull);
    });
  });
}
