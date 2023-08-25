import 'dart:convert';
import 'package:donuz_dart_sdk/modules/establishment/establishment_module.dart';
import 'package:donuz_dart_sdk/modules/wallet/wallet_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../json/wallet/rules_json.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';
import '../../../mocks/wallet/repositories/point_respository_mock.dart';

void main() {
  final PointsRepository repositoryMock = PointsRepositoryMock();
  FindEstablishmentById findEstablismentByIdMock = FindEstablismentByIdMock();
  GetPointsRule getPointsRule =
      GetPointsRuleImpl(repositoryMock, findEstablismentByIdMock);

  group("GetPointsRule", () {
    test('Deve retornar o saldo do cliente', () async {
      when(
        () => repositoryMock.getPointsRule(
          appId: '2234',
        ),
      ).thenAnswer(
        (_) async => PointsRulesModel.fromJson(
          jsonDecode(rulesJson),
        ),
      );
      when(
        () => findEstablismentByIdMock.currentId(),
      ).thenAnswer(
        (_) async => "2234",
      );
      var response = await getPointsRule();
      expect(response?.regras, isNotEmpty);
    });
  });
}
