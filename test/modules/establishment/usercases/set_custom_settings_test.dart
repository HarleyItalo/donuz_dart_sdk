import 'dart:convert';
import 'package:donuz_dart_sdk/modules/common/models/base_response_donuz_model.dart';
import 'package:donuz_dart_sdk/modules/establishment/usercases/set_custom_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../json/default_response_json.dart';
import '../../../mocks/establishment/repositories/settings_repository_mock.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';

void main() async {
  final settingsRepositoryMock = SettingsRepositoryMock();
  final findEstablismentByIdMock = FindEstablismentByIdMock();
  final setCustomConfig = SetCustomConfigImpl(
    settingsRepositoryMock,
    findEstablismentByIdMock,
  );

  group("SetCustomConfig", () {
    test("Deve buscar as configuracoes custom de um estabelecimento", () async {
      when(
        () => settingsRepositoryMock
            .setCustomConfig(appId: "2234", key: "123", data: {"obj": []}),
      ).thenAnswer((_) async =>
          BaseResponseDonuzModel.fromJson(jsonDecode(defaultResponseJson)));
      when(() => findEstablismentByIdMock.currentId())
          .thenAnswer((_) async => "2234");

      var response = await setCustomConfig(key: "123", data: {"obj": []});
      expect(response, isNotNull);
      expect(response, isA<BaseResponseDonuzModel>());
    });
  });
}
