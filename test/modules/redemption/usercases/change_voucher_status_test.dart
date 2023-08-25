import 'dart:convert';

import 'package:donuz_dart_sdk/modules/establishment/establishment_module.dart';
import 'package:donuz_dart_sdk/modules/redemption/redemption_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../json/redemptions/rescue_json.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';
import '../../../mocks/redemption/repositories/rescue_repository_mock.dart';

main() {
  final FindEstablishmentById findEstablishmentByIdMock =
      FindEstablismentByIdMock();
  final RescueRepository repositoryMock = RescueRepositoryMock();

  final ChangeVoucherStatus changeVoucherStatus =
      ChangeVoucherStatusImpl(repositoryMock, findEstablishmentByIdMock);
  group("ChangeVoucherStatus", () {
    test("Deve trocar o status de um voucher", () {
      when(
        () => findEstablishmentByIdMock.currentId(),
      ).thenAnswer(
        (_) async => '2234',
      );
      when(
        () => repositoryMock.changeVoucherStatus(
          appId: "2234",
          newStatus: 'utlizado',
          idRedeemption: 1234,
        ),
      ).thenAnswer(
          (invocation) async => RescueModel.fromJson(jsonDecode(rescueJson)));
      var response = changeVoucherStatus(
        appId: "2234",
        newStatus: 'utlizado',
        redeemptionId: 1234,
      );
      expect(response, isNotNull);
    });
  });
}
