import 'dart:convert';

import 'package:donuz_dart_sdk/modules/common/config/config.dart';
import 'package:donuz_dart_sdk/modules/nfe/models/action_model.dart';
import 'package:donuz_dart_sdk/modules/nfe/models/nfe_status_result_model.dart';
import 'package:donuz_dart_sdk/modules/nfe/repositories/nfe_repository_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../json/default_response_json.dart';
import '../../../json/nfe/get_nfe_status_json.dart';
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
        (_) async => jsonDecode(defaultResponseIntegrationServerJson),
      );

      var response = await repository.sendNfe(action: actionModel);

      expect(response, isNotNull);
      expect(response, isA<(bool, String?)>());
    });
    test("Deve retornar o historico de NFE", () async {
      when(
        () => httpServiceMock.get(
            "${config.integrationServer}/api/actions/nfe/status/person/12345678909",
            appId: "2234"),
      ).thenAnswer(
        (_) async => jsonDecode(getNfeStatusJson),
      );

      var response = await repository.getNfeActionResult(
          establismentId: "2234", cpf: '12345678909');

      expect(response, isNotNull);
      expect(response, isA<NfeStatusResultModel>());
    });
  });
}
