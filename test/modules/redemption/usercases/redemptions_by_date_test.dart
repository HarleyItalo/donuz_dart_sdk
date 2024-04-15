import 'dart:convert';
import 'package:donuz_dart_sdk/modules/establishment/establishment_module.dart';
import 'package:donuz_dart_sdk/modules/redemption/models/redemptions_by_date_model.dart';
import 'package:donuz_dart_sdk/modules/redemption/redemption_module.dart';
import 'package:donuz_dart_sdk/modules/redemption/usercases/redemption_by_date.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../json/redemptions/redemptions_by_date_json.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';
import '../../../mocks/redemption/repositories/rescue_repository_mock.dart';

main() {
  final FindEstablishmentById findEstablishmentByIdMock =
      FindEstablismentByIdMock();
  final RescueRepository repositoryMock = RescueRepositoryMock();

  final redemptionsByDate =
      RedemptionsByDateImpl(findEstablishmentByIdMock, repositoryMock);
  group("GetRedemptionsByDate", () {
    test("Deve retornar uma lista de resgates", () async {
      var date = DateTime.now();
      when(
        () => findEstablishmentByIdMock.currentId(),
      ).thenAnswer(
        (_) async => '2234',
      );
      when(
        () => repositoryMock.redemptionsByDate(
            startDate: date, page: 0, appId: '2234'),
      ).thenAnswer(
        (_) async =>
            RedemptionsByDateModel.fromJson(jsonDecode(redemptionsByDateJson)),
      );
      var response = await redemptionsByDate(initialDate: date, page: 0);
      expect(response, isNotNull);
    });
    test("Deve retornar uma lista de resgates vazia", () async {
      var date = DateTime.now();
      when(
        () => findEstablishmentByIdMock.currentId(),
      ).thenAnswer(
        (_) async => '2234',
      );

      when(
        () => repositoryMock.redemptionsByDate(
            startDate: date, page: 0, appId: '2234'),
      ).thenAnswer((_) async => RedemptionsByDateModel.fromJson({}));

      var response = await redemptionsByDate(initialDate: date);
      expect(response, isNotNull);
      expect(response?.vouchers, isNull);
    });
  });
}
