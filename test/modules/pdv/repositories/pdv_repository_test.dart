import 'dart:convert';
import 'package:donuz_dart_sdk/modules/common/common_module.dart';
import 'package:donuz_dart_sdk/modules/pdv/repositories/pdv_settings_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../json/pdv/pdv_settings_json.dart';
import '../../../mocks/common/services/http_service_mock.dart';

void main() async {
  HttpService httpService = HttpServiceMock();
  SharedPreferences.setMockInitialValues({});
  group("PdvRepository", () {
    test("Deve buscar a config do estabelecimento", () async {
      when(() => httpService.get("pdv-settings", appId: "2234"))
          .thenAnswer((_) async => jsonDecode(pdvSettingsJson));
      var repository = PdvSettingsRepositoryImpl(httpService);
      var response = await repository.getPdvSettingsFromEstablishment("2234");

      expect(response, isNotNull);
      expect(response?.pdvSettingsId, greaterThan(0));
    });
    test("Deve retornar uma lista vazia", () async {
      when(() => httpService.get("pdv-settings", appId: "2234"))
          .thenAnswer((_) async => <String, dynamic>{});
      var repository = PdvSettingsRepositoryImpl(httpService);
      var response = await repository.getPdvSettingsFromEstablishment("2234");

      expect(response, null);
    });
  });
}
