import 'dart:convert';

import 'package:donuz_dart_sdk/modules/establishment/establishment_module.dart';
import 'package:donuz_dart_sdk/modules/establishment/usercases/get_hired_resources.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../json/establisment/resources_json.dart';
import '../../../mocks/establishment/repositories/resources_repository_mock.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';

void main() async {
  final resourcesRepository = ResourcesRepositoryMock();
  final findEstablismentByIdMock = FindEstablismentByIdMock();
  final getResourcesHired =
      GetHiredResourcesImpl(resourcesRepository, findEstablismentByIdMock);

  group("FindEstablismnetBanners", () {
    test("Deve buscar os recursos de um estabelecimento", () async {
      when(() => resourcesRepository.getResourcesHired(appId: "2234"))
          .thenAnswer((_) async =>
              HiredResourcesModel.fromJson(jsonDecode(resourcesJson)));
      when(() => findEstablismentByIdMock.currentId())
          .thenAnswer((_) async => "2234");

      var response = await getResourcesHired.call();
      expect(response, isNotNull);
      expect(response, isA<HiredResourcesModel>());
    });
    test("Deve nulo quando o estabelecimento não estiver setado", () async {
      when(() => findEstablismentByIdMock.currentId())
          .thenAnswer((_) async => null);

      var response = await getResourcesHired();
      expect(response, isNull);
    });
    test(
        "Deve nulo quando o estabelecimento não estiver setado os recursos ou tiver um problema de conexao",
        () async {
      when(() => findEstablismentByIdMock.currentId())
          .thenAnswer((_) async => "2234");

      when(() => resourcesRepository.getResourcesHired(appId: "2234"))
          .thenAnswer((_) async => null);

      var response = await getResourcesHired();
      expect(response, isNull);
    });
  });
}
