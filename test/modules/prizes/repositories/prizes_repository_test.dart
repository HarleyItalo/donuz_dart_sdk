import 'dart:convert';

import 'package:donuz_dart_sdk/modules/common/common_module.dart';
import 'package:donuz_dart_sdk/modules/prizes/prizes_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../json/prizes/prizes_json.dart';
import '../../../mocks/common/services/http_service_mock.dart';

void main() async {
  HttpService httpService = HttpServiceMock();
  var repository = PrizeRepositoryImpl(httpService);
  group("PrizesRepository", () {
    test("Deve buscar todos os premios do estabelecimento", () async {
      when(() => httpService.get("prizes", appId: "2234"))
          .thenAnswer((_) async => jsonDecode(prizesJson));

      var response = await repository.getPrizes("2234");
      expect(response, isNotNull);
      expect(response, isNotEmpty);
      expect(response, isA<List<Prize>>());
    });
    test("Deve retornar uma lista vazia de premios", () async {
      when(() => httpService.get("prizes", appId: "2234"))
          .thenAnswer((_) async => {});

      var response = await repository.getPrizes("2234");
      expect(response, isNull);
    });
  });
}
