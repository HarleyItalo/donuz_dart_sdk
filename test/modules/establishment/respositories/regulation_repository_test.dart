import 'dart:convert';
import 'package:donuz_dart_sdk/modules/common/common_module.dart';
import 'package:donuz_dart_sdk/modules/establishment/establishment_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../json/establisment/regulation_json.dart';
import '../../../mocks/common/services/http_service_mock.dart';

void main() async {
  var httpService = HttpServiceMock();
  SharedPreferences.setMockInitialValues({});
  StorageService storageService =
      StorageService(await SharedPreferences.getInstance());
  final repository = RegulationRepositoryImpl(httpService, storageService);
  group("RegulationRepository", () {
    test("Deve buscar o regulamento e como funciona", () async {
      when(() => httpService.get(
            "estabelishment?fields=descricao_programa,regulamento",
            appId: "2234",
          )).thenAnswer((_) async => jsonDecode(regulationJson));
      var response = await repository.getRegulation(appId: "2234");
      expect(response, isNotNull);
      expect(response?.comoFunciona, isNotEmpty);
    });
  });
}
