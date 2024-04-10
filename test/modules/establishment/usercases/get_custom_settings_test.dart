import 'dart:convert';
import 'package:donuz_dart_sdk/modules/establishment/models/custom_config_model.dart';
import 'package:donuz_dart_sdk/modules/establishment/usercases/get_custom_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../json/establisment/custom_config_json.dart';
import '../../../mocks/establishment/repositories/settings_repository_mock.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';

void main() async {
  final settingsRepositoryMock = SettingsRepositoryMock();
  final findEstablismentByIdMock = FindEstablismentByIdMock();
  final getCustomConfig = GetCustomConfigImpl(
    settingsRepositoryMock,
    findEstablismentByIdMock,
  );

  group("GetEstablismentSettings", () {
    test("Deve buscar as configuracoes custom de um estabelecimento", () async {
      when(
        () => settingsRepositoryMock.getCustomConfig(appId: "2234", key: "123"),
      ).thenAnswer((_) async =>
          CustomConfigModel.fromJson(jsonDecode(customConfigJson)));
      when(() => findEstablismentByIdMock.currentId())
          .thenAnswer((_) async => "2234");

      var response = await getCustomConfig(key: "123");
      expect(response, isNotNull);
      expect(response, isA<CustomConfigModel>());
    });
  });
}
