import 'dart:convert';

import 'package:donuz_dart_sdk/modules/coupon/coupon_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../json/coupon/coupon_json.dart';
import '../../../mocks/coupon/repositories/coupon_repository_mock.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';

void main() {
  var couponRepositoryMock = CouponRepositoryMock();
  var findEstablishmentByIdMock = FindEstablismentByIdMock();
  var couponStatus =
      CouponStatusImpl(couponRepositoryMock, findEstablishmentByIdMock);
  group("CouponStatus", () {
    test("Deve retornar os Status dos cupons inseridos", () async {
      when(
        () => findEstablishmentByIdMock.currentId(),
      ).thenAnswer(
        (_) async => '2234',
      );
      when(
        () => couponRepositoryMock.couponStatus(
            user: '12345678909', appId: '2234'),
      ).thenAnswer(
        (_) async => CouponStatusModel.fromJson(
          jsonDecode(couponJson),
        ),
      );
      var response = await couponStatus(user: '12345678909');
      expect(response, isNotNull);
      expect(response, isA<CouponStatusModel>());
    });
  });
}
