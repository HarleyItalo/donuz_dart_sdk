import 'dart:convert';
import 'package:donuz_dart_sdk/modules/prizes/models/prize_category_model.dart';
import 'package:donuz_dart_sdk/modules/prizes/models/prize_model.dart';
import 'package:donuz_dart_sdk/modules/prizes/usercases/get_prize_by_id.dart';
import 'package:donuz_dart_sdk/modules/prizes/usercases/get_prize_categories.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../json/prizes/get_prize_by_id_json.dart';
import '../../../json/prizes/prizes_categories_json.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';
import '../../../mocks/prizes/repositories/prizes_repository_mock.dart';

void main() async {
  final prizesRepositoryMock = PrizesRepositoryMock();
  final findEstablismentByIdMock = FindEstablismentByIdMock();
  final getPrizesCategories =
      GetPrizesCategoriesImpl(prizesRepositoryMock, findEstablismentByIdMock);

  group("GetPrizes", () {
    test("Deve Buscar todos os premios de um estabelecimento", () async {
      when(() => prizesRepositoryMock.getPrizesCategories("2234")).thenAnswer(
          (_) async =>
              PrizeCategoryModel.fromJson(jsonDecode(prizesCategoriesJson)));
      when(() => findEstablismentByIdMock.currentId())
          .thenAnswer((_) async => "2234");

      var response = await getPrizesCategories("123");
      expect(response, isNotNull);
      expect(response, isA<PrizeCategoryModel>());
    });
  });
}
