import 'dart:convert';
import 'package:donuz_dart_sdk/modules/establishment/establishment_module.dart';
import 'package:donuz_dart_sdk/modules/wallet/models/ranking_model.dart';
import 'package:donuz_dart_sdk/modules/wallet/usercases/find_ranking.dart';
import 'package:donuz_dart_sdk/modules/wallet/wallet_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../json/wallet/ranking_json.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';
import '../../../mocks/wallet/repositories/point_respository_mock.dart';

void main() {
  final PointsRepository repositoryMock = PointsRepositoryMock();
  FindEstablishmentById findEstablismentByIdMock = FindEstablismentByIdMock();
  FindRanking findRanking =
      FindRankingImpl(repositoryMock, findEstablismentByIdMock);

  group("FindRanking", () {
    test('Deve retornar o saldo do cliente', () async {
      when(
        () => repositoryMock.findRanking(
          appId: '2234',
        ),
      ).thenAnswer(
        (_) async => RankingModel.fromJson(
          jsonDecode(rankingJson),
        ),
      );
      when(
        () => findEstablismentByIdMock.currentId(),
      ).thenAnswer(
        (_) async => "2234",
      );
      var response = await findRanking();
      expect(response?.ranking, isNotEmpty);
    });
  });
}
