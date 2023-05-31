import 'package:donuz_dart_sdk/modules/coupon/coupon_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../mocks/coupon/repositories/coupon_repository_mock.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';
import '../../../mocks/user/user_cases/get_logged_user_token_mock.dart';

void main() {
  var couponRepositoryMock = CouponRepositoryMock();
  var findEstablishmentByIdMock = FindEstablismentByIdMock();
  var getLoggedUserTokenMock = GetLoggedUserTokenMock();
  var sendCoupon = SendCouponImpl(
      couponRepositoryMock, getLoggedUserTokenMock, findEstablishmentByIdMock);
  group("CouponStatus", () {
    test("Deve retornar os Status dos cupons inseridos", () async {
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
        () => couponRepositoryMock.sendCoupon(
          user: '12345678909',
          appId: '2234',
          url: 'https://test.com',
          token: '123',
        ),
      ).thenAnswer(
        (_) async => true,
      );
      var response =
          await sendCoupon(user: '12345678909', url: 'https://test.com');
      expect(response, isNotNull);
      expect(response, isA<bool>());
    });
  });
}
