import 'dart:convert';

import 'package:donuz_dart_sdk/modules/app/app_module.dart';
import 'package:donuz_dart_sdk/modules/common/common_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../json/app/app_config_json.dart';
import '../../../mocks/common/services/http_service_mock.dart';

void main() async {
  HttpService httpService = HttpServiceMock();
  AppConfigRepository repository = AppConfigRepositoryImpl(httpService);

  group("AppConfigRepository", () {
    test("Deve buscar a config do app", () async {
      when(() => httpService.get("app/config", appId: "2234"))
          .thenAnswer((_) async => jsonDecode(appConfigJson));
      var response = await repository.findAppConfig(appId: '2234');
      expect(response, isNotNull);
      expect(response.appConfig?.estabelecimentoId, 2234);
    });
  });
}
