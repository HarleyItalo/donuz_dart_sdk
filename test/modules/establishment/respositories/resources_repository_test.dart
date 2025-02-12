import 'dart:convert';
import 'package:donuz_dart_sdk/modules/establishment/repositories/resources_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../json/establisment/resources_json.dart';
import '../../../mocks/common/services/http_service_mock.dart';

void main() async {
  var httpService = HttpServiceMock();
  SharedPreferences.setMockInitialValues({});
  final repository = ResourcesRepositoryImpl(httpService);
  group("resourcesRepository", () {
    test("Deve encontrar os recursos contrados", () async {
      when(() => httpService.get(
            "recurso/contratados",
            appId: "2234",
          )).thenAnswer((_) async => jsonDecode(resourcesJson));
      var response = await repository.getResourcesHired(appId: "2234");
      expect(response, isNotNull);
    });
  });
}
