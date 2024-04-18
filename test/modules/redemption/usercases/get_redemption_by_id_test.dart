import 'dart:convert';

import 'package:donuz_dart_sdk/modules/establishment/establishment_module.dart';
import 'package:donuz_dart_sdk/modules/redemption/redemption_module.dart';
import 'package:donuz_dart_sdk/modules/redemption/usercases/get_redemption_by_id.dart';
import 'package:donuz_dart_sdk/modules/user/user_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../json/redemptions/rescue_json.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';
import '../../../mocks/redemption/repositories/rescue_repository_mock.dart';
import '../../../mocks/user/user_cases/get_logged_user_token_mock.dart';

main() {
  final FindEstablishmentById findEstablishmentByIdMock =
      FindEstablismentByIdMock();
  final GetLoggedUserToken getLoggedUserTokenMock = GetLoggedUserTokenMock();
  final RescueRepository repositoryMock = RescueRepositoryMock();

  final GetRedemptionById getRedemptionById =
      GetRedemptionByIdImpl(repositoryMock, findEstablishmentByIdMock);
  group("GetRedemptionById", () {
    test("Deve resgatar um premio", () {
      when(
        () => findEstablishmentByIdMock.currentId(),
      ).thenAnswer(
        (_) async => '2234',
      );
      when(
        () => getLoggedUserTokenMock(),
      ).thenAnswer(
        (_) async => "123",
      );
      when(
        () => repositoryMock.getRescueById(
          id: "1",
          appId: "2234",
        ),
      ).thenAnswer(
          (invocation) async => RescueModel.fromJson(jsonDecode(rescueJson)));
      var response = getRedemptionById(
        rescueId: "1",
      );
      expect(response, isNotNull);
    });
  });
}
