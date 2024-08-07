import 'dart:convert';

import 'package:donuz_dart_sdk/modules/common/config/config.dart';
import 'package:donuz_dart_sdk/modules/nfe/models/action_model.dart';
import 'package:donuz_dart_sdk/modules/nfe/repositories/nfe_repository_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../json/coupon/coupon_json.dart';
import '../../../mocks/common/services/http_service_mock.dart';

void main() {
  HttpServiceMock httpServiceMock = HttpServiceMock();
  var config = DonuzConfig(donuzToken: '123', appId: '2234');
  var repository = NfeRepositoryImpl(httpServiceMock, config);
  group("NfeRepository", () {
    test("Deve criar um action de NFE", () async {
      var actionModel = ActionModel(
          establishmentId: 2234,
          actionParamms:
              ActionParamms(nfeAccessKey: "123", cpf: "12345678909"));
      when(
        () => httpServiceMock.post(
            "${config.integrationServer}/api/actions/create",
            actionModel.toJson(),
            appId: "2234"),
      ).thenAnswer(
        (_) async => jsonDecode(couponJson),
      );

      var response = await repository.sendNfe(action: actionModel);

      expect(response, isNotNull);
      expect(response, isA<(bool, String?)>());
    });
  });
}
