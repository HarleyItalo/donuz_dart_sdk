import 'dart:convert';
import 'package:donuz_dart_sdk/modules/prizes/prizes_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../json/prizes/prizes_json.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';
import '../../../mocks/prizes/repositories/prizes_repository_mock.dart';

void main() async {
  final prizesRepositoryMock = PrizesRepositoryMock();
  final findEstablismentByIdMock = FindEstablismentByIdMock();
  final getPrizes =
      GetPrizesImpl(prizesRepositoryMock, findEstablismentByIdMock);

  group("GetPrizes", () {
    test("Deve Buscar todos os premios de um estabelecimento", () async {
      when(() => prizesRepositoryMock.getPrizes("2234")).thenAnswer(
          (_) async => PrizeModel.fromJson(jsonDecode(prizesJson)).premios);
      when(() => findEstablismentByIdMock.currentId())
          .thenAnswer((_) async => "2234");

      var response = await getPrizes();
      expect(response, isNotNull);
      expect(response, isNotEmpty);
    });
    test(
        "Deve retornar uma lista vazia de premios quando o estabelecimento for nulo",
        () async {
      when(() => findEstablismentByIdMock.currentId())
          .thenAnswer((_) async => null);

      var response = await getPrizes();
      expect(response, isNull);
    });
    test(
        "Deve retornar uma lista vazia caso o estabelecimento não tenha banners",
        () async {
      when(() => findEstablismentByIdMock.currentId())
          .thenAnswer((_) async => "2234");

      when(() => prizesRepositoryMock.getPrizes("2234"))
          .thenAnswer((_) async => null);

      var response = await getPrizes();
      expect(response, isNull);
    });
  });
}
