import 'dart:convert';

import 'package:donuz_dart_sdk/modules/common/config/config.dart';
import 'package:donuz_dart_sdk/modules/coupon/coupon_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../json/coupon/coupon_json.dart';
import '../../../json/coupon/send_coupon_json.dart';
import '../../../mocks/common/services/http_service_mock.dart';

void main() {
  HttpServiceMock httpServiceMock = HttpServiceMock();
  var config = DonuzConfig(donuzToken: '123', appId: '2234');
  var repository = CouponRepositoryImpl(httpServiceMock, config);
  group("CouponRepository", () {
    test("Deve retornar os status dos cupons", () async {
      when(
        () => httpServiceMock.get(
          "${config.integrationServer}/nfce/123",
          headers: {
            "estabelecimentoId": '2234',
            "token": config.donuzToken,
            "content-type": "application/json"
          },
          useDonuzToken: false,
        ),
      ).thenAnswer(
        (_) async => jsonDecode(couponJson),
      );
      var response = await repository.couponStatus(user: '123', appId: '2234');
      expect(response, isNotNull);
      expect(response, isA<CouponStatusModel>());
    });
    test("Deve enviar um cupom para validacao", () async {
      when(
        () => httpServiceMock.post(
          "${config.integrationServer}/nfce",
          {
            "url": 'http://url.com',
            "codigoCliente": '12345678909',
            "estabelecimentoId": '2234',
            'TokenCliente': '123'
          },
          headers: {
            "estabelecimentoId": '2234',
            "token": config.donuzToken,
            "content-type": "application/json"
          },
          useDonuzToken: false,
        ),
      ).thenAnswer(
        (_) async => jsonDecode(sendCouponJosn),
      );
      var response = await repository.sendCoupon(
        user: '12345678909',
        appId: '2234',
        url: 'http://url.com',
        token: '123',
      );
      expect(response, isNotNull);
      expect(response, isA<bool>());
      expect(response, true);
    });
  });
}
