import 'dart:convert';

import 'package:donuz_dart_sdk/modules/establishment/establishment_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../json/establisment/regulation_json.dart';
import '../../../mocks/establishment/repositories/regulation_repository_mock.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';

void main() async {
  final regulationRepositoryMock = RegulationRepositoryMock();
  final findEstablismentByIdMock = FindEstablismentByIdMock();
  final getRegulation =
      GetRegulationImpl(regulationRepositoryMock, findEstablismentByIdMock);

  group("FindEstablismnetBanners", () {
    test("Deve buscar o regulamento de um estabelecimento", () async {
      when(() => regulationRepositoryMock.getRegulation(appId: "2234"))
          .thenAnswer((_) async =>
              RegulationModel.fromJson(jsonDecode(regulationJson)).regulation);
      when(() => findEstablismentByIdMock.currentId())
          .thenAnswer((_) async => "2234");

      var response = await getRegulation.call();
      expect(response, isNotNull);
      expect(response, isA<Regulation>());
    });
    test("Deve nulo quando o estabelecimento não estiver setado", () async {
      when(() => findEstablismentByIdMock.currentId())
          .thenAnswer((_) async => null);

      var response = await getRegulation();
      expect(response, isNull);
    });
    test(
        "Deve nulo quando o estabelecimento não estiver setado um regulamento ou tiver um problema de conexao",
        () async {
      when(() => findEstablismentByIdMock.currentId())
          .thenAnswer((_) async => "2234");

      when(() => regulationRepositoryMock.getRegulation(appId: "2234"))
          .thenAnswer((_) async => null);

      var response = await getRegulation();
      expect(response, isNull);
    });
  });
}
