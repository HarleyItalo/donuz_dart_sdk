import 'dart:convert';
import 'package:donuz_dart_sdk/modules/pdv/pdv_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../json/pdv/pdv_settings_json.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';
import '../../../mocks/pdv/repository/pdv_settings_repository_mock.dart';

void main() async {
  final pdvSettingRepositoryMock = PdvSettingRepositoryMock();
  final findEstablismentByIdMock = FindEstablismentByIdMock();
  final getPdvSettingsImpl =
      GetPdvSettingsImpl(pdvSettingRepositoryMock, findEstablismentByIdMock);

  group("FindEstablismnetBanners", () {
    test("Deve Buscar a configuracao de um estabelecimento", () async {
      when(() =>
          pdvSettingRepositoryMock
              .getPdvSettingsFromEstablishment("2234")).thenAnswer((_) async =>
          PdvSettingModel.fromJson(jsonDecode(pdvSettingsJson)).pdvSettings);
      when(() => findEstablismentByIdMock.currentId())
          .thenAnswer((_) async => "2234");

      var response = await getPdvSettingsImpl();
      expect(response, isNotNull);
      expect(response?.pdvSettingsId, greaterThan(0));
    });
    test("Deve uma instancia nula quando o estabelecimento for nulo", () async {
      when(() => findEstablismentByIdMock.currentId())
          .thenAnswer((_) async => null);

      var response = await getPdvSettingsImpl();
      expect(response, null);
    });
    test("Deve null caso não tenha configuracao", () async {
      when(() => findEstablismentByIdMock.currentId())
          .thenAnswer((_) async => "2234");

      when(() =>
              pdvSettingRepositoryMock.getPdvSettingsFromEstablishment("2234"))
          .thenAnswer((_) async => null);

      var response = await getPdvSettingsImpl();
      expect(response, null);
    });
  });
}
