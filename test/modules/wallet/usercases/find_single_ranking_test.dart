import 'dart:convert';
import 'package:donuz_dart_sdk/modules/establishment/establishment_module.dart';
import 'package:donuz_dart_sdk/modules/wallet/models/single_ranking_model.dart';
import 'package:donuz_dart_sdk/modules/wallet/usercases/find_single_ranking.dart';
import 'package:donuz_dart_sdk/modules/wallet/wallet_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../json/wallet/single_ranking_json.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';
import '../../../mocks/user/user_cases/get_logged_user_id_mock.dart';
import '../../../mocks/wallet/repositories/point_respository_mock.dart';

void main() {
  final PointsRepository repositoryMock = PointsRepositoryMock();
  FindEstablishmentById findEstablismentByIdMock = FindEstablismentByIdMock();
  var getLoggedUserIdMock = GetLoggedUserIdMock();

  FindSingleRanking findSingleRanking = FindSingleRankingImpl(
      repositoryMock, findEstablismentByIdMock, getLoggedUserIdMock);

  group("FindSingleRanking", () {
    test('Deve retornar o saldo do cliente', () async {
      when(
        () => repositoryMock.findSingleRanking(appId: '2234', personId: '123'),
      ).thenAnswer(
        (_) async => SingleRankingModel.fromJson(
          jsonDecode(singleRankingJson),
        ),
      );
      when(
        () => getLoggedUserIdMock(),
      ).thenAnswer(
        (_) async => '123',
      );
      when(
        () => findEstablismentByIdMock.currentId(),
      ).thenAnswer(
        (_) async => "2234",
      );
      var response = await findSingleRanking();
      expect(response?.rankingPersonInfo?.primeiroNome, isNotEmpty);
    });
  });
}
