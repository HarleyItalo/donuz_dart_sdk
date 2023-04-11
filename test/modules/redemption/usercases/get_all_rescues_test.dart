import 'dart:convert';

import 'package:donuz_dart_sdk/modules/establishment/establishment_module.dart';
import 'package:donuz_dart_sdk/modules/redemption/redemption_module.dart';
import 'package:donuz_dart_sdk/modules/user/user_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../json/redemptions/redemptions_json.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';
import '../../../mocks/redemption/repositories/rescue_repository_mock.dart';
import '../../../mocks/user/user_cases/get_logged_user_token_mock.dart';

main() {
  final FindEstablishmentById findEstablishmentByIdMock =
      FindEstablismentByIdMock();
  final GetLoggedUserToken getLoggedUserTokenMock = GetLoggedUserTokenMock();
  final RescueRepository repositoryMock = RescueRepositoryMock();

  final GetAllRescues getAllRescues = GetAllRescuesImpl(
      repositoryMock, findEstablishmentByIdMock, getLoggedUserTokenMock);
  group("getAllRescues", () {
    test("Deve retornar uma lista de resgates", () async {
      when(
        () => findEstablishmentByIdMock.currentId(),
      ).thenAnswer(
        (_) async => '2234',
      );
      when(
        () => getLoggedUserTokenMock(),
      ).thenAnswer((_) async => "123");
      when(
        () => repositoryMock.getRescuesFromClient(
            tokenCliente: '123', appId: '2234'),
      ).thenAnswer(
        (_) async => RescueModel.fromJson(jsonDecode(redemptionsJson)).resgates,
      );
      var response = await getAllRescues();
      expect(response, isNotNull);
      expect(response, isNotEmpty);
    });
    test("Deve retornar uma lista de resgates", () async {
      when(
        () => findEstablishmentByIdMock.currentId(),
      ).thenAnswer(
        (_) async => '2234',
      );
      when(
        () => getLoggedUserTokenMock(),
      ).thenAnswer((_) async => null);

      var response = await getAllRescues();
      expect(response, isNull);
    });
  });
}
