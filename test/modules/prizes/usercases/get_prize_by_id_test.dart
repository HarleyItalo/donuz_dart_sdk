import 'dart:convert';
import 'package:donuz_dart_sdk/modules/prizes/models/prize_model.dart';
import 'package:donuz_dart_sdk/modules/prizes/usercases/get_prize_by_id.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../json/prizes/get_prize_by_id_json.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';
import '../../../mocks/prizes/repositories/prizes_repository_mock.dart';

void main() async {
  final prizesRepositoryMock = PrizesRepositoryMock();
  final findEstablismentByIdMock = FindEstablismentByIdMock();
  final getPrizes =
      GetPrizeByIdImpl(prizesRepositoryMock, findEstablismentByIdMock);

  group("GetPrizes", () {
    test("Deve Buscar todos os premios de um estabelecimento", () async {
      when(() => prizesRepositoryMock.getPrizeById("123", "2234")).thenAnswer(
          (_) async =>
              PrizeInfoModel.fromJson(jsonDecode(getPrizeByIdJson)).prize);
      when(() => findEstablismentByIdMock.currentId())
          .thenAnswer((_) async => "2234");

      var response = await getPrizes("123");
      expect(response, isNotNull);
      expect(response, isA<PrizeInfo>());
    });
  });
}
